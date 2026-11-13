'use strict';
const {validateVisual}=require('../visual-format.cjs');
// Reclassify existing artwork without repainting tiles or changing movement rules.
function repairSurface(map,{kind,layer,tile,region,height=2.5,wallShape='auto',wallThickness=.22,wallAlignment='auto'}){
 if(!['ground','wall','ceiling','object'].includes(kind))throw Error('Choose floor, wall, ceiling or upright object.');
 if(!Number.isInteger(layer)||layer<0||layer>5)throw Error('Choose a drawing layer first.');
 if(!region&&(!Number.isInteger(tile)||tile<1))throw Error('Choose a tile ID first.');
 const next=JSON.parse(JSON.stringify(map));next.visual3d||={version:1};next.visual3d.instances||=[];let changed=0;
 for(let y=0;y<map.height;y++)for(let x=0;x<map.width;x++){
  if(region&&(x<region.x||y<region.y||x>=region.x+region.w||y>=region.y+region.h))continue;
  const id=map.layers[layer][y*map.width+x];if(!id||!region&&id!==tile)continue;
  const ids=[id];if(layer===2||layer===4){const alternate=map.layers[layer+1]?.[y*map.width+x];if(alternate)ids.push(alternate);}
  for(const id of new Set(ids)){let instance=next.visual3d.instances.find(i=>i.x===x&&i.y===y&&i.tile===id);if(!instance){instance={x,y,tile:id,profile:{}};next.visual3d.instances.push(instance);}instance.profile={...instance.profile,kind};if(kind==='wall')Object.assign(instance.profile,{wallShape,wallThickness,wallAlignment});if(kind==='ceiling')instance.profile.offsetY=height;else instance.profile.offsetY=0;}
  changed++;
 }
 if(!changed)throw Error('No matching artwork on this drawing layer. Use the eyedropper or choose another layer.');
 validateVisual(next.visual3d,map.width,map.height);return {map:next,changed};
}
module.exports={repairSurface};
