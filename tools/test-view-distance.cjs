'use strict';
const assert=require('assert/strict'),fs=require('fs'),os=require('os'),path=require('path');
const {World}=require('./world-runtime.cjs'),{newMap}=require('../map-format.cjs'),{MapChunks}=require('../client/src/models/map-chunks');
const dir=fs.mkdtempSync(path.join(os.tmpdir(),'ody-distance-')),maps={};
for(let y=0;y<5;y++)for(let x=0;x<5;x++){const id=y*5+x+1;maps[id]={...newMap(12,12),id,name:'Map '+id,flags:1,attrs:Array.from({length:144},()=>({type:0,data:[0,0,0,0]})),exits:[y?id-5:0,x<4?id+1:0,y<4?id+5:0,x?id-1:0]};maps[id].layers[0].fill(6979);}
fs.writeFileSync(path.join(dir,'classic-world.json'),JSON.stringify({maps,items:[],drops:[],start:{map:13,x:5,y:5}}));
const w=new World(dir),packets=[],c={index:1,account:{username:'tester'},send(s,id,data){assert(data.length<=65535);packets.push({id,data:JSON.parse(data)});}};
w.process({id:0,data:Buffer.alloc(0)},c);const p=w.players.get(c);assert.equal(w.placements(p).length,9);packets.length=0;
w.process({id:18,data:Buffer.from([2])},c);assert.equal(w.renderPlacements(p).length,25);assert.equal(w.placements(p).length,9);
const assembler=new MapChunks(),parts=packets.filter(p=>p.id===18);assert(parts.length>1);let result;for(const part of parts.reverse()){const b=assembler.add(part.data);if(b)result=JSON.parse(b);}assert.equal(result.width,60);assert.equal(result.layers[0].length,3600);assert(result.layers[0].every(v=>v===6979));assert.equal(result.centerX,29);assert.equal(result.shiftX,12);assert.equal(p.x,5);assert.equal(p.map,13);
assert.equal(packets.find(p=>p.id===1).data.find(a=>a.id===1).x,29);assert.equal(assembler.add({...parts[0].data,revision:0}),null);assert.equal(assembler.add({revision:9,count:129,index:0,chunk:'bad'}),null);
packets.length=0;w.process({id:18,data:Buffer.from([255])},c);assert.equal(w.viewRadius(p),1);assert.equal(packets.find(p=>p.id===0).data.width,36);assert.equal(packets.find(p=>p.id===0).data.shiftX,-12);
w.maps[1].exits=[0,0,0,0];w._viewRadii.set(p,2);assert(!w.renderPlacements(p).some(r=>r.id===1),'one-way far links excluded');
console.log('PASS: 25-map scenery, 9-map gameplay range, bounded chunk packets and assembly, coordinates, radius reset and one-way exclusion.');
