'use strict';
const {profileAt}=require('./scenery-profiles');
// Classic often paints a wall directly into Ground. Reconstruct the complete
// floor beneath it from nearby opaque floor art, not a clipped sprite remnant.
function floorUnderlay(world,x,y,removed,art){
 const i=y*world.width+x,base=world.layers?.[0]?.[i];
 if(base&&!removed.has('0:'+i))return 0;
 const eligible=(id,xx,yy,l,j)=>id&&!removed.has(l+':'+j)&&profileAt(world,xx,yy,id).kind==='ground'&&art(id).coverage>=.98;
 if(eligible(base,x,y,0,i))return 0;
 const segments=world.scene3d?.segments,region=segments?.find(r=>x>=r.x&&y>=r.y&&x<r.x+r.width&&y<r.y+r.height);
 let best=Infinity,result=0;
 for(let dy=-5;dy<=5;dy++)for(let dx=-5;dx<=5;dx++){
  const xx=x+dx,yy=y+dy,j=yy*world.width+xx;if(xx<0||yy<0||xx>=world.width||yy>=world.height)continue;
  if(region&&(xx<region.x||yy<region.y||xx>=region.x+region.width||yy>=region.y+region.height))continue;
  for(const l of [0,1]){const id=world.layers[l]?.[j];if(!eligible(id,xx,yy,l,j))continue;
   const blocked=world.blocked?world.blocked[j]:world.tiles?.[j]===2;
   const score=Math.abs(dx)+Math.abs(dy)+(blocked?2:0)+l*.1;
   if(score<best){best=score;result=id;}
  }
 }
 return result;
}
module.exports={floorUnderlay};
