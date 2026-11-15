'use strict';
const assert=require('assert/strict'),fs=require('fs'),crypto=require('crypto');
const {sceneryLayout}=require('../client/src/views/game/scenery-layout');
const catalog=require('../client/src/views/game/scenery-catalog');
const read=require('./tile-art.cjs').readTiles(),cache=new Map();
const art=id=>{if(!cache.has(id)){const rgba=read(id),alpha=Uint8Array.from({length:1024},(_,n)=>rgba[n*4+3]?1:0);cache.set(id,{rgba,alpha,coverage:alpha.reduce((a,b)=>a+b,0)/1024});}return cache.get(id);};
const fixture=()=>({width:3,height:4,layers:Array.from({length:6},()=>Array(12).fill(0)),blocked:Array(12).fill(0)});
const m=fixture();m.layers[2][1]=801;m.layers[2][4]=808;m.layers[4][4]=801;m.layers[2][7]=808;m.layers[4][1]=801;m.blocked[4]=m.blocked[7]=1;
let trees=sceneryLayout(m,art).groups;
assert.equal(trees.length,2,'overlapping trees remain two instances, repeated layers do not duplicate');
assert(trees.every(g=>g.kind==='plant'&&g.height===2&&g.cells.length===2));
assert.deepEqual(trees.map(g=>g.anchor.cellY).sort(),[1,2],'each tree anchored at its own trunk');
m.layers[4][10]=617;trees=sceneryLayout(m,art).groups;
assert.equal(trees.filter(g=>g.kind==='plant').length,2,'unrelated decoration cannot join a tree');
const seam={width:12,height:24,layers:Array.from({length:6},()=>Array(288).fill(0)),blocked:Array(288).fill(0)};
seam.layers[4][11*12+4]=812;seam.layers[2][12*12+4]=819;
assert.equal(sceneryLayout(seam,art).groups.length,1,'tree joins across a connected map boundary');
const file=require.resolve('../server/data/classic-world.json'),before=crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex'),world=require(file);
let total=0,corrected=0;const affected=new Set();
for(const map of Object.values(world.maps))for(const g of sceneryLayout(map,art).groups){
 if(g.kind!=='plant')continue;total++;
 const pieces=g.profile.pieces,expected=pieces?Math.max(...Object.values(pieces).map(p=>p[1]))+1:1;
 assert(g.height<=expected,'tree exceeds its documented artwork height on map '+map.id);
 for(const c of g.cells)for(const p of c.parts)assert.equal(catalog[p.id||p.alternate].family,g.profile.family,'different tree families merged');
 if(g.profile.family.startsWith('swamp-')){corrected++;affected.add(map.id);}
}
assert.equal(crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex'),before,'original maps untouched');
fs.writeFileSync('artifacts/scenery/tree-assembly-audit.json',JSON.stringify({trees:total,correctedTrees:corrected,affectedMaps:[...affected],originalSourceHash:before},null,2));
console.log(`PASS: ${total} tree/plant instances checked; ${corrected} corrected swamp trees/stumps across ${affected.size} maps; overlapping layers, separate roots and map seams preserved.`);
