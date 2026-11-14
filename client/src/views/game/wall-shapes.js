'use strict';
// Original layers carry artwork, not a universal wall-thickness field. Narrow
// vertical opaque strips are reliable side-wall footprints; ambiguous art stays
// with the existing renderer. Explicit profiles always win.
function wallFootprints(cell,profile={}){
 const shape=profile.wallShape||'auto',thickness=profile.wallThickness??.22,align=profile.wallAlignment||'auto';
 const position=(axis)=>align==='start'?0:align==='end'?1-thickness:align==='center'?(1-thickness)/2:axis==='ns'?(1-thickness)/2:1-thickness;
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
 const columns=Array(32).fill(0);let minY=32,maxY=-1;for(let y=0;y<32;y++)for(let x=0;x<32;x++)if(cell.pixels[y*32+x]){columns[x]++;minY=Math.min(minY,y);maxY=Math.max(maxY,y);}
 if(maxY-minY<23)return [];
 const runs=[];for(let x=0;x<32;){if(!columns[x]){x++;continue;}const start=x;let count=0;while(x<32&&columns[x])count+=columns[x++];runs.push({start,end:x,count});}
 if(!runs.length||runs.some(r=>r.end-r.start>15||r.count<60))return [];
 return runs.map(r=>({x:r.start/32,z:-.01,w:(r.end-r.start)/32,d:1.02,source:'original layered side-wall silhouette'}));
}
module.exports={wallFootprints};
