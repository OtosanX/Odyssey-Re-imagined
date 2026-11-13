'use strict';
const {validateMap}=require('../map-format.cjs');
const {validateVisual}=require('../visual-format.cjs');
const clone=m=>JSON.parse(JSON.stringify(m));
function rect(a,b){return {x:Math.min(a.x,b.x),y:Math.min(a.y,b.y),w:Math.abs(a.x-b.x)+1,h:Math.abs(a.y-b.y)+1};}
function line(a,b){const points=[],dx=Math.abs(b.x-a.x),dy=-Math.abs(b.y-a.y),sx=a.x<b.x?1:-1,sy=a.y<b.y?1:-1;let x=a.x,y=a.y,err=dx+dy;while(true){points.push({x,y});if(x===b.x&&y===b.y)break;const e=err*2;if(e>=dy){err+=dy;x+=sx;}if(e<=dx){err+=dx;y+=sy;}}return points;}
function write(map,p,layer,value){if(p.x<0||p.y<0||p.x>=map.width||p.y>=map.height)throw Error('The edit extends outside this map.');const i=p.y*map.width+p.x;
 if(layer==='collision'){if(value&&map.anchors.some(a=>a.x===p.x&&a.y===p.y))throw Error('Move the anchor before blocking its tile.');map.blocked[i]=value?1:0;}
 else {if(!/^[0-5]$/.test(String(layer)))throw Error('This tool requires a graphical or collision layer.');if(!Number.isInteger(value)||value<0||value>6979)throw Error('Invalid tile ID.');map.layers[+layer][i]=value;}
}
function apply(source,tool,a,b,layer,value,{surface,wallProfile}={}){const map=clone(source);let points;
 if(tool==='fill'){const data=layer==='collision'?map.blocked:map.layers[+layer];if(!data)throw Error('Fill requires a graphical or collision layer.');const old=data[a.y*map.width+a.x],seen=new Set(),queue=[a];points=[];for(let n=0;n<queue.length;n++){const p=queue[n],i=p.y*map.width+p.x;if(p.x<0||p.y<0||p.x>=map.width||p.y>=map.height||seen.has(i)||data[i]!==old)continue;seen.add(i);points.push(p);for(const [dx,dy]of [[0,1],[0,-1],[1,0],[-1,0]])queue.push({x:p.x+dx,y:p.y+dy});}}
 else if(tool==='rectangle'){const r=rect(a,b);points=[];for(let y=r.y;y<r.y+r.h;y++)for(let x=r.x;x<r.x+r.w;x++)points.push({x,y});}
 else points=line(a,b);
 for(const p of points){const i=p.y*map.width+p.x,old=map.layers[+layer]?.[i],id=tool==='erase'?0:value;write(map,p,layer,id);
 if(/^[0-5]$/.test(String(layer))){if(map.visual3d?.instances&&old!==id&&!map.layers.some(l=>l[i]===old))map.visual3d.instances=map.visual3d.instances.filter(v=>v.x!==p.x||v.y!==p.y||v.tile!==old);
 if(id&&surface&&surface!=='unchanged'){map.visual3d||={version:1};map.visual3d.instances||=[];let instance=map.visual3d.instances.find(v=>v.x===p.x&&v.y===p.y&&v.tile===id);if(!instance){instance={x:p.x,y:p.y,tile:id,profile:{}};map.visual3d.instances.push(instance);}instance.profile={...instance.profile,kind:surface};if(surface==='wall'&&wallProfile)Object.assign(instance.profile,wallProfile);if(surface==='ceiling')instance.profile.offsetY=2.5;else instance.profile.offsetY=0;}}
 }return validateMap(map);
}
function copy(map,region,{visual=true}={}){
 const cells=[];
 for(let y=0;y<region.h;y++)for(let x=0;x<region.w;x++){
  const sx=region.x+x,sy=region.y+y;
  if(sx<0||sy<0||sx>=map.width||sy>=map.height)throw Error('Selection extends outside map.');
  const i=sy*map.width+sx;
  cells.push({x,y,layers:map.layers.map(l=>l[i]),blocked:map.blocked[i]});
 }
 let meta;
 if(visual&&map.visual3d){
  const inside=(x,y)=>x>=region.x&&y>=region.y&&x<region.x+region.w&&y<region.y+region.h;
  const instances=(map.visual3d.instances||[]).filter(i=>inside(i.x,i.y)).map(i=>({...i,x:i.x-region.x,y:i.y-region.y}));
  const structures=(map.visual3d.structures||[]).filter(s=>inside(s.x,s.y)&&s.x+s.w<=region.x+region.w&&s.y+s.d<=region.y+region.h).map(s=>({...s,x:s.x-region.x,y:s.y-region.y}));
  const grids={};
  for(const key of ['heights','walls','wallTiles']){const g=map.visual3d[key];if(!g)continue;const sub=Array.from({length:region.w*region.h},(_,n)=>g[(region.y+Math.floor(n/region.w))*map.width+region.x+n%region.w]);if(sub.some(v=>v))grids[key]=sub;}
  if(instances.length||structures.length||grids.heights||grids.walls||grids.wallTiles)meta={version:1,...grids,instances,structures};
 }
 return {width:region.w,height:region.h,cells,visual:meta};
}
// Pasting carries the rendering metadata captured by copy(). Defaults keep
// existing target values that the clip does not set (transparent paste);
// 'replace' rewrites the whole span from the clip. Instances deduplicate by
// cell, and pasted houses take over the footprints they cover, so geometry
// never doubles up. Collision, anchors and map connections stay independent.
function paste(source,clip,at,{collision=false,erase=null,visualMode='overlay'}={}){
 const map=clone(source),usedCell=(tile,x,y)=>[0,1,2,3,4,5].some(l=>map.layers[l][y*map.width+x]===tile);
 if(erase)for(const c of erase)for(const p of c.parts)write(map,c,p.layer,0);
 for(const c of clip.cells){const p={x:at.x+c.x,y:at.y+c.y};for(let l=0;l<6;l++)if(c.layers[l]!==null)write(map,p,l,c.layers[l]);if(collision)write(map,p,'collision',c.blocked);}
 const clipVisual=visualMode==='art'?null:clip.visual;
 if(clipVisual){
  map.visual3d||={version:1};
  const v=map.visual3d,count=map.width*map.height;
  for(const key of ['heights','walls','wallTiles'])if(Array.isArray(clipVisual[key])){
   const g=v[key]||new Array(count).fill(0),src=clipVisual[key];
   for(let n=0;n<src.length;n++){
    const x=at.x+n%clip.width,y=at.y+Math.floor(n/clip.width);
    if(x<0||y<0||x>=map.width||y>=map.height)throw Error('The rendering-property paste extends outside this map.');
    const i=y*map.width+x;
    if(visualMode==='replace'||src[n])g[i]=src[n];
   }
   v[key]=g;
  }
  if(Array.isArray(v.instances))v.instances=v.instances.filter(i=>usedCell(i.tile,i.x,i.y));
  if(Array.isArray(clipVisual.instances)){
   const moved=clipVisual.instances.map(i=>({...i,x:at.x+i.x,y:at.y+i.y}));
   const kept=(v.instances||[]).filter(i=>!moved.some(m=>m.x===i.x&&m.y===i.y));
   v.instances=[...kept,...moved];
   if(v.instances.length>1024)throw Error('The paste exceeds 1024 per-cell surface overrides; choose a smaller selection.');
  }
  if(Array.isArray(clipVisual.structures)){
   const structures=[...(v.structures||[])];
   const covers=(a,b)=>a.x<b.x+b.w&&a.y<b.y+b.d&&a.x+a.w>b.x&&a.y+a.d>b.y;
   const pasted=[];
   for(const s of clipVisual.structures){
    const shifted={...s,x:at.x+s.x,y:at.y+s.y};
    if(shifted.x<0||shifted.y<0||shifted.x+shifted.w>map.width||shifted.y+shifted.d>map.height)throw Error('The house paste extends outside this map.');
    for(let n=structures.length-1;n>=0;n--)if(covers(structures[n],shifted))structures.splice(n,1);
    if(structures.length+pasted.length>=32)throw Error('The paste exceeds 32 houses per map; choose a smaller selection.');
    let id=shifted.id,n=0;
    while([...structures,...pasted].some(q=>q.id===id)){id=shifted.id.slice(0,36)+'-'+(++n);if(!/^[a-zA-Z0-9_-]{1,40}$/.test(id))throw Error('House identifier overflow.');}
    shifted.id=id;pasted.push(shifted);structures.push(shifted);
   }
   v.structures=structures;
  }
  validateVisual(map.visual3d,map.width,map.height);
 }
 return validateMap(map);
}
module.exports={rect,line,apply,copy,paste};
