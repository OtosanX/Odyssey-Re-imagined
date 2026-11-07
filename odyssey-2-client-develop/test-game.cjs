let failed=false;
const {app,BrowserWindow}=require('electron'),fs=require('fs'),path=require('path'),os=require('os'),{spawn}=require('child_process');
const root=path.resolve(__dirname,'..'),tmp=fs.mkdtempSync(path.join(os.tmpdir(),'ody-client-test-'));
process.env.ODYSSEY_PORT='15752';process.env.ODYSSEY_WEB_PORT='0';app.setPath('userData',path.join(tmp,'profile'));app.commandLine.appendSwitch('disable-gpu');
fs.copyFileSync(path.join(root,'odyssey-2-server-develop/data/classic-world.json'),path.join(tmp,'classic-world.json'));
fs.writeFileSync(path.join(tmp,'config.json'),JSON.stringify({game:{accounts:{file:'accounts.data'}},server:{port:15752,adminPort:13002,dataFolder:tmp,interval:100},scripts:{directory:'scripts'}}));
let server,win;const errors=[];
const delay=ms=>new Promise(r=>setTimeout(r,ms));
app.whenReady().then(async()=>{
 try{
 server=spawn(path.join(process.env.ProgramFiles,'nodejs/node.exe'),['bin/odyssey.js','-c',path.join(tmp,'config.json')],{cwd:path.join(root,'odyssey-2-server-develop'),windowsHide:true,stdio:'ignore'});await delay(1000);
 win=new BrowserWindow({show:false,width:1400,height:900,webPreferences:{nodeIntegration:true,contextIsolation:false,offscreen:true,backgroundThrottling:false}});
 win.webContents.on('console-message',(_,level,message)=>{if(level===3)errors.push(message);});
 await win.loadFile(path.join(__dirname,'src/index.html'));await delay(300);
 await win.webContents.executeJavaScript(`new Promise((resolve,reject)=>{const handler=msg=>{if(msg.system===1&&msg.id===0){net.removeListener('message',handler);msg.data[0]===0?resolve():reject(Error('registration failed'));}};net.on('message',handler);net.send(1,0,Buffer.from('render_test\\0password123'));})`);
 await win.webContents.executeJavaScript(`(()=>{const Auth=require('./models/auth');const auth=new Auth(net);auth.setUsername('render_test');auth.setPassword('password123');auth.login();})()`);await delay(500);await win.webContents.executeJavaScript(`net.worldOptions={mode:'mmo',difficulty:'normal'};m.route.set('/game');`);await delay(1000);
 const result=await win.webContents.executeJavaScript(`(()=>{const assert=(v,s)=>{if(!v)throw Error(s);};assert(document.querySelector('.inventory'),'inventory panel');assert(document.querySelectorAll('.inventory-slot').length===20,'20 slots');assert(document.querySelector('.health').textContent.includes('42 / 42'),'HP');assert(document.querySelector('header').textContent.includes('Throne Hall'),'original map');const c=document.querySelector('canvas');assert(c.width>0&&c.height>0,'canvas draws');const pixels=c.getContext('2d').getImageData(0,0,c.width,c.height).data,colors=new Set();for(let i=0;i<pixels.length;i+=64)colors.add(pixels[i]+','+pixels[i+1]+','+pixels[i+2]);assert(colors.size>12,'world artwork actually rendered');return document.querySelector('header').textContent;})()`);
 await delay(250);const shot=await win.webContents.capturePage();fs.writeFileSync(path.join(root,'game-preview.png'),shot.toPNG());
 if(errors.length)throw Error(errors.join('\n'));
 fs.writeFileSync(path.join(root,'game-test-result.txt'),'PASS: account creation, sign-in, original Throne Hall, HP display, 20 inventory slots, rendered game canvas.\n'+result);
 }catch(e){fs.writeFileSync(path.join(root,'game-test-result.txt'),String(e)+'\n'+errors.join('\n'));failed=true;}
 finally{if(win)win.destroy();if(server)server.kill();app.exit(failed?1:0);}
});

