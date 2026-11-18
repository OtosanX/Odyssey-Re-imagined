'use strict';
// Original layers carry artwork, not a universal wall-thickness field. Narrow
// vertical opaque strips are reliable side-wall footprints; ambiguous art stays
// with the existing renderer. Explicit profiles always win.
function wallFootprints(cell,profile={}){
 const shape=profile.wallShape||'auto',thickness=profile.wallThickness??.22,align=profile.wallAlignment||'auto';
 const position=(axis)=>align==='start'?0:align==='end'?1-thickness:align==='center'?(1-thickness)/2:axis==='ns'?(1-thickness)/2:1-thickness;
 if(/^corner-(nw|ne|sw|se)$/.test(shape)){const north=shape.endsWith('nw')||shape.endsWith('ne'),west=shape.endsWith('nw')||shape.endsWith('sw');return [{x:0,z:north?0:1-thickness,w:1,d:thickness,source:'explicit thin corner horizontal'},{x:west?0:1-thickness,z:north?thickness:0,w:thickness,d:1-thickness,source:'explicit thin corner return'}].filter(s=>s.w>0&&s.d>0);}
 if(shape==='full')return [{x:0,z:0,w:1,d:1,source:'explicit full tile'}];
 if(shape==='north-south')return [{x:position('ns'),z:0,w:thickness,d:1,source:'explicit north-south'}];
 if(shape==='east-west')return [{x:0,z:position('ew'),w:1,d:thickness,source:'explicit east-west'}];
 if(profile.opening)return [];
 // Corner tiles and side-wall pieces can share a cell on different layers.
 // Their union must retain both directions, even when the corner is opaque.
 const ids=cell.parts?.map(p=>p.id)||[];
 if(ids.some(id=>[240,241,242].includes(id))){
  const result=[{x:0,z:.78,w:1,d:.22,source:'masonry front'}];
  if(ids.some(id=>id===241||id===244))result.push({x:0,z:0,w:.25,d:1,source:'masonry left return'});
  if(ids.some(id=>id===242||id===243))result.push({x:.75,z:0,w:.25,d:1,source:'masonry right return'});
  return result;
 }
 // Transparent L-shaped art contains both perpendicular legs in one tile.
 const countsX=Array(32).fill(0),countsY=Array(32).fill(0);for(let y=0;y<32;y++)for(let x=0;x<32;x++)if(cell.pixels[y*32+x]){countsX[x]++;countsY[y]++;}
 const edge=(values,reverse)=>{let n=0;while(n<32&&values[reverse?31-n:n]>=29)n++;return n>=2&&n<=12?n:0;};
 const left=edge(countsX,false),right=edge(countsX,true),top=edge(countsY,false),bottom=edge(countsY,true);
 if(!!left!==!!right&&!!top!==!!bottom){const tx=left||right,ty=top||bottom;let interior=0;for(let y=top?ty:0;y<(top?32:32-ty);y++)for(let x=left?tx:0;x<(left?32:32-tx);x++)interior+=cell.pixels[y*32+x]?1:0;
 if(interior<=(32-tx)*(32-ty)*.08)return [{x:0,z:top?0:1-ty/32,w:1,d:ty/32,source:'original corner horizontal'},{x:left?0:1-tx/32,z:top?ty/32:0,w:tx/32,d:1-ty/32,source:'original corner return'}];}
 const columns=Array(32).fill(0);let minY=32,maxY=-1;for(let y=0;y<32;y++)for(let x=0;x<32;x++)if(cell.pixels[y*32+x]){columns[x]++;minY=Math.min(minY,y);maxY=Math.max(maxY,y);}
 if(maxY-minY<23)return [];
 const runs=[];for(let x=0;x<32;){if(!columns[x]){x++;continue;}const start=x;let count=0;while(x<32&&columns[x])count+=columns[x++];runs.push({start,end:x,count});}
 if(!runs.length||runs.some(r=>r.end-r.start>15||r.count<60))return [];
 return runs.map(r=>({x:r.start/32,z:-.01,w:(r.end-r.start)/32,d:1.02,source:'original layered side-wall silhouette'}));
}
// Ruin corner art points toward the next wall row. Only bridge that span when
// the original map actually contains blocked masonry there; never seal paths.
function ruinReturns(world,cell,profile){
 const y=cell.y+1,i=y*world.width+cell.x;
 const stone=y<world.height&&world.layers?.some(l=>[240,241,242].includes(l[i]));
 const blocked=world.blocked?world.blocked[i]:world.tiles?.[i]===2;
 return wallFootprints(cell,profile).filter(s=>s.w<1&&s.d>=1).map(s=>({...s,z:stone&&blocked?1:0,d:stone&&blocked?1:.78}));
}
module.exports={wallFootprints,ruinReturns};
