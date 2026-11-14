'use strict';
const assert=require('assert/strict'),fs=require('fs'),crypto=require('crypto');
const {readTiles}=require('./tile-art.cjs');
const {sceneryLayout}=require('../client/src/views/game/scenery-layout');
const catalog=require('../client/src/views/game/scenery-catalog');
const file=require.resolve('../server/data/classic-world.json');
const hash=()=>crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex');
const before=hash(),{maps}=require(file),read=readTiles(),cache=new Map();
const art=id=>{if(!cache.has(id)){const pixels=read(id),alpha=Uint8Array.from({length:1024},(_,n)=>pixels[n*4+3]?1:0);cache.set(id,{alpha,coverage:alpha.reduce((a,b)=>a+b,0)/1024});}return cache.get(id);};
const corrected=new Set([47,105,147,507,735,751,965,1228,1229,1450]);
let placements=0,affectedMaps=0;
for(const map of Object.values(maps)){
 const count=map.layers.flat().filter(id=>corrected.has(id)).length;
 if(!count)continue;
 placements+=count;affectedMaps++;
 const layout=sceneryLayout(map,art);
 for(const group of layout.groups)for(const cell of group.cells)for(const part of cell.parts){
  assert(!corrected.has(part.id),'ground art raised on map '+map.id+' tile '+part.id);
 }
}
for(const id of corrected)assert.equal(catalog[id].kind,'ground');
const hell=sceneryLayout(maps[666],art),raised=id=>hell.groups.some(g=>g.cells.some(c=>c.parts.some(p=>p.id===id||p.alternate===id)));
assert(!raised(147),'untouched Classic Hell floor stays horizontal without a draft');
for(const id of [243,244,266,333,334])assert(raised(id),'Hell wall/fire remains upright: '+id);
assert.equal(hash(),before,'original gameplay data unchanged');
assert.equal(before,'58e2a4abebf84c6d748f2aa5a8b8d48fd97a84417145013a9f9e7b80c9924a70');
console.log(`PASS: ${placements} corrected ground placements across ${affectedMaps} maps; untouched Hell floor flat, walls/fire upright, original gameplay data unchanged.`);
