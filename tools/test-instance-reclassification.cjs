'use strict';
// Isolated checks for per-placement rendering overrides (Priority 1):
// instance scope participates in classification with precedence
// instance > map region assetProfiles > installation overrides > catalogue.
const assert=require('assert');
const profiles=require('../client/src/views/game/scenery-profiles');
const {sceneryLayout}=require('../client/src/views/game/scenery-layout');
const {validateVisual}=require('../visual-format.cjs');
const catalog=require('../client/src/views/game/scenery-catalog');
const overridesFile=require('../client/src/views/game/scenery-profile-overrides');

const art=()=>({alpha:new Uint8Array(1024),coverage:1});
const wallId=Object.keys(catalog).map(Number).find(id=>catalog[id].kind==='wall'&&!catalog[id].family&&!catalog[id].join&&!catalog[id].collisionOnly);
assert(wallId,'catalogue must contain an unrestored wall-classified tile');
const baseWorld=()=>({width:4,height:4,layers:[0,1,2,3,4,5].map(()=>new Array(16).fill(0)),blocked:new Array(16).fill(0)});

{ // Automatic classification is unchanged without overrides.
 const world=baseWorld(),id=wallId,x=1,y=1;world.layers[2][y*world.width+x]=id;
 const layout=sceneryLayout(world,art);
 assert.equal(layout.groups.length,1,'wall art still groups once');
 assert.equal(layout.groups[0].kind,'wall');
}
{ // Instance override re-classifies a single placement as ground.
 const world=baseWorld(),id=wallId,x=1,y=1;world.layers[2][y*world.width+x]=id;
 world.visual3d={version:1,instances:[{x,y,tile:id,profile:{kind:'ground'}}]};
 validateVisual(world.visual3d,world.width,world.height);
 const layout=sceneryLayout(world,art);
 assert.equal(layout.groups.length,0,'instance ground override removes the upright group');
 const entry=profiles.profileAt(world,x,y,id);
 assert.equal(entry.kind,'ground','profileAt exposes the instance kind');
}
{ // Precedence: instance > map assetProfiles > installation overrides > catalogue.
 const world=baseWorld(),id=wallId,x=0,y=0;world.layers[2][0]=id;
 world.scene3d={segments:[{x:0,y:0,width:4,height:4,assetProfiles:{[id]:{kind:'object'}},instances:[{x:0,y:0,tile:id,profile:{kind:'ground'}}]}]};
 const entry=profiles.profileAt(world,0,0,id);
 assert.equal(entry.kind,'ground','instance beats map region profile');
 const reference=structuredClone(world);reference.scene3d.segments[0].instances=[];
 assert.equal(profiles.profileAt(reference,0,0,id).kind,'object','map region profile beats catalogue');
 assert.ok((''+(catalog[id].source||'')).length>0,'catalogue provenance present');
 const withoutAll=profiles.profileAt({...world,scene3d:{segments:[{x:0,y:0,width:4,height:4}]},visual3d:undefined},0,0,id);
 assert.equal(withoutAll.kind,catalog[id].kind,'catalogue is the base layer of the precedence');
}
{ // Segment-relative instance coordinates resolve into the connected world.
 const world=baseWorld(),id=wallId,x=3,y=1;world.layers[4][y*world.width+x]=id;
 world.scene3d={segments:[{x:2,y:0,width:12,height:12,instances:[{x:1,y:1,tile:id,profile:{kind:'ground'}}]}]};
 const entry=profiles.profileAt(world,x,y,id);
 assert.equal(entry.kind,'ground','segment offset honoured');
 const layout=sceneryLayout({...world,layers:world.layers.map(l=>l.slice())},art);
 assert.equal(layout.groups.length,0,'outside-region placements still classify');
}
{ // Overrides remain idempotent for group profiles (no double transforms).
 const group={x:0,y:0,width:1,height:1,bottom:32,kind:'object',profile:{heightScale:2,offsetY:.5},cells:[]};
 const before={...group.profile};
 profiles.applyInstance({scene3d:{segments:[{x:0,y:0,width:4,height:4,instances:[{x:0,y:0,tile:337,profile:{heightScale:2,offsetY:.5}}]}]}},group);
 assert.deepEqual(group.profile,before,'second merge of identical override values is a no-op');
 const data=Float32Array.from([0,1,0,0,0,0,0,0,0,2,3,4,0,0,0,0,0,0]),starts=new Map([['p',0]]),copy=Float32Array.from(data);
 profiles.transform(group,new Map([['p',copy]]),starts);
 assert.ok(Math.abs(copy[1]-1.5)<1e-6&&Math.abs(copy[10]-5.5)<1e-6,'height scale applied exactly once');
 assert.ok(data[1]===1&&data[10]===3,'source buffer untouched');
}
{ // The morphology file still validates instance re-classification payloads.
 validateVisual({version:1,instances:[{x:0,y:0,tile:337,profile:{kind:'ground'}},{x:0,y:1,tile:337,profile:{kind:'wall',opening:true}}]},2,2);
 assert.throws(()=>validateVisual({version:1,instances:[{x:0,y:0,tile:337,profile:{kind:'nope'}}]},2,2));
 assert.throws(()=>validateVisual({version:1,instances:[{x:0,y:0,tile:337,profile:{kind:'wall',opening:true,closed:true}}]},2,2));
}
// Selected structures report the effective profile and its provenance.
const toolSource=require('fs').readFileSync(__dirname+'/../client/src/js/studio-workspace.js','utf8');
assert(toolSource.includes('effectiveKind')&&toolSource.includes('scopeContributions'),'Structure Inspector exposes the effective merged profile');
assert(toolSource.includes('scope.value!==')===false,'repair panel no longer hides re-classification at instance scope');
console.log('PASS: instance-scope reclassification with explicit precedence, unchanged automatic classification without overrides, idempotent group profile transforms, morphology validation and inspector provenance.');
