'use strict';
// Extend scenery only. The existing nearby-map list still governs simulation,
// entities and chat. Do not unfold contradictory or one-way distant links.
function extendPlacements(maps,near,radius){
 const out=near.map(p=>({...p})),steps=[[0,-12],[12,0],[0,12],[-12,0]];
 if(radius!==2)return out;
 for(let n=0;n<out.length;n++)for(let d=0;d<4;d++){
  const from=out[n],id=maps[from.id]?.exits?.[d],m=maps[id],x=from.x+steps[d][0],y=from.y+steps[d][1];
  if(!m||Math.abs(x)>24||Math.abs(y)>24||out.some(p=>p.id===id||p.x===x&&p.y===y)||m.exits?.[(d+2)%4]!==from.id)continue;
  if(out.some(p=>steps.some(([dx,dy],side)=>p.x===x+dx&&p.y===y+dy&&m.exits?.[side]&&m.exits[side]!==p.id)))continue;
  out.push({id,x,y});
 }
 return out;
}
module.exports={extendPlacements};
