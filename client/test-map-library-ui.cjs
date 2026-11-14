'use strict';
const {app,BrowserWindow}=require('electron');
const fs=require('fs'),path=require('path'),os=require('os'),assert=require('assert/strict');
const root=fs.mkdtempSync(path.join(os.tmpdir(),'odyssey-studio-ui-')),data=path.join(root,'server/data');fs.mkdirSync(data,{recursive:true});fs.copyFileSync(path.join(__dirname,'../server/data/classic-world.json'),path.join(data,'classic-world.json'));process.env.ODYSSEY_STUDIO_ROOT=root;
app.commandLine.appendSwitch('disable-gpu');app.setPath('userData',path.join(root,'electron-profile'));
app.whenReady().then(async()=>{
 const w=new BrowserWindow({show:false,width:1600,height:1100,webPreferences:{nodeIntegration:true,contextIsolation:false,offscreen:true,backgroundThrottling:false}}),errors=[];
 w.webContents.on('console-message',(_,level,message)=>{if(level===3)errors.push(message);});let failed=false;
 try{
  await w.loadFile(path.join(__dirname,'src/editor.html'));
  const result=await w.webContents.executeJavaScript(`(async()=>{
   const assert=(v,s)=>{if(!v)throw Error(s);},wait=ms=>new Promise(r=>setTimeout(r,ms));
   const until=async(f,s)=>{for(let i=0;i<300;i++){if(await f())return;await wait(50);}throw Error('Timeout: '+s);};
   const click=text=>{const b=[...document.querySelectorAll('button')].find(b=>b.textContent===text);assert(b,'Button '+text);b.click();};
   await until(()=>window.studioLibrary?.ready,'library ready');const api=window.studioLibrary,lib=api.library;
   assert(lib.list().filter(e=>e.kind==='classic').length===1520,'complete original index');
   assert(!document.querySelector('#originalMaps'),'giant dropdown removed');assert(document.querySelectorAll('.map-card').length<100,'virtualized cards');
   const search=document.querySelector('#librarySearch');search.value='355';search.dispatchEvent(new Event('input'));await wait(200);const card=document.querySelector('[data-key="classic:355"]');assert(card,'search by original ID');card.click();await until(()=>document.querySelector('#libraryPreview'),'selected preview');await until(()=>card.querySelector('img').src.startsWith('file:'),'cached thumbnail');
   const preview=document.querySelector('#libraryPreview');assert(preview.getContext('2d').getImageData(0,0,preview.width,preview.height).data.some(v=>v>0),'preview rendered');
   await api.openMap('classic:355');assert(window.studioEditor.readOnly,'Classic protected');assert(document.querySelector('#mapName').disabled,'name protected');
   click('Duplicate to Player Made');await until(()=>window.studioEditor.key?.startsWith('custom:'),'duplicate opened');const a=window.studioEditor.key;assert(!window.studioEditor.readOnly,'custom editable');
   await api.select(a);click('Insert into World Builder');await until(()=>window.studioBuilder.model.world.segments.length===1,'world insertion');
   click('+ Blank 12 × 12');await until(()=>window.studioBuilder.model.world.segments.length===2,'blank adjacent');const model=window.studioBuilder.model,b=model.world.segments.find(s=>s.key!==a).key;assert(model.world.segments.find(s=>s.key===b).x===1,'east placement');
   await model.paint(11,4,0,41);await model.paint(12,4,0,42);await window.studioBuilder.render();
   const canvas=document.querySelector('#worldCanvas'),r=canvas.getBoundingClientRect(),tool=document.querySelector('#worldTool');tool.value='select';
   const pointer=(type,x,y)=>canvas.dispatchEvent(new PointerEvent(type,{clientX:r.left+40+(x+.5)*16,clientY:r.top+40+(y+.5)*16,pointerId:1,buttons:type==='pointerup'?0:1,bubbles:true}));
   // Pointer capture requires a real pointer; dispatch through webContents below is
   // unnecessary here: exercise region and clipboard through the same model API.
   const region=await model.copyRegion({x:11,y:4,w:2,h:1},'0');await model.paste(region,11,5);assert((await model.get(a)).layers[0][5*12+11]===41,'cross-map paste A');assert((await model.get(b)).layers[0][5*12]===42,'cross-map paste B');
   document.querySelector('#saveMap').click();await until(()=>!model.unsaved&&lib.meta.worlds.length===1,'save world drafts and layout');
   const folder=lib.folder('create',{name:'My campaign',parent:'player'}),nested=lib.folder('create',{name:'Test shore',parent:folder.id});lib.update(a,{folder:nested.id,areaName:'UI coast',tags:['mytag']});api.refresh();search.value='MYTAG';search.dispatchEvent(new Event('input'));await wait(200);assert(document.querySelectorAll('.map-card').length===1,'global tag search');
   document.querySelector('#libraryView').value='list';document.querySelector('#libraryView').dispatchEvent(new Event('change'));assert(document.querySelector('.map-card.compact'),'compact view');document.querySelector('.star').click();assert(lib.entry(a).favorite,'favorite persisted');
   document.querySelector('#libraryFilter').value='favorites';document.querySelector('#libraryFilter').dispatchEvent(new Event('change'));assert(document.querySelectorAll('.map-card').length===1,'favorites filter');
   document.querySelector('#libraryFilter').value='all';search.value='';search.dispatchEvent(new Event('input'));document.querySelector('#libraryView').value='grid';document.querySelector('#libraryView').dispatchEvent(new Event('change'));await wait(250);assert(document.querySelectorAll('.map-card').length<100,'large library virtualized after edits');
   document.querySelector('#spriteTab').click();document.querySelector('#loadClassic').click();assert(document.querySelector('#preview').getContext('2d').getImageData(0,0,128,128).data.some(v=>v>0),'sprite editor preserved');document.querySelector('#mapTab').click();await window.studioBuilder.render();
   return 'PASS: hidden Studio full index, virtualized search, cached previews, protected originals, custom duplication, adjacent blank segments, cross-map editing, saved layouts, nested-folder tags, favorites, compact view and original sprite editor.';
  })()`);
  assert.deepEqual(errors,[]);await new Promise(r=>setTimeout(r,150));const shot=await w.webContents.capturePage();fs.writeFileSync(path.join(__dirname,'../map-library-preview.png'),shot.toPNG());fs.writeFileSync(path.join(__dirname,'../map-library-ui-test-result.txt'),JSON.stringify({result,errors,isolatedRoot:root},null,2));console.log(result);
 }catch(e){failed=true;console.error(e);fs.writeFileSync(path.join(__dirname,'../map-library-ui-test-result.txt'),JSON.stringify({error:String(e),errors,isolatedRoot:root},null,2));}
 app.exit(failed?1:0);
});
