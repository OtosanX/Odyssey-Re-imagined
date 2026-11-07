'use strict';
const fs=require('fs'),path=require('path');
const root=path.resolve(__dirname,'../..');
const {validateMap,newMap}=require(path.join(root,'map-format.cjs'));
const {installMap}=require(path.join(root,'tools/import-map.cjs'));
const $=id=>document.getElementById(id);
const status=text=>$('status').textContent=text;
const art=new Image();art.src='assets/tiles.png';
let map=newMap(12,12), selected=33, history=[],future=[],painting=false;
let editorKey=null,readOnly=false,savedMap=JSON.stringify(map);
function editable(){if(readOnly){status('Classic map is protected. Authorize original editing or duplicate to Player Made.');return false;}return true;}
function cleanSwitch(){return JSON.stringify(map)===savedMap||confirm('Discard unsaved Map editor changes? Save a draft first to keep them.');}
const canvas=$('mapCanvas'),ctx=canvas.getContext('2d');
function checkpoint(){history.push(JSON.stringify(map));if(history.length>60)history.shift();future=[];}
function drawTile(ctx,id,x,y,size){if(id&&art.complete&&art.naturalWidth)ctx.drawImage(art,((id-1)%32)*32,Math.floor((id-1)/32)*32,32,32,x,y,size,size);}
function render(){
 const z=+$('mapZoom').value;canvas.width=map.width*z;canvas.height=map.height*z;ctx.imageSmoothingEnabled=false;ctx.fillStyle='#152018';ctx.fillRect(0,0,canvas.width,canvas.height);
 for(let y=0;y<map.height;y++)for(let x=0;x<map.width;x++){const i=y*map.width+x;for(const l of [0,1,2,4])drawTile(ctx,map.layers[l][i],x*z,y*z,z);if(['elevation','wallHeight'].includes($('layer').value)){const h=map.visual3d?.[$('layer').value==='elevation'?'heights':'walls']?.[i]||0;if(h){ctx.fillStyle=$('layer').value==='elevation'?'#55cddd66':'#df9d5966';ctx.fillRect(x*z,y*z,z,z);ctx.fillStyle='#fff';ctx.font='12px sans-serif';ctx.fillText(String(h),x*z+3,y*z+15);}}if(map.blocked[i]&&$('layer').value==='collision'){ctx.fillStyle='#e7334477';ctx.fillRect(x*z,y*z,z,z);}if($('mapGrid').checked){ctx.strokeStyle='#ffffff25';ctx.strokeRect(x*z,y*z,z,z);}}
 for(const a of map.anchors){ctx.strokeStyle=a.id===map.spawnAnchor?'#ffd75d':'#5ee3ed';ctx.lineWidth=2;ctx.strokeRect(a.x*z+2,a.y*z+2,z-4,z-4);ctx.font='12px sans-serif';ctx.fillStyle='#101a24';ctx.fillRect(a.x*z,a.y*z-16,Math.max(z,a.name.length*7),16);ctx.fillStyle='#ffe6a0';ctx.fillText(a.name,a.x*z+2,a.y*z-3);}
 window.studioWorkspace?.overlay2D(ctx,z);
}
function anchors(){const holder=$('anchors');holder.replaceChildren();for(const a of map.anchors){const row=document.createElement('div'),jump=document.createElement('button');jump.textContent=a.name+' ('+a.x+', '+a.y+')';jump.onclick=()=>{const z=+$('mapZoom').value;$('mapScroll').scrollTo({left:Math.max(0,a.x*z-$('mapScroll').clientWidth/2),top:Math.max(0,a.y*z-$('mapScroll').clientHeight/2)});status('At anchor: '+a.name);};const spawn=document.createElement('button');spawn.textContent=a.id===map.spawnAnchor?'★ Spawn':'Set spawn';spawn.onclick=()=>{if(!editable())return;checkpoint();map.spawnAnchor=a.id;anchors();render();};const remove=document.createElement('button');remove.textContent='Remove';remove.disabled=a.id===map.spawnAnchor;remove.onclick=()=>{if(!editable())return;checkpoint();map.anchors=map.anchors.filter(p=>p!==a);anchors();render();};row.append(jump,spawn,remove);holder.append(row);}}
function load(){ if(!$('worldBuilder')||$('worldBuilder').style.display==='none')$('editingLabel').textContent=(editorKey?.startsWith('classic:')?'Classic ORIGINAL #'+editorKey.slice(8):'Player Made')+' · '+map.name; $('mapName').disabled=readOnly;$('noMonsterCombat').disabled=readOnly;$('noMonsterCombat').checked=!!(map.flags&32);$('pvpMode').disabled=readOnly;$('localChatMode').disabled=readOnly;$('localChatMode').value=map.chat?.local||'auto'; $('mapName').value=map.name;$('pvpMode').value=((map.flags??1)&1)?'safe':(map.flags&64)?'open':'guild';anchors();render();window.studio3d?.refresh(); }
function palette(){const c=$('palette'),cctx=c.getContext('2d'),base=+$('tilePage').value*256;c.height=1024;cctx.clearRect(0,0,256,1024);cctx.imageSmoothingEnabled=false;for(let i=0;i<256&&base+i<6979;i++)drawTile(cctx,base+i+1,(i%8)*32,Math.floor(i/8)*32,32);}
$('palette').onclick=e=>{const r=e.currentTarget.getBoundingClientRect(),x=Math.floor((e.clientX-r.left)/32),y=Math.floor((e.clientY-r.top)/32);selected=+$('tilePage').value*256+y*8+x+1;$('tileId').value=selected;status('Selected tile '+selected);};
function paint(e){const r=canvas.getBoundingClientRect(),z=+$('mapZoom').value,x=Math.floor((e.clientX-r.left)/z),y=Math.floor((e.clientY-r.top)/z);if(x<0||y<0||x>=map.width||y>=map.height)return;const i=y*map.width+x,layer=$('layer').value,erase=$('eraseMap').checked||e.buttons===2;if(['elevation','wallHeight','house'].includes(layer)){window.studio3d?.paint(x,y,layer,erase,e.type==='pointerdown');}else if(layer==='anchor'){if(e.type!=='pointerdown')return;if(map.blocked[i])return status('Choose a walkable tile for the anchor.');const name=$('anchorName').value.trim().slice(0,60);if(!name)return status('Enter an anchor name first.');map.anchors.push({id:'anchor-'+Date.now().toString(36),name,x,y});anchors();}else if(layer==='safe'){if(!map.attrs)map.attrs=Array.from({length:map.width*map.height},()=>({type:0,data:[0,0,0,0]}));map.attrs[i]={type:erase?0:6,data:[0,0,0,0]};}else if(layer==='collision'){if(!erase&&map.anchors.some(a=>a.x===x&&a.y===y))return status('Move or remove the anchor before blocking this tile.');map.blocked[i]=erase?0:1;}else map.layers[+layer][i]=erase?0:Math.max(0,Math.min(6979,Math.floor(+$('tileId').value)||0));render();window.studio3d?.draw();}
canvas.onpointerdown=e=>{if(!editable())return;checkpoint();painting=true;canvas.setPointerCapture(e.pointerId);paint(e);};canvas.onpointermove=e=>{if(painting)paint(e);};canvas.onpointerup=()=>painting=false;canvas.onpointercancel=()=>painting=false;canvas.oncontextmenu=e=>e.preventDefault();
$('mapName').onchange=()=>{if(!editable())return;checkpoint();map.name=$('mapName').value;};$('mapZoom').oninput=render;$('mapGrid').onchange=render;$('layer').onchange=render;$('tilePage').onchange=palette;
$('undoMap').onclick=()=>{if(!editable())return;if(history.length){future.push(JSON.stringify(map));map=JSON.parse(history.pop());load();}};$('redoMap').onclick=()=>{if(!editable())return;if(future.length){history.push(JSON.stringify(map));map=JSON.parse(future.pop());load();}};
$('newMap').onclick=()=>{if(!cleanSwitch())return;map=newMap(12,12);editorKey=null;readOnly=false;history=[];future=[];savedMap=JSON.stringify(map);load();};
$('openMap').onchange=async e=>{try{const file=e.target.files[0];if(!file||!cleanSwitch())return;const value=validateMap(JSON.parse(await file.text()));delete value.classicId;delete value.id;editorKey=null;readOnly=false;map=value;history=[];future=[];savedMap='';load();status('Imported as a new Player Made draft. Save to add it to the library.');}catch(e){status(e.message);}e.target.value='';};
$('mapTab').onclick=()=>{$('mapArea').style.display='block';$('spriteArea').style.display='none';$('mapTab').classList.add('active');$('spriteTab').classList.remove('active');};$('spriteTab').onclick=()=>{$('mapArea').style.display='none';$('spriteArea').style.display='block';$('spriteTab').classList.add('active');$('mapTab').classList.remove('active');};
art.onload=()=>{palette();render();};art.onerror=()=>status('Original tile atlas missing. Run node tools/prepare-art.cjs.');load();

