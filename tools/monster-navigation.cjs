'use strict';
// Original modServer.bas IsVacant: players may cross No Monsters (10),
// but creatures cannot. Secondary attributes carry independent barriers.
function tileAllowed(world,map,x,y,hostile=false){
 if(!world.walkable(map,x,y))return false;const a=world.attrAt(map,y*world.maps[map].width+x);
 if([1,2,3,10,13,14,15,16].includes(a.type)||[1,10,13,14,15,16].includes(a.type2))return false;
 if(a.type===19&&(a.data?.[2]&1)||a.type===20&&(a.data?.[3]&1))return false;
 return !hostile||!world.safeAt(map,x,y);
}
function canStep(world,m,d){
 const delta=[[0,-1],[1,0],[0,1],[-1,0]][d];if(!delta)return false;const x=m.x+delta[0],y=m.y+delta[1],map=world.maps[m.map];
 if(!tileAllowed(world,m.map,x,y,world.hostile(world.content.monsters[m.type])))return false;
 const from=world.attrAt(m.map,m.y*map.width+m.x),to=world.attrAt(m.map,y*map.width+x);
 if(from.type===17&&(from.data[0]&(1<<[1,7,2,4][d]))||to.type===17&&(to.data[0]&(1<<[3,5,0,6][d])))return false;
 return !Array.from(world.players.values()).some(p=>p.hp>0&&p.map===m.map&&p.x===x&&p.y===y)&&!Array.from(world.monsters.values()).some(a=>a!==m&&!a.seeded&&a.hp>0&&a.map===m.map&&a.x===x&&a.y===y);
}
function directionTo(world,m,target){
 // Bounded per-map search; approach an adjacent square, never the player's
 // occupied tile. This avoids greedy pursuit sticking on the first wall.
 const map=world.maps[m.map],queue=[{x:m.x,y:m.y,first:null}],seen=new Set([m.x+':'+m.y]);
 for(let i=0;i<queue.length&&i<map.width*map.height;i++){const node=queue[i];if(Math.abs(node.x-target.x)+Math.abs(node.y-target.y)<=1)return node.first;
  const order=[0,1,2,3].sort((a,b)=>{const ds=[[0,-1],[1,0],[0,1],[-1,0]],da=ds[a],db=ds[b];return Math.abs(node.x+da[0]-target.x)+Math.abs(node.y+da[1]-target.y)-Math.abs(node.x+db[0]-target.x)-Math.abs(node.y+db[1]-target.y);});
  for(const d of order){const delta=[[0,-1],[1,0],[0,1],[-1,0]][d],x=node.x+delta[0],y=node.y+delta[1],key=x+':'+y;if(seen.has(key)||!canStep(world,{...m,x:node.x,y:node.y},d))continue;seen.add(key);queue.push({x,y,first:node.first??d});}
 }return null;
}
module.exports={tileAllowed,canStep,directionTo};
