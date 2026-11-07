'use strict';
const fs=require('fs'),path=require('path'),crypto=require('crypto'),{validateMap}=require('../map-format.cjs');
const clone=x=>JSON.parse(JSON.stringify(x));
// Write immutable generations first. One library manifest rename publishes every
// map and the layout together; interrupted staging leaves only unreferenced files.
function saveBatch(library,changes,world,authorized=new Set()){
 const next=clone(library.meta),generation=crypto.randomUUID(),folder=path.join(library.home,'transactions',generation),prepared=[];
 for(const [key,source]of changes){const e=library.entry(key),map=clone(validateMap(source));if(e.kind==='classic'&&!authorized.has(key))throw Error('Original map is read-only: '+key);if(e.kind==='classic'&&(map.width!==12||map.height!==12))throw Error('Classic dimensions must remain 12 × 12.');delete map.classicId;
  if(e.kind==='classic')map.id=e.id;else{delete map.id;map.customId=key.slice(7);}const text=JSON.stringify(map),record=next.entries[key]||={};if(e.kind==='classic')record.baseHash??=library.entries.get(key).hash;
  Object.assign(record,{draft:true,generation,name:map.name,width:map.width,height:map.height,hash:crypto.createHash('sha256').update(text).digest('hex'),edited:Date.now()});prepared.push([key.replace(':','-')+'.json',text]);
 }
 const savedWorld=clone(world);savedWorld.id||=crypto.randomUUID();if(!/^[a-zA-Z0-9-]+$/.test(savedWorld.id))throw Error('Invalid world ID.');
 const old=next.worlds.find(w=>w.id===savedWorld.id);if(old)Object.assign(old,{name:world.name,generation});else next.worlds.push({id:savedWorld.id,name:world.name,generation});prepared.push(['world-'+savedWorld.id+'.json',JSON.stringify(savedWorld)]);
 fs.mkdirSync(folder,{recursive:true});for(const [name,text]of prepared)fs.writeFileSync(path.join(folder,name),text,{flag:'wx'});
 const previous=library.meta;library.meta=next;try{library.persist();}catch(e){library.meta=previous;throw e;}world.id=savedWorld.id;return world.id;
}
function generationFolder(home,generation){if(!/^[a-zA-Z0-9-]+$/.test(generation))throw Error('Invalid draft generation.');return path.join(home,'transactions',generation);}
module.exports={saveBatch,generationFolder};
