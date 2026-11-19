'use strict';
const assert=require('assert/strict'),{shapedWalls}=require('../client/src/views/game/scenery-models');
for(const shape of ['east-west','north-south','corner-nw'])for(const phase of [0,1]){
 const id=7001+phase,material={page:{},uv:[0,0,1,1]},faces=[];
 const world={width:1,height:1,visual3d:{assetProfiles:{[id]:{kind:'wall',wallShape:shape,wallThickness:.22}}},_conversionPreview:{wallTextures:{[id]:true}}};
 const scene={world,terrain:{at:()=>0},tileAtlas:{tile:n=>{assert.equal(n,id);return material;}},geometry:{quad:(g,m)=>faces.push(m)},artAnalysis:()=>{throw Error('Full wall texture must not be replaced with a small sampled patch');}};
 const cell={x:0,y:0,pixels:new Uint8Array(1024).fill(1),parts:[{id:7001,alternate:7002}]};
 assert(shapedWalls(scene,[],{kind:'wall',cells:[cell]},phase).has(cell));assert(faces.length>=5);assert(faces.every(m=>m===material));
}
console.log('PASS: converted straight/corner walls retain full texture UVs in both animation frames, without patch sampling.');