$('pvpMode').onchange=()=>{if(!editable())return;checkpoint();map.flags=(map.flags||0)&~65;if($('pvpMode').value==='safe')map.flags|=1;if($('pvpMode').value==='open')map.flags|=64;};
window.studioEditor={
 apply(value){if(!editable())return false;validateMap(value);checkpoint();map=JSON.parse(JSON.stringify(value));load();return true;},
 get key(){return editorKey;},get readOnly(){return readOnly;},get map(){return map;},get dirty(){return JSON.stringify(map)!==savedMap;},
 open(value,key,protectedMap=true){if(!cleanSwitch())return false;map=JSON.parse(JSON.stringify(value));editorKey=key;readOnly=protectedMap;history=[];future=[];savedMap=JSON.stringify(map);load();return true;},
 authorize(key){if(editorKey===key){readOnly=false;load();}},
 saved(key){editorKey=key;savedMap=JSON.stringify(map);},cleanSwitch
};
window.addEventListener('beforeunload',e=>{if((window.studioEditor.dirty||window.studioBuilder?.dirty)&&!confirm('Close Studio and discard unsaved map or world layout changes? Saved drafts are kept.')){e.preventDefault();e.returnValue=false;}});

$('localChatMode').onchange=()=>{if(!editable())return;checkpoint();map.chat={...(map.chat||{}),local:$('localChatMode').value};};

$('noMonsterCombat').onchange=()=>{if(!editable())return;checkpoint();map.flags=$('noMonsterCombat').checked?(map.flags||0)|32:(map.flags||0)&~32;};
