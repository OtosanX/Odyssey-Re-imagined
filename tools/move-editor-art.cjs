'use strict';
const {paste}=require('./map-edit-tools.cjs');
function move(map,clip,cells,at){
 const erased=new Set();const erase=cells.map(c=>({...c,parts:c.parts.flatMap(p=>p.layer===2||p.layer===4?[p,{layer:p.layer+1}]:[p])}));
 for(const c of erase)for(const p of c.parts)erased.add(`${c.x},${c.y},${p.layer}`);
 for(const c of clip.cells){const x=at.x+c.x,y=at.y+c.y;if(x<0||y<0||x>=map.width||y>=map.height)throw Error('Move stays inside the map; choose another destination.');for(let l=0;l<6;l++)if(c.layers[l]!==null&&map.layers[l][y*map.width+x]&&!erased.has(`${x},${y},${l}`))throw Error('Destination contains artwork on this layer. Move cancelled.');}
 const next=paste(map,clip,at,{erase});
 return next;
}
module.exports={move};
