'use strict';
const {app,BrowserWindow}=require('electron'),fs=require('fs'),path=require('path'),os=require('os');
const {newMap}=require('../map-format.cjs');
app.setPath('userData',fs.mkdtempSync(path.join(os.tmpdir(),'ody-shadow-ui-')));app.commandLine.appendSwitch('disable-gpu');
const delay=ms=>new Promise(r=>setTimeout(r,ms));
app.whenReady().then(async()=>{let win,failed=false;const errors=[];try{
 win=new BrowserWindow({show:false,width:1100,height:800,webPreferences:{nodeIntegration:true,contextIsolation:false,offscreen:true,backgroundThrottling:false}});
 win.webContents.on('console-message',(_,level,message)=>{if(level===3)errors.push(message);});
 await win.loadFile(path.join(__dirname,'src/test-combat-ui.html'));
 const map=newMap(12,12);
 await win.webContents.executeJavaScript(`
  window.shadowSamples=0;window.shadowErrors=[];window.shadowSizes=new Set();window.groundShadow=null;
  const ctx=document.querySelector('canvas').getContext('2d'),ellipse=ctx.ellipse,drawImage=ctx.drawImage;
  ctx.ellipse=function(x,y,rx,ry,...rest){groundShadow={x,y,rx,ry};return ellipse.call(this,x,y,rx,ry,...rest);};
  ctx.drawImage=function(image,...args){if(image.src?.endsWith('/sprites.png')&&args.length===8){const [sx,sy,sw,sh,x,y,w,h]=args;shadowSamples++;shadowSizes.add(w);if(!groundShadow||Math.abs(groundShadow.x-(x+w/2))>.01||Math.abs(groundShadow.y-(y+h))>h*.04||groundShadow.y+groundShadow.ry<y+h)shadowErrors.push({groundShadow,x,y,w,h});}return drawImage.call(this,image,...args);};
  feed(0,${JSON.stringify({...map,tiles:map.blocked,self:1,centerX:5,centerY:6,teleport:true,stepMs:150})});
  feed(2,{hp:42,maxHP:42,dead:false,mode:'story',difficulty:'normal',inventory:Array(20).fill(null),quests:[],journal:[]});
  window.actors=(direction,x=5)=>[{id:1,name:'Player',sprite:1,x,y:6,hp:42,maxHP:42,direction},{id:-1,name:'Creature',sprite:2,monster:true,x:x+1,y:6,hp:30,maxHP:30,direction}];feed(1,actors(2));
 `);
 for(let i=0;i<60;i++){if(await win.webContents.executeJavaScript('shadowSamples>0'))break;await delay(50);}
 for(const [zoomKey,presses] of [['Equal',8],['Minus',12],['Equal',4]]){
  await win.webContents.executeJavaScript(`for(let i=0;i<${presses};i++){window.dispatchEvent(new KeyboardEvent('keydown',{code:'${zoomKey}'}));window.dispatchEvent(new KeyboardEvent('keyup',{code:'${zoomKey}'}));}`);await delay(80);
 }
 for(let direction=0;direction<4;direction++){
  await win.webContents.executeJavaScript(`feed(1,actors(${direction},${5+direction%2}));`);await delay(65);
 }
 const result=await win.webContents.executeJavaScript(`(()=>{if(!shadowSamples)throw Error('Sprites did not render');if(shadowErrors.length)throw Error('Detached shadow: '+JSON.stringify(shadowErrors[0]));for(const z of [16,32,64])if(!shadowSizes.has(z))throw Error('Zoom not checked: '+z);return 'PASS: player and creature shadows overlap sprite feet while idle and moving in all four directions at 16/32/64 zoom ('+shadowSamples+' rendered samples).';})()`);
 if(errors.length)throw Error(errors.join('\n'));
 fs.writeFileSync(path.join(__dirname,'../shadow-preview.png'),(await win.webContents.capturePage()).toPNG());fs.writeFileSync(path.join(__dirname,'../shadow-ui-test-result.txt'),result);console.log(result);
 }catch(e){failed=true;fs.writeFileSync(path.join(__dirname,'../shadow-ui-test-result.txt'),String(e)+'\n'+errors.join('\n'));}finally{if(win)win.destroy();app.exit(failed?1:0);}
});
