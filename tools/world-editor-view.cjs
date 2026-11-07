'use strict';
const {validateMap}=require('../map-format.cjs');
const clone=x=>JSON.parse(JSON.stringify(x));
async function compose(builder){
 const segments=builder.world.segments;if(!segments.length)return null;if(segments.length>64)throw Error('3D inspection supports up to 64 placed segments per layout.');
 const minX=Math.min(...segments.map(s=>s.x))*12,minY=Math.min(...segments.map(s=>s.y))*12,width=(Math.max(...segments.map(s=>s.x))+1)*12-minX,height=(Math.max(...segments.map(s=>s.y))+1)*12-minY;if(width*height>65536)throw Error('This layout is too spread out for one 3D view. Use a closer segment group.');
 const count=width*height,world={name:builder.world.name,width,height,minX,minY,layers:Array.from({length:6},()=>Array(count).fill(0)),blocked:Array(count).fill(1),tiles:Array(count).fill(2),owners:Array(count).fill(null),anchors:[],maps:{},connections:clone(builder.world.connections),scene3d:{version:1,segments:[]},stepMs:150};
 for(const s of segments){const map=await builder.get(s.key),ox=s.x*12-minX,oy=s.y*12-minY;world.maps[s.key]={id:map.id||builder.library.entry(s.key).serverId,exits:map.exits||[],attrs:clone(map.attrs||[]),x:ox,y:oy};for(let y=0;y<12;y++)for(let x=0;x<12;x++){const a=y*12+x,b=(y+oy)*width+x+ox;for(let l=0;l<6;l++)world.layers[l][b]=map.layers[l][a];world.blocked[b]=map.blocked[a];world.tiles[b]=map.blocked[a]*2;world.owners[b]={key:s.key,map:map.id||map.customId,x,y,index:a,areaName:map.areaName||map.name};}if(map.visual3d)world.scene3d.segments.push({...clone(map.visual3d),x:ox,y:oy,width:12,height:12});world.anchors.push(...map.anchors.map(a=>({...a,x:a.x+ox,y:a.y+oy,key:s.key})));}
 return world;
}
async function objectEdit(builder,world,group,destination,{remove=false,move=false}={}){
 const updates=new Map(),before=new Map(),get=async(x,y)=>{const p=builder.at(x+world.minX,y+world.minY);if(!p)throw Error('Object would cross an empty segment.');if(!builder.canEdit(p.key))throw Error('Object crosses a protected Classic segment. Duplicate or authorize it first.');if(!updates.has(p.key)){const map=await builder.get(p.key);before.set(p.key,clone(map));updates.set(p.key,clone(map));}return {...p,map:updates.get(p.key)};};
 // Validate every source and destination before committing any draft.
 const sources=[];for(const c of group.cells){const p=await get(c.x,c.y);sources.push({c,p,values:c.parts.map(part=>({layer:part.layer,id:p.map.layers[part.layer][p.index],alternate:part.layer===2||part.layer===4?p.map.layers[part.layer+1][p.index]:null}))});}
 if(move||remove)for(const {p,values}of sources)for(const v of values){p.map.layers[v.layer][p.index]=0;if(v.alternate!==null)p.map.layers[v.layer+1][p.index]=0;}
 if(!remove)for(const {c,values}of sources){const p=await get(destination.x+c.x-group.x,destination.y+c.y-group.y);for(const v of values){p.map.layers[v.layer][p.index]=v.id;if(v.alternate!==null)p.map.layers[v.layer+1][p.index]=v.alternate;}}
 for(const map of updates.values())validateMap(map);builder.commit(before,updates);return [...updates.keys()];
}
module.exports={compose,objectEdit};
