'use strict';
// Editor-only experiment. Never writes source maps, collision, or shared tile profiles.
const {profileAt}=require('./scenery-profiles'),{sceneryLayout}=require('./scenery-layout');
const inside=(r,x,y)=>!r||x>=r.x&&y>=r.y&&x<r.x+r.w&&y<r.y+r.h;
function analyze(source,art,options={}){
 const map=JSON.parse(JSON.stringify(source)),region=options.region,mode=options.mode||'auto',floorTiles={},walls=[],trees=[],warnings=[];
 if(!['auto','solid','north-south','east-west','corner-nw','corner-ne','corner-sw','corner-se'].includes(mode))throw Error('Choose a supported wall interpretation.');
 if(options.floorTile&&(!Number.isInteger(options.floorTile)||options.floorTile<1||options.floorTile>6979))throw Error('Floor tile must be 0–6979.');
 if(region&&(!['x','y','w','h'].every(k=>Number.isInteger(region[k]))||region.w<1||region.h<1||region.x<0||region.y<0||region.x+region.w>source.width||region.y+region.h>source.height))throw Error('Select a region inside this map.');
 if(!map.layers)return {map,walls,trees,warnings:['This map has no Classic tile layers.'],floorTiles};
 map.visual3d||={version:1};map.visual3d.instances||=[];
 const layers=[0,1,2,4],w=map.width,h=map.height,layout=sceneryLayout(source,art),floors=[];
 for(let y=0;y<h;y++)for(let x=0;x<w;x++){const i=y*w+x;if(map.blocked?.[i])continue;for(const l of [0,1]){const id=map.layers[l]?.[i];if(id&&profileAt(source,x,y,id).kind==='ground'&&art(id).coverage>=.98)floors.push({x,y,id});}}
 function nearby(x,y){return floors.map(f=>({...f,d:Math.abs(f.x-x)+Math.abs(f.y-y)})).filter(f=>f.d<=5).sort((a,b)=>a.d-b.d).slice(0,20);}
 function matchBottom(id,candidates){const p=art(id).rgba;let best=null;for(const f of candidates){const q=art(f.id).rgba;let difference=0,n=0;for(let y=24;y<32;y++)for(let x=0;x<32;x++){const i=(y*32+x)*4;if(p[i+3]<128||q[i+3]<128)continue;difference+=Math.abs(p[i]-q[i])+Math.abs(p[i+1]-q[i+1])+Math.abs(p[i+2]-q[i+2]);n++;}const score=n>=200?difference/n/3:Infinity;if(!best||score<best.score)best={...f,score};}return best;}
 for(const g of layout.groups){if(g.kind!=='plant'||!g.cells.some(c=>inside(region,c.x,c.y)))continue;const expected=g.profile.pieces?Object.keys(g.profile.pieces).map(Number):[],found=new Set(g.cells.flatMap(c=>c.parts.flatMap(p=>[p.id,p.alternate]))),missing=expected.filter(id=>!found.has(id));const scale=Math.max(.25,Math.min(1.5,Number(options.treeScale)||1));for(const c of g.cells){if(!inside(region,c.x,c.y))continue;const i=c.y*w+c.x,base=source.layers[0]?.[i];if(!base||profileAt(source,c.x,c.y,base).kind!=='ground'||art(base).coverage<.98){const floor=options.floorTile||nearby(c.x,c.y)[0]?.id;if(floor)floorTiles[i]=floor;}if(scale!==1)for(const part of c.parts){const id=part.id||part.alternate,existing=map.visual3d.instances.find(v=>v.x===c.x&&v.y===c.y&&v.tile===id);if(existing)existing.profile={...existing.profile,heightScale:(existing.profile.heightScale||1)*scale};else map.visual3d.instances.push({x:c.x,y:c.y,tile:id,profile:{heightScale:scale}});}}trees.push({family:g.profile.family,origin:g.origin,anchor:g.anchor,tiles:[...found].filter(Boolean),missing,height:g.bottom/32});if(missing.length)warnings.push(`Tree at ${g.x},${g.y}: missing pieces ${missing.join(', ')}; kept separate, no guessed trunk.`);if(g.height>Math.max(1,...Object.values(g.profile.pieces||{}).map(p=>p[1]+1)))warnings.push(`Tree at ${g.x},${g.y}: unexpected assembly height; inspect manually.`);}
 for(let y=0;y<h;y++)for(let x=0;x<w;x++){if(!inside(region,x,y))continue;const i=y*w+x,candidates=nearby(x,y);for(const l of layers){const id=source.layers[l]?.[i];if(!id)continue;const p=profileAt(source,x,y,id);if(p.kind!=='wall')continue;
 // Intentional openings and existing hand-authored placements always win in Auto.
 const explicit=source.visual3d?.instances?.some(v=>v.x===x&&v.y===y&&v.tile===id)||source.visual3d?.assetProfiles?.[id];
 if(mode==='auto'&&(p.opening||explicit))continue;
 const match=matchBottom(id,candidates);let cut=32;
 if(match&&match.score<28){const a=art(id).rgba,b=art(match.id).rgba;for(let row=31;row>=8;row--){let diff=0,n=0;for(let col=0;col<32;col++){const at=(row*32+col)*4;if(a[at+3]<128)continue;diff+=Math.abs(a[at]-b[at])+Math.abs(a[at+1]-b[at+1])+Math.abs(a[at+2]-b[at+2]);n++;}if(n<24||diff/n/3>38)break;cut=row;}if(cut>=28||cut<=8)cut=32;}
 const alphaShape=require('./wall-shapes').wallFootprints({pixels:art(id).alpha,parts:[{id}]},{});
 let alignment=null;let shape=mode==='solid'?'full':mode==='north-south'?'north-south':mode==='east-west'?'east-west':mode.startsWith('corner-')?mode:null;
 // Preserve both legs before considering a simple horizontal/vertical split.
 if(!shape&&alphaShape.length===2){const horizontal=alphaShape.find(s=>s.w===1&&s.d<.5),vertical=alphaShape.find(s=>s.w<.5&&s.d>=.5);if(horizontal&&vertical)shape='corner-'+(horizontal.z<.5?'n':'s')+(vertical.x<.5?'w':'e');}
 if(!shape&&cut<32)shape='east-west';
 if(!shape&&alphaShape.length===1&&alphaShape[0].w<.5&&alphaShape[0].d>=1){shape='north-south';alignment=alphaShape[0].x<.25?'start':alphaShape[0].x>.5?'end':'center';}
 if(!shape){warnings.push(`Wall ${id} at ${x},${y}: no confident floor split; existing geometry retained.`);continue;}
 if(mode==='auto'&&!source.blocked?.[i]){warnings.push(`Wall ${id} at ${x},${y}: walkable cell left unchanged.`);continue;}
 const floor=options.floorTile||((match&&match.score<28)?match.id:candidates[0]?.id);
 if(floor)floorTiles[i]=floor;else warnings.push(`Wall at ${x},${y}: no local floor sample; choose a floor tile manually.`);
 walls.push({x,y,layer:l,tile:id,alternate:l===2||l===4?source.layers[l+1]?.[i]||id:id,cut,shape,alignment,thickness:Math.max(.05,Math.min(1,Number(options.thickness)||.22)),floor:floor||0,reason:cut<32?'floor-colored lower rows match nearby floor':'manual shape override'});
 }}
 map._conversionPreview={floorTiles};return {map,walls,trees,warnings,floorTiles};
}
function build(source,image,options={}){
 const canvas=document.createElement('canvas');canvas.width=image.naturalWidth||image.width;canvas.height=image.naturalHeight||image.height;const ctx=canvas.getContext('2d',{willReadFrequently:true});ctx.drawImage(image,0,0);const columns=canvas.width/32,pixels=ctx.getImageData(0,0,canvas.width,canvas.height).data,cache=new Map();
 const art=id=>{if(cache.has(id))return cache.get(id);const rgba=new Uint8Array(4096),alpha=new Uint8Array(1024);let count=0;for(let y=0;y<32;y++)for(let x=0;x<32;x++){const at=((Math.floor((id-1)/columns)*32+y)*canvas.width+(id-1)%columns*32+x)*4,n=y*32+x;rgba.set(pixels.subarray(at,at+4),n*4);alpha[n]=rgba[n*4+3]>24?1:0;count+=alpha[n];}const a={rgba,alpha,coverage:count/1024};cache.set(id,a);return a;};
 const plan=analyze(source,art,options),total=columns*canvas.height/32,output=document.createElement('canvas');output.width=canvas.width;output.height=canvas.height+Math.ceil(plan.walls.length*2/columns)*32;const out=output.getContext('2d');out.imageSmoothingEnabled=false;out.drawImage(canvas,0,0);let next=total+1;
 const map=plan.map;map.visual3d||={version:1};map.visual3d.assetProfiles||={};map.visual3d.instances||=[];
 for(const wall of plan.walls){const pair=[];for(const id of [wall.tile,wall.alternate]){const tile=next++,x=(tile-1)%columns*32,y=Math.floor((tile-1)/columns)*32;out.drawImage(canvas,(id-1)%columns*32,Math.floor((id-1)/columns)*32,32,wall.cut,x,y,32,32);map.visual3d.assetProfiles[tile]={kind:'wall',wallShape:wall.shape,wallThickness:wall.thickness,wallAlignment:wall.alignment||(wall.shape==='east-west'?'end':'center'),closed:true};pair.push(tile);}const i=wall.y*map.width+wall.x;map.layers[wall.layer][i]=pair[0];if(wall.layer===2||wall.layer===4)map.layers[wall.layer+1][i]=pair[1];}
 // Atlas expects decoded image dimensions. This generated image is preview-only.
 return new Promise((resolve,reject)=>{const img=new Image();img.onload=()=>resolve({...plan,art:img});img.onerror=reject;img.src=output.toDataURL();});
}
module.exports={analyze,build};
