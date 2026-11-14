'use strict';
const assert=require('assert/strict');
const {structuralFootprint}=require('../client/src/views/game/scenery-models');
const {wallFootprints}=require('../client/src/views/game/wall-shapes');
const maps=require('../server/data/classic-world.json').maps;
const catalog=require('../client/src/views/game/scenery-catalog');
let checked=0;
for(const n of [446,951,60,134]){const m=maps[n];for(let i=0;i<144;i++)for(const id of m.layers.map(l=>l[i])){
 const profile=catalog[id];if(profile?.family!=='structural-cave-rock')continue;
 const c={x:i%12,y:Math.floor(i/12),parts:[{id}],profile};const box=structuralFootprint(m,c,profile);
 assert.equal(!!box,!!m.blocked[i],'rock footprint must follow original blocking');
 if(box){assert.deepEqual([box.x,box.z,box.w,box.d],[0,0,1,1]);checked++;}
 assert.equal(structuralFootprint(m,c,{...profile,wallShape:'east-west'}),null,'manual wall shape wins');
}}
for(const [ids,side] of [[[240,243],.75],[[240,244],0],[[241],0],[[242],.75]]){
 const shapes=wallFootprints({parts:ids.map(id=>({id})),pixels:new Uint8Array(1024).fill(1)});
 assert(shapes.some(s=>s.x===side&&s.d===1),'layered side return survives opaque front');
 assert(shapes.some(s=>s.w===1),'front remains connected');
}
console.log(`PASS: ${checked} solid rock placements, original paths excluded, manual shapes preserved, layered ruin corners connect.`);
