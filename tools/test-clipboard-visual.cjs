'use strict';
// Rendering-property clipboard: tiles, surface overrides, 3D grids and
// houses travel with copied regions; overlay/replace semantics, dedupe,
// identifier uniqueness, collision/anchor independence and caps verified.
const assert=require('assert/strict');
const edit=require('./map-edit-tools.cjs');
const {newMap}=require('../map-format.cjs');
const base=()=>{const m=newMap(16,16);m.visual3d={version:1,heights:new Array(256).fill(0),instances:[{x:2,y:2,tile:337,profile:{kind:'ground'}}],structures:[{id:'hall',type:'house',x:4,y:4,w:3,d:2,height:2,roofHeight:1,roofTiles:new Array(3).fill(111),wallTiles:new Array(3).fill(59)}]};return m;};
{
 // Copy includes rendering metadata; instances shift with the paste.
 const m=base(),clip=edit.copy(m,{x:1,y:1,w:4,h:4});
 assert(clip.visual,'visual chunk captured');
 assert.deepEqual(clip.visual.instances,[{x:1,y:1,tile:337,profile:{kind:'ground'}}],'instances are clip-relative');
 assert.equal(clip.visual.structures.length,0,'structure outside the region is not copied');
 const target=newMap(16,16),pasted=edit.paste(target,JSON.parse(JSON.stringify(clip)),{x:8,y:8});
 assert.equal(pasted.visual3d.instances.length,1,'instance lands at 9,9');
 assert.deepEqual({x:pasted.visual3d.instances[0].x,y:pasted.visual3d.instances[0].y},{x:9,y:9});
 const houseClip=edit.copy(m,{x:4,y:4,w:3,h:3});
 assert.equal(houseClip.visual.structures.length,1,'fully-contained structure is copied');
 const housePaste=edit.paste(newMap(16,16),houseClip,{x:8,y:8});
 assert.equal(housePaste.visual3d.structures[0].id,'hall','unique identifier kept on clean paste');
 assert.deepEqual({x:housePaste.visual3d.structures[0].x,y:housePaste.visual3d.structures[0].y},{x:8,y:8});
}
{
 // Overlay keeps untouched values; replace rewrites the span only.
 const clip=edit.copy(base(),{x:0,y:0,w:2,h:2}); // instance at 2,2 excluded; heights zero here
 clip.visual={version:1,heights:[3,0,0,4]};
 const target=newMap(12,12);
 target.visual3d={version:1,heights:new Array(144).fill(5)};
 const overlay=edit.paste(target,JSON.parse(JSON.stringify(clip)),{x:1,y:1});
 const overlayExpected=Array(144).fill(5);overlayExpected[13]=3;overlayExpected[26]=4;
 assert.deepEqual(overlay.visual3d.heights,overlayExpected,'overlay writes only clip values');
 const replaced=edit.paste(target,JSON.parse(JSON.stringify(clip)),{x:1,y:1},{visualMode:'replace'});
 const replaceExpected=overlayExpected.slice();replaceExpected[14]=0;replaceExpected[25]=0;
 assert.deepEqual(replaced.visual3d.heights,replaceExpected,'replace zeroes the span with clip contents');
 assert.throws(()=>edit.paste(target,clip,{x:-1,y:-1}),/outside/,'negative span rejected');
}
{
 // Copy across drafts keeps collision and anchors independent.
 const m=base();m.blocked[2*16+2]=1;m.anchors=[{id:'a',name:'Gate',x:5,y:5}];m.layers[2][2*16+2]=337;
 const clip=edit.copy(m,{x:2,y:2,w:1,h:1});
 assert.deepEqual(clip.visual.instances,[{x:0,y:0,tile:337,profile:{kind:'ground'}}],'instance travels with its art');
 const pasted=edit.paste(newMap(16,16),JSON.parse(JSON.stringify(clip)),{x:10,y:10});
 assert.equal(pasted.visual3d.instances[0].tile,337,'tile preserved');
 assert.equal(pasted.blocked[10*16+10],0,'collision stays uncopied by default');
 assert(!pasted.anchors.some(a=>a.id==='a'),'draft anchors stay independent');
 assert.equal(pasted.anchors.length,1,'default spawn anchor only');
 assert.equal(pasted.visual3d.instances[0].profile.kind,'ground','profile intact');
}
{
 // Erase-painting source art removes stale overrides; collision untouched.
 const m=base();m.layers[2][2*16+2]=337;
 const value=edit.paste(m,edit.copy(m,{x:2,y:2,w:1,h:1}),{x:9,y:9},{erase:[{x:2,y:2,parts:[{layer:2}]}]});
 assert.equal(value.layers[2][2*16+2],0,'source art erased');
 assert(!value.visual3d.instances.some(i=>i.x===2&&i.y===2),'stale source override removed');
 assert(value.visual3d.instances.some(i=>i.x===9&&i.y===9&&i.tile===337),'destination override present');
}
{
 // House paste takes over overlapping footprints and regenerates ids.
 const m=base(),clip=edit.copy(m,{x:4,y:4,w:3,h:3});
 clip.visual.structures[0].x=0;clip.visual.structures[0].y=0; // align within clip
 const overSelf=edit.paste(m,JSON.parse(JSON.stringify(clip)),{x:4,y:4});
 assert.equal(overSelf.visual3d.structures.length,1,'covering paste replaces the overlapped house without renaming because the old id is gone');
 assert.equal(overSelf.visual3d.structures[0].id,'hall');
 // A second map already owning a different house regenerates the pasted id.
 const busy=newMap(16,16);busy.visual3d={version:1,structures:[{id:'hall',type:'house',x:0,y:0,w:1,d:1,height:1,roofHeight:0,roofTiles:[1],wallTiles:[1]}]};
 const relocated=edit.paste(busy,JSON.parse(JSON.stringify(clip)),{x:4,y:4});
 const ids=relocated.visual3d.structures.map(s=>s.id);
 assert.equal(new Set(ids).size,ids.length,'structure ids unique');
 assert.deepEqual(relocated.visual3d.structures.map(s=>s.x).sort(),[0,4],'both houses present');
 const pastedHouse=relocated.visual3d.structures.find(s=>s.x===4&&s.y===4);
 assert.equal(pastedHouse.id,'hall-1','pasted id regenerated on collision');
}
{
 // Oversized pastes are rejected with explicit messages.
 const m=base(),clip=edit.copy(m,{x:0,y:0,w:8,h:8});
 clip.visual.instances=Array.from({length:1100},(_,n)=>({x:n%8,y:Math.floor(n/8),tile:33,profile:{kind:'ground'}}));
 assert.throws(()=>edit.paste(newMap(16,16),JSON.parse(JSON.stringify(clip)),{x:0,y:0}),/1024/, 'instance cap enforced');
 clip.visual.structures=Array.from({length:33},(_,n)=>({id:'h'+n,type:'house',x:n%16,y:Math.floor(n/16),w:1,d:1,height:1,roofHeight:0,roofTiles:[1],wallTiles:[1]}));
 assert.throws(()=>edit.paste(base(),{width:16,height:16,cells:[{x:0,y:0,layers:[1,0,0,0,0,0],blocked:0}],visual:{version:1,structures:JSON.parse(JSON.stringify(clip.visual.structures))}},{x:0,y:0}),/32 houses/,'house cap enforced');
}
console.log('PASS: rendering-property clipboard — tile data, per-cell surface overrides, heights/walls/wallTiles chunking, overlay vs replace, instance lifecycle and house footprint takeover with unique identifiers.');
