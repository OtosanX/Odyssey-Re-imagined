'use strict';
// Offscreen 3D snapshot of one map (default 198 Keep Courtyard) for visual verification.
const {app,BrowserWindow}=require('electron'),fs=require('fs'),path=require('path'),os=require('os'),id=+(process.env.SNAPSHOT_MAP||198),out=process.env.SNAPSHOT_OUT||path.join(__dirname,'../artifacts/scenery/map-snapshot.png');
app.setPath('userData',fs.mkdtempSync(path.join(os.tmpdir(),'ody-snap-')));app.commandLine.appendSwitch('use-angle','swiftshader');app.commandLine.appendSwitch('enable-unsafe-swiftshader');
app.whenReady().then(async()=>{let win,failed=false;try{
 win=new BrowserWindow({show:false,width:900,height:760,webPreferences:{nodeIntegration:true,contextIsolation:false,offscreen:true,backgroundThrottling:false}});await win.loadFile(path.join(__dirname,'src/test-combat-ui.html'));
 const worldData=Object.values(require('../server/data/classic-world.json').maps).find(m=>m.id===id);
 await win.webContents.executeJavaScript(`window.snapWorld=${JSON.stringify({...worldData,tiles:worldData.blocked,stepMs:150})};true;`);
 const image=await win.webContents.executeJavaScript(`(async()=>{const {Scene3D}=require('./views/game/scene3d'),scene=new Scene3D(),load=s=>new Promise((r,j)=>{const i=new Image();i.onload=()=>r(i);i.onerror=j;i.src=s;});
  const world=window.snapWorld;
  const art={tiles:await load('assets/tiles.png'),sprites:await load('assets/sprites.png'),objects:await load('assets/objects.png')};
  const W=900,H=760,sheet=document.createElement('canvas');sheet.width=W*2;sheet.height=H;const ctx=sheet.getContext('2d');
  for(const [slot,cam] of [['high',{x:5.5,y:5.5,zoom:15}],['ground',{x:3.5,y:8.5,zoom:24}]]){
   const view=scene.render(world,[],[],art,{x:cam.x,y:cam.y},W,H,cam.zoom,0,{cameraTilt:55,cutaway:false});
   const gl=scene.gl,p=new Uint8Array(scene.canvas.width*scene.canvas.height*4);gl.readPixels(0,0,scene.canvas.width,scene.canvas.height,gl.RGBA,gl.UNSIGNED_BYTE,p);
   const buf=ctx.createImageData(scene.canvas.width,scene.canvas.height);for(let n=0;n<p.length;n+=4){buf.data[n]=p[n];buf.data[n+1]=p[n+1];buf.data[n+2]=p[n+2];buf.data[n+3]=255;}ctx.putImageData(buf,slot==='high'?0:W,0);
   if(scene.gl.getError()!==scene.gl.NO_ERROR)throw Error('WebGL error');}
  return sheet.toDataURL('image/png');})()`);
 fs.writeFileSync(out,Buffer.from(image.split(',')[1],'base64'));
 console.log('wrote',out);
}catch(e){failed=true;console.error(String(e));fs.writeFileSync(out.replace('.png','-fail.txt'),String(e));}finally{win?.destroy();app.exit(failed?1:0);}
});
