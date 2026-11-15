'use strict';
const assert=require('assert/strict'),{layeredRuinWall}=require('../client/src/views/game/scenery-models'),catalog=require('../client/src/views/game/scenery-catalog');
const maps=require('../server/data/classic-world.json').maps,read=require('./tile-art.cjs').readTiles(),cache=new Map();
const art=id=>{if(!cache.has(id)){const rgba=read(id),alpha=Uint8Array.from({length:1024},(_,n)=>rgba[n*4+3]?1:0);cache.set(id,{rgba,alpha});}return cache.get(id);};
let cells=0;
for(const map of [maps[133],maps[134]])for(let i=0;i<144;i++){
 const id=map.layers[0][i];if(![240,241,242].includes(id))continue;
 const plants=[1,2,4].map(l=>map.layers[l][i]).filter(t=>catalog[t]?.kind==='plant');if(!plants.length)continue;
 const x=i%12,y=Math.floor(i/12),c={x,y,parts:[{id,alternate:id,layer:0}]},quads=[];
 const scene={world:map,artAnalysis:art,terrain:{at:()=>0},tileAtlas:{tile:t=>({page:{id:t},uv:[0,0,1,1]})},geometry:{quad:(g,t,p)=>quads.push(p)}};
 assert(layeredRuinWall(scene,new Map(),c,catalog[id],0));
 const fronts=quads.filter(p=>p.every(v=>v[2]===y+1));let area=0;
 for(const p of fronts){const xs=p.map(v=>v[0]),ys=p.map(v=>v[1]);area+=(Math.max(...xs)-Math.min(...xs))*(Math.max(...ys)-Math.min(...ys))*1024;}
 const expected=Array.from({length:1024},(_,n)=>art(id).alpha[n]&&!plants.some(t=>art(t).alpha[n])).filter(Boolean).length;
 assert.equal(area,expected,'3D stone area must equal visible Classic stone, not a full beam');
 assert.equal(layeredRuinWall(scene,new Map(),c,{...catalog[id],wallShape:'full'},0),false,'explicit editor shape stays authoritative');cells++;
}
assert(cells>10);console.log(`PASS: ${cells} ruin wall cells reproduce the Classic visible stone silhouette; explicit editor shapes preserved.`);
const {ruinReturns}=require('../client/src/views/game/wall-shapes');
const joined={width:12,height:24,layers:maps[133].layers.map((l,n)=>l.concat(maps[134].layers[n])),blocked:maps[133].blocked.concat(maps[134].blocked)};
for(const [x,y,ids] of [[3,11,[241]],[9,11,[242]],[4,12,[241,243]],[5,12,[241]],[7,12,[242]],[8,12,[241,243]]]){
 const c={x,y,parts:ids.map(id=>({id})),pixels:new Uint8Array(1024).fill(1)},sides=ruinReturns(joined,c,{});
 assert(sides.length,'original corner has side returns');
 for(const s of sides){assert.equal(y+s.z,y+1,'side begins at existing front');assert.equal(y+s.z+s.d,y+2,'side ends at next wall front, including map seam');assert(s.w<=.25,'no filled room or roof slab');}
 const blocked=joined.blocked[(y+1)*12+x];joined.blocked[(y+1)*12+x]=0;
 assert(ruinReturns(joined,c,{}).every(s=>s.z+s.d<=1),'never extend into walkable cell');joined.blocked[(y+1)*12+x]=blocked;
}
console.log('PASS: six original corner cells connect north–south across rows/map seams; walkable gaps and open roof space preserved.');
