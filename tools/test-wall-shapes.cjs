'use strict';
const assert=require('assert/strict'),fs=require('fs'),path=require('path');
const {wallFootprints}=require('../odyssey-2-client-develop/src/views/game/wall-shapes'),{spriteDirection}=require('./editor-playtest.cjs'),{repairSurface}=require('./surface-repair.cjs'),{validateVisual}=require('../visual-format.cjs');
const {sceneryLayout}=require('../odyssey-2-client-develop/src/views/game/scenery-layout'),{readTiles}=require('./tile-art.cjs');
const pixels=new Uint8Array(1024);for(let y=0;y<32;y++)for(let x=0;x<5;x++){pixels[y*32+x]=1;pixels[y*32+31-x]=1;}
const cell={pixels};let shapes=wallFootprints(cell);assert.equal(shapes.length,2,'layered left/right strips remain separate');assert.equal(shapes[0].w,5/32);assert.equal(shapes[1].x,27/32);
assert.equal(wallFootprints(cell,{opening:true}).length,0,'automatic shapes preserve openings');assert.equal(wallFootprints({pixels:new Uint8Array(1024).fill(1)}).length,0,'opaque art is ambiguous');
assert.deepEqual(wallFootprints(cell,{wallShape:'full'})[0],{x:0,z:0,w:1,d:1,source:'explicit full tile'});
const ns=wallFootprints(cell,{wallShape:'north-south',wallThickness:.1,wallAlignment:'end'})[0],ew=wallFootprints(cell,{wallShape:'east-west',wallThickness:.3,wallAlignment:'center'})[0];assert.equal(ns.x,.9);assert.equal(ns.w,.1);assert.equal(ns.d,1);assert.equal(ew.z,.35);assert.equal(ew.w,1);assert.equal(ew.d,.3);
assert.deepEqual([0,1,2,3].map(spriteDirection),[0,3,1,2],'same N/E/S/W sprite rows as gameplay');
assert.throws(()=>validateVisual({version:1,assetProfiles:{243:{wallShape:'diagonal'}}},12,12));assert.throws(()=>validateVisual({version:1,assetProfiles:{243:{wallThickness:2}}},12,12));
const world=require('../odyssey-2-server-develop/data/classic-world.json'),before=JSON.stringify(world.maps[666]);const repaired=repairSurface(world.maps[666],{kind:'wall',tile:243,layer:2,wallShape:'north-south',wallThickness:.2,wallAlignment:'end'}).map;assert(repaired.visual3d.instances.some(i=>i.profile.wallThickness===.2));assert.equal(JSON.stringify(world.maps[666]),before);
const read=readTiles(),cache=new Map();const art=id=>{if(!cache.has(id)){const rgba=read(id),alpha=new Uint8Array(1024);let count=0;for(let i=0;i<1024;i++){alpha[i]=rgba[i*4+3]?1:0;count+=alpha[i];}cache.set(id,{alpha,coverage:count/1024});}return cache.get(id);};
let placements=0,maps=0,multipleStrips=0;const tileCounts={};for(const m of Object.values(world.maps)){let found=0;for(const g of sceneryLayout(m,art).groups)if(g.kind==='wall')for(const c of g.cells){const shapes=wallFootprints(c,c.profile);if(shapes.length){found++;placements++;if(shapes.length>1)multipleStrips++;for(const p of c.parts)if(p.id)tileCounts[p.id]=(tileCounts[p.id]||0)+1;}}if(found)maps++;}
fs.writeFileSync(path.join(__dirname,'../scenery-audit/wall-shape-audit.json'),JSON.stringify({mapsScanned:Object.keys(world.maps).length,mapsWithReliableSideWalls:maps,automaticPlacements:placements,multipleStrips,tileCounts},null,2));
console.log('PASS: wall shape geometry, thickness/alignment validation, preserved openings/collision, gameplay facing. Automatic side-wall evidence: '+placements+' placements across '+maps+' maps.');
