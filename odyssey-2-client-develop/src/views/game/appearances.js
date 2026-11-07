'use strict';
const m=require('mithril');
let atlas=null,pending=null;
function load(min=1,max=Infinity){
 if(atlas)return Promise.resolve({...atlas,items:atlas.items.filter(i=>i.id>=min&&i.id<=max)});
 if(pending)return pending.then(()=>load(min,max));
 pending=new Promise((resolve,reject)=>{const image=new Image();image.onload=async()=>{try{
  const cols=Math.floor(image.naturalWidth/32),rows=Math.floor(image.naturalHeight/32),groups=new Map(),canvas=document.createElement('canvas');canvas.width=cols*32;canvas.height=32;const ctx=canvas.getContext('2d',{willReadFrequently:true});
  for(let row=0;row<rows;row++){ctx.clearRect(0,0,canvas.width,32);ctx.drawImage(image,0,row*32,canvas.width,32,0,0,canvas.width,32);const pixels=ctx.getImageData(0,0,canvas.width,32).data;
   for(let col=0;col<cols;col++){let filled=false;for(let y=0;y<32&&!filled;y++)for(let x=0;x<32;x++)if(pixels[(y*canvas.width+col*32+x)*4+3]){filled=true;break;}if(filled){const index=row*cols+col,id=Math.floor(index/12)+1;if(!groups.has(id))groups.set(id,{id,frames:[]});groups.get(id).frames.push(index%12);}}
   if(row%16===0)await new Promise(r=>setTimeout(r,0));
  }
  atlas={width:image.naturalWidth,height:image.naturalHeight,cols,items:[...groups.values()]};resolve(atlas);
 }catch(e){pending=null;reject(e);}};image.onerror=()=>{pending=null;reject(Error('Character artwork could not be loaded. Your saved appearances are unchanged.'));};image.src='assets/sprites.png';});
 return pending.then(()=>load(min,max));
}
function valid(id,min=1,max=Infinity){return Number.isInteger(id)&&id>=min&&id<=max&&(!atlas||atlas.items.some(i=>i.id===id));}
function style(id,scale=3,frame=3){const cols=atlas?.cols||32,item=atlas?.items.find(i=>i.id===id);if(item&&!item.frames.includes(frame))frame=item.frames[0];const index=(id-1)*12+frame;return {width:32*scale+'px',height:32*scale+'px',backgroundImage:'url(assets/sprites.png)',backgroundSize:(atlas?.width||1024)*scale+'px auto',backgroundPosition:`-${index%cols*32*scale}px -${Math.floor(index/cols)*32*scale}px`};}
const Portrait={view:v=>valid(v.attrs.sprite,1,v.attrs.max??Infinity)?m('.rpg-portrait',{style:style(v.attrs.sprite,v.attrs.scale||3,v.attrs.frame??3),role:'img','aria-label':'Appearance '+v.attrs.sprite}):m('.rpg-portrait.unavailable',{style:{width:32*(v.attrs.scale||3)+'px',height:32*(v.attrs.scale||3)+'px'},role:'img','aria-label':'Saved appearance unavailable'},'?')};
function remember(username,sprite){if(!username||!valid(sprite))return;try{const rows=JSON.parse(localStorage.getItem('odyssey-account-avatars')||'{}');rows[username]=sprite;localStorage.setItem('odyssey-account-avatars',JSON.stringify(rows));}catch{}}
function remembered(username){try{return JSON.parse(localStorage.getItem('odyssey-account-avatars')||'{}')[username];}catch{return null;}}
function renderable(id){return valid(id,1,atlas?Math.floor(atlas.width/32*atlas.height/32/12):Infinity)?id:1;}
function frameId(id,frame=3){id=renderable(id);const item=atlas?.items.find(i=>i.id===id);if(item&&!item.frames.includes(frame)){const base=Math.floor(frame/3)*3;frame=item.frames.includes(base)?base:item.frames[0];}return (id-1)*12+frame+1;}
module.exports={load,valid,style,Portrait,remember,remembered,renderable,frameId};
