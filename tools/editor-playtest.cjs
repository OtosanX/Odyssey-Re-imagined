'use strict';
// Read-only movement preview. No server, account, loot, script or progress writes.
function move(world,p,dir){const delta=[[0,-1],[1,0],[0,1],[-1,0]][dir];if(!delta)return null;let x=p.x+delta[0],y=p.y+delta[1];if(x<0||y<0||x>=world.width||y>=world.height||world.blocked[y*world.width+x])return null;
 const source=world.owners?.[p.y*world.width+p.x],target=world.owners?.[y*world.width+x],from=source?world.maps[source.key]?.attrs[source.index]:world.attrs?.[p.y*world.width+p.x],to=target?world.maps[target.key]?.attrs[target.index]:world.attrs?.[y*world.width+x];
 if(from?.type===17&&(from.data[0]&(1<<[1,7,2,4][dir]))||to?.type===17&&(to.data[0]&(1<<[3,5,0,6][dir])))return null;
 if(source&&target&&source.key!==target.key){const staged=world.connections.some(c=>c.from===source.key&&c.to===target.key&&c.direction===dir||c.to===source.key&&c.from===target.key&&(c.direction+2)%4===dir);if(!staged&&world.maps[source.key].exits[dir]!==world.maps[target.key].id)return null;}
 if(to?.type===2){const destination=Object.values(world.maps||{}).find(m=>m.id===to.data[0]*256+to.data[1]);if(!destination)return {notice:'Teleport destination is not placed in this preview.'};x=destination.x+to.data[2];y=destination.y+to.data[3];if(x<0||y<0||x>=world.width||y>=world.height||world.blocked[y*world.width+x])return null;}
 return {x,y};
}
function spriteDirection(direction){return [0,3,1,2][direction]??1;}
module.exports={move,spriteDirection};
