'use strict';
const fs=require('fs'),path=require('path'),crypto=require('crypto'),{readTiles}=require('./tile-art.cjs'),{sceneryLayout}=require('../odyssey-2-client-develop/src/views/game/scenery-layout'),catalog=require('../odyssey-2-client-develop/src/views/game/scenery-catalog');
const file=path.join(__dirname,'../odyssey-2-server-develop/data/classic-world.json'),source=fs.readFileSync(file),maps=JSON.parse(source).maps,read=readTiles(),cache=new Map(),art=id=>{if(!cache.has(id)){const rgba=read(id),alpha=Uint8Array.from({length:1024},(_,i)=>rgba[i*4+3]?1:0);cache.set(id,{rgba,alpha,coverage:alpha.reduce((a,b)=>a+b)/1024});}return cache.get(id);};
const report={maps:0,trees:0,shrubs:0,groundPlants:0,multiCellTrees:0,groundedOnBlockedRoot:0,originalUnblockedRoots:0,walls:0,monsterBarriers:0,secondaryMonsterBarriers:0,perMap:[],sourceHash:crypto.createHash('sha256').update(source).digest('hex')};
for(const m of Object.values(maps)){const groups=sceneryLayout(m,art).groups,plants=groups.filter(g=>g.kind==='plant'),row={id:m.id,name:m.name,trees:0,shrubs:0,multiCellTrees:0,walls:groups.filter(g=>g.kind==='wall').length,unblockedRoots:[],partialTrees:[]};report.maps++;report.walls+=row.walls;
 for(const g of plants){const form=g.profile?.form||'tree';if(form==='tree'){row.trees++;report.trees++;}else if(form==='shrub'){row.shrubs++;report.shrubs++;}else report.groundPlants++;if(g.cells.length>1&&form==='tree'){row.multiCellTrees++;report.multiCellTrees++;}if(g.anchor.blocked)report.groundedOnBlockedRoot++;else{report.originalUnblockedRoots++;row.unblockedRoots.push({x:g.anchor.cellX,y:g.anchor.cellY,form,tiles:g.cells.flatMap(c=>c.parts.map(p=>p.id))});}
  if(g.profile.pieces){const ids=new Set(g.cells.flatMap(c=>c.parts.map(p=>p.id))),missing=Object.keys(g.profile.pieces).map(Number).filter(id=>!ids.has(id));if(missing.length)row.partialTrees.push({origin:g.origin,root:g.anchor,missing});}
  if(g.profile?.family==='classic-round-tree'&&g.height>2)throw Error('Stacked round trees on map '+m.id);
  if(!Number.isFinite(g.anchor.x)||!Number.isFinite(g.anchor.z))throw Error('Invalid root on '+m.id);
 }
 for(const a of m.attrs||[]){if(a.type===10)report.monsterBarriers++;if(a.type2===10)report.secondaryMonsterBarriers++;}report.perMap.push(row);
}
fs.writeFileSync(path.join(__dirname,'../scenery-audit/structure-audit.json'),JSON.stringify(report,null,2));console.log(JSON.stringify({...report,perMap:undefined},null,2));
