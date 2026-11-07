'use strict';
// Studio metadata is deliberately separate from server IDs and map exits.
const fs=require('fs'),fsp=fs.promises,path=require('path'),crypto=require('crypto');
const {validateMap,newMap}=require('../map-format.cjs');
const copy=x=>JSON.parse(JSON.stringify(x));
const hash=x=>crypto.createHash('sha256').update(typeof x==='string'?x:JSON.stringify(x)).digest('hex');
function atomic(file,value){fs.mkdirSync(path.dirname(file),{recursive:true});fs.writeFileSync(file+'.tmp',JSON.stringify(value));fs.renameSync(file+'.tmp',file);}
function fingerprint(file){const s=fs.statSync(file);return `${s.size}:${s.mtimeMs}`;}
// Only one map record is accumulated. Scripts, monsters, etc. are never parsed here.
async function* streamMaps(file){
 let depth=0,quoted=false,escaped=false,token='',last='',mapsPending=false,inMaps=false,record='',key='';
 for await(const chunk of fs.createReadStream(file,{encoding:'utf8'}))for(const c of chunk){
  if(record)record+=c;
  if(quoted){if(depth<=2&&!record)token+=c;if(escaped)escaped=false;else if(c==='\\')escaped=true;else if(c==='"'){quoted=false;if(depth<=2&&!record)last=JSON.parse(token);}continue;}
  if(c==='"'){quoted=true;escaped=false;if(depth<=2&&!record)token='"';continue;}
  if(c===':'&&depth===1&&last==='maps'){mapsPending=true;continue;}
  if(c==='{'||c==='['){
   if(c==='{'&&mapsPending&&depth===1){inMaps=true;mapsPending=false;}
   else if(c==='{'&&inMaps&&depth===2){key=last;record='{';}
   depth++;continue;
  }
  if(c==='}'||c===']'){
   depth--;
   if(record&&depth===2){const raw=record;record='';yield {id:key,map:JSON.parse(raw),hash:hash(raw)};}
   else if(inMaps&&depth===1)return;
  }
 }
 if(inMaps||depth!==0)throw Error('Incomplete Classic map collection.');
 throw Error('Classic map collection has no maps dictionary.');
}
class MapLibrary{
 constructor(root){
  this.root=root;this.data=path.join(root,'odyssey-2-server-develop/data');this.source=path.join(this.data,'classic-world.json');this.home=path.join(root,'.map-library');this.cache=path.join(root,'.map-library-cache');
  fs.mkdirSync(this.home,{recursive:true});fs.mkdirSync(this.cache,{recursive:true});
  this.metaFile=path.join(this.home,'library.json');
  this.meta=fs.existsSync(this.metaFile)?JSON.parse(fs.readFileSync(this.metaFile,'utf8')):{version:1,folders:[],entries:{},worlds:[]};
  for(const f of [{id:'classic',name:'Classic Maps',parent:null,root:'classic'},{id:'player',name:'Player Made',parent:null,root:'player'},{id:'unsorted',name:'Unsorted',parent:'classic',root:'classic'}])if(!this.meta.folders.some(x=>x.id===f.id))this.meta.folders.push(f);
  this.entries=new Map();this.persist();
 }
 persist(){atomic(this.metaFile,this.meta);}
 record(key){return this.meta.entries[key]||(this.meta.entries[key]={});}
 async init(progress=()=>{}){
  const indexFile=path.join(this.cache,'index.json'),fp=fingerprint(this.source);let index;
  try{index=JSON.parse(await fsp.readFile(indexFile,'utf8'));}catch{}
  if(!index||index.fingerprint!==fp){
   index={fingerprint:fp,maps:[]};let count=0;
   for await(const item of streamMaps(this.source)){
    if(!/^\d+$/.test(item.id))throw Error('Invalid numeric map ID.');
    await fsp.writeFile(path.join(this.cache,`map-${item.id}.json`),JSON.stringify(item.map));
    const m=item.map;
    index.maps.push({id:+item.id,name:m.name,width:m.width,height:m.height,areaName:m.areaName||'',region:m.region||'',tags:Array.isArray(m.tags)?m.tags:[],hash:item.hash,customId:m.libraryOrigin==='player'?m.customId:null});
    if(++count%100===0)progress(count);
   }
   if(fingerprint(this.source)!==fp)throw Error('Maps changed during indexing. Refresh the library.');
   atomic(indexFile,index);
  }
  this.sourceFingerprint=fp;this.entries.clear();
  for(const m of index.maps){const key=m.customId?'custom:'+m.customId:'classic:'+m.id;this.entries.set(key,{...m,key,kind:m.customId?'player':'classic',serverId:m.id,cacheFile:path.join(this.cache,`map-${m.id}.json`)});}
  // Older Studio JSON files are discovered automatically, including nested folders.
  const walk=async dir=>{if(!fs.existsSync(dir))return;for(const d of await fsp.readdir(dir,{withFileTypes:true})){const file=path.join(dir,d.name);if(d.isSymbolicLink())continue;if(d.isDirectory())await walk(file);else if(d.isFile()&&d.name.endsWith('.json')){
   try{const m=validateMap(JSON.parse(await fsp.readFile(file,'utf8'))),relative=path.relative(this.root,file);let key=Object.keys(this.meta.entries).find(k=>this.meta.entries[k].file===relative);if(!key){key=typeof m.customId==='string'&&/^[a-zA-Z0-9-]+$/.test(m.customId)?'custom:'+m.customId:'custom:'+crypto.randomUUID();this.meta.entries[key]={...this.meta.entries[key],file:relative,folder:this.meta.entries[key]?.folder||'player',sourceClassicId:m.classicId??m.sourceClassicId};}this.entries.set(key,{key,kind:'player',name:m.name,width:m.width,height:m.height,hash:hash(m),file,serverId:this.record(key).serverId});}catch(e){progress(null,`Skipped ${path.relative(this.root,file)}: ${e.message}`);}
  }}};await walk(path.join(this.root,'maps'));
  for(const [key,r] of Object.entries(this.meta.entries))if(key.startsWith('custom:')&&r.draft&&fs.existsSync(this.draftFile(key))){const m=JSON.parse(await fsp.readFile(this.draftFile(key),'utf8'));this.entries.set(key,{...(this.entries.get(key)||{}),key,kind:'player',name:m.name,width:m.width,height:m.height,hash:hash(m),serverId:r.serverId});}
  this.persist();return this.list();
 }
 draftFile(key){if(!/^(classic:\d+|custom:[a-zA-Z0-9-]+)$/.test(key))throw Error('Invalid map key.');const generation=this.meta.entries[key]?.generation;return path.join(generation?require('./library-transaction.cjs').generationFolder(this.home,generation):path.join(this.home,'drafts'),key.replace(':','-')+'.json');}
 entry(key){const e=this.entries.get(key);if(!e)throw Error('Map no longer exists in the library.');const r=this.record(key);return {...e,...r,key,kind:e.kind,folder:r.folder||(e.kind==='classic'?'unsorted':'player'),name:r.name||e.name,areaName:r.areaName??e.areaName??'',tags:r.tags||e.tags||[],hash:r.hash||e.hash};}
 list(){return [...this.entries.keys()].map(k=>this.entry(k));}
 folderPath(id){const names=[],seen=new Set();let f=this.meta.folders.find(f=>f.id===id);while(f&&!seen.has(f.id)){seen.add(f.id);names.unshift(f.name);f=this.meta.folders.find(x=>x.id===f.parent);}return names.join(' / ');}
 search({query='',filter='all',folder='',sort='name'}={}){
  const terms=query.toLowerCase().trim().split(/\s+/).filter(Boolean);
  const inside=id=>{const seen=new Set();while(id&&!seen.has(id)){if(id===folder)return true;seen.add(id);id=this.meta.folders.find(f=>f.id===id)?.parent;}return false;};
  const found=this.list().filter(e=>{
   if(filter==='classic'&&e.kind!=='classic'||filter==='player'&&e.kind!=='player'||filter==='favorites'&&!e.favorite||filter==='recent'&&!e.edited)return false;
   if(folder&&!inside(e.folder))return false;
   const text=[e.name,e.id,e.serverId,e.key,e.areaName,e.region,this.folderPath(e.folder),...e.tags].join(' ').toLowerCase();return terms.every(t=>text.includes(t));
  });
  found.sort((a,b)=>sort==='recent'||filter==='recent'?(b.edited||0)-(a.edited||0):sort==='id'?String(a.id??a.key).localeCompare(String(b.id??b.key),undefined,{numeric:true}):a.name.localeCompare(b.name)||a.key.localeCompare(b.key));return found;
 }
 async load(key,{original=false}={}){
  const e=this.entry(key),draft=this.draftFile(key);let file=!original&&e.draft&&fs.existsSync(draft)?draft:e.file||e.cacheFile;
  if(!file)throw Error('Map has no saved data.');if(!path.isAbsolute(file))file=path.resolve(this.root,file);
  const relative=path.relative(this.root,file);if(relative.startsWith('..')||path.isAbsolute(relative))throw Error('Map file is outside this workspace.');
  const m=JSON.parse(await fsp.readFile(file,'utf8'));
  if(!m.visual3d&&e.kind==='classic'){const profiles=require('./visual-world.cjs').loadProfiles(this.data);if(profiles[e.id])m.visual3d=copy(profiles[e.id]);}
  if(e.kind==='player'){delete m.classicId;m.customId=key.slice(7);m.sourceClassicId=e.sourceClassicId??m.sourceClassicId;}
  return m;
 }
 update(key,values){const e=this.entry(key);if(values.folder){const f=this.meta.folders.find(f=>f.id===values.folder);if(!f||f.root!==(e.kind==='classic'?'classic':'player'))throw Error('Choose a folder in this map’s library.');}const allowed=['favorite','folder','areaName','region','tags'];for(const k of allowed)if(k in values){if(k==='tags'&&(!Array.isArray(values[k])||values[k].length>50||values[k].some(t=>typeof t!=='string'||t.length>80)))throw Error('Use up to 50 short text tags.');if((k==='areaName'||k==='region')&&(typeof values[k]!=='string'||values[k].length>60))throw Error('Area and region names must be at most 60 characters.');this.record(key)[k]=values[k];if(['areaName','region','tags'].includes(k))this.record(key).metadataDirty=true;}this.persist();return this.entry(key);}
 folder(action,{id,name,parent='player'}={}){
  const f=this.meta.folders.find(f=>f.id===id),p=this.meta.folders.find(f=>f.id===parent);
  if(action==='create'){if(!p)throw Error('Choose a parent folder.');if(!name?.trim()||name.length>80)throw Error('Enter a folder name (1–80 characters).');const next={id:crypto.randomUUID(),name:name.trim(),parent,root:p.root};this.meta.folders.push(next);this.persist();return next;}
  if(!f||['classic','player','unsorted'].includes(id))throw Error('This built-in folder is protected.');
  if(action==='rename'){if(!name?.trim()||name.length>80)throw Error('Enter a folder name (1–80 characters).');f.name=name.trim();}
  else if(action==='move'){if(!p||p.root!==f.root)throw Error('Folders must remain in the same library.');let ancestor=p;while(ancestor){if(ancestor.id===id)throw Error('Cannot move a folder inside itself.');ancestor=this.meta.folders.find(x=>x.id===ancestor.parent);}f.parent=parent;}
  else if(action==='delete'){for(const r of Object.values(this.meta.entries))if(r.folder===id)r.folder=f.parent;for(const child of this.meta.folders)if(child.parent===id)child.parent=f.parent;this.meta.folders=this.meta.folders.filter(x=>x.id!==id);}
  else throw Error('Unknown folder action.');this.persist();
 }
 async create(map=newMap(12,12),folder='player',sourceClassicId){
  const key='custom:'+crypto.randomUUID();map=copy(map);delete map.classicId;delete map.id;delete map.libraryOrigin;map.exits=[0,0,0,0];map.flags??=1;
  // A duplicate retains internal tile attributes for editing, but external warps are
  // deliberately preserved (not retargeted to a guessed copy).
  this.meta.entries[key]={folder,sourceClassicId};this.entries.set(key,{key,kind:'player',name:map.name,width:map.width,height:map.height});
  await this.save(key,map);return key;
 }
 async duplicate(key){const e=this.entry(key),m=await this.load(key);m.name=(m.name+' copy').slice(0,60);return this.create(m,'player',e.kind==='classic'?e.id:e.sourceClassicId);}
 discardClassicDraft(key){const e=this.entry(key);if(e.kind!=='classic')throw Error('Only original-map drafts can be reset.');const file=this.draftFile(key);let backup;if(fs.existsSync(file)){backup=path.join(this.home,'recovery',path.basename(file)+'.'+Date.now()+'.json');fs.mkdirSync(path.dirname(backup),{recursive:true});fs.copyFileSync(file,backup);fs.unlinkSync(file);}for(const k of ['draft','generation','baseHash','hash','name','width','height','edited'])delete this.record(key)[k];this.persist();return backup;}
 async save(key,map,{authorized=false}={}){
  const e=this.entry(key);if(e.kind==='classic'&&!authorized)throw Error('Original map is read-only. Authorize editing or duplicate it.');validateMap(map);if(e.kind==='classic'&&(map.width!==12||map.height!==12))throw Error('Classic dimensions must stay 12 × 12.');
  map=copy(map);delete map.classicId;if(e.kind==='classic'){map.id=e.id;this.record(key).baseHash??=this.entries.get(key).hash;}else{map.customId=key.slice(7);delete map.id;}
  atomic(this.draftFile(key),map);Object.assign(this.record(key),{draft:true,name:map.name,width:map.width,height:map.height,hash:hash(map),edited:Date.now()});this.persist();return this.entry(key);
 }
 saveWorld(world){if(!world.id)world.id=crypto.randomUUID();if(!/^[a-zA-Z0-9-]+$/.test(world.id))throw Error('Invalid world ID.');atomic(path.join(this.home,'worlds',world.id+'.json'),world);const old=this.meta.worlds.find(x=>x.id===world.id);if(old){old.name=world.name;delete old.generation;}else this.meta.worlds.push({id:world.id,name:world.name});this.persist();return world.id;}
 loadWorld(id){if(!this.meta.worlds.some(w=>w.id===id))throw Error('Unknown saved world.');const generation=this.meta.worlds.find(w=>w.id===id).generation;return JSON.parse(fs.readFileSync(generation?path.join(require('./library-transaction.cjs').generationFolder(this.home,generation),'world-'+id+'.json'):path.join(this.home,'worlds',id+'.json'),'utf8'));}
 async planPublish(keys,connections=[]){
  if(fingerprint(this.source)!==this.sourceFingerprint)throw Error('Server maps changed since indexing. Refresh the library before publishing.');
  const world=JSON.parse(await fsp.readFile(this.source,'utf8')),ids=new Map(),used=new Set(Object.keys(world.maps).map(Number));let next=Math.max(0,...used)+1;
  for(const key of new Set([...keys,...connections.flatMap(c=>[c.from,c.to])])){
   const e=this.entry(key);if(e.kind==='classic'&&e.draft&&e.baseHash&&e.baseHash!==this.entries.get(key).hash)throw Error(`Original #${e.id} changed since this draft was created. Export the draft, then reopen the current original before publishing.`);let id=e.kind==='classic'?e.id:e.serverId;
   if(id&&world.maps[id]&&e.kind==='player'&&world.maps[id].customId!==key.slice(7))throw Error('Custom server ID conflict. Refresh the library.');
   if(!id){while(used.has(next))next++;if(next>65535)throw Error('No free 16-bit map IDs remain.');id=next++;used.add(id);}ids.set(key,id);
  }
  const maps={},changes=[],draftHashes={};
  for(const [key,id] of ids){const e=this.entry(key),m=await this.load(key);validateMap(m);if(m.width!==12||m.height!==12)throw Error('Connected worlds require 12 × 12 segments.');if(e.kind==='classic'&&!keys.includes(key)&&!connections.some(c=>c.from===key||c.to===key))continue;
   draftHashes[key]=hash(m);maps[id]={...m,id,areaName:e.areaName||m.areaName||'',region:e.region||m.region||'',tags:e.tags};delete maps[id].classicId;
   if(e.kind==='player'){maps[id].libraryOrigin='player';maps[id].customId=key.slice(7);}changes.push(`${e.kind==='classic'?'ORIGINAL':'Player Made'} #${id}: ${m.name}`);
  }
  for(const c of connections){if(!Number.isInteger(c.direction)||c.direction<0||c.direction>3||c.from===c.to)throw Error('Invalid connection.');const a=ids.get(c.from),b=ids.get(c.to),op=(c.direction+2)%4;
   for(const [id,dir,target] of [[a,c.direction,b],[b,op,a]]){const m=maps[id];m.exits=(m.exits||[0,0,0,0]).slice();const old=m.exits[dir]||0;if(old!==target)changes.push(`#${id} ${['north','east','south','west'][dir]}: ${old||'none'} → ${target}${old?' (replaces existing exit; old destination is left unchanged)':''}`);m.exits[dir]=target;}
  }
  for(const m of Object.values(maps)){validateMap(m);if(!Array.isArray(m.exits)||m.exits.length!==4||m.exits.some(n=>!Number.isInteger(n)||n<0||n>65535))throw Error(`Invalid exits on #${m.id}.`);for(let d=0;d<4;d++){const id=m.exits[d];if(id&&!maps[id]&&!world.maps[id]&&world.maps[m.id]?.exits?.[d]!==id)throw Error(`Exit on #${m.id} references missing map #${id}.`);}}
  const startFile=path.join(this.data,'start-location.json');if(fs.existsSync(startFile)){const start=JSON.parse(fs.readFileSync(startFile,'utf8')),m=maps[start.map];if(m&&(m.blocked[start.y*m.width+start.x]||![0,6].includes(m.attrs?.[start.y*m.width+start.x]?.type??0)))throw Error('These edits block the configured starting tile. Move the start in start-location.json before publishing.');}
  return {fingerprint:this.sourceFingerprint,ids:[...ids],maps,changes,draftHashes};
 }
 async publish(plan,{confirmed=false,authorizedOriginals=[]}={}){
  if(!confirmed)throw Error('Publishing requires explicit confirmation of the complete change list.');
  if(fingerprint(this.source)!==plan.fingerprint)throw Error('Server maps changed. Prepare a new publish plan.');
  for(const [key,h] of Object.entries(plan.draftHashes)){if(hash(await this.load(key))!==h)throw Error('A map changed after preparing this plan. Prepare a new plan.');if(key.startsWith('classic:')&&!authorizedOriginals.includes(key))throw Error('Authorize every original map in this publish plan.');}
  const world=JSON.parse(await fsp.readFile(this.source,'utf8'));for(const [id,m] of Object.entries(plan.maps)){validateMap(m);world.maps[id]=m;}
  const backup=this.source+'.backup-'+new Date().toISOString().replace(/[:.]/g,'-');fs.copyFileSync(this.source,backup);atomic(this.source,world);atomic(path.join(this.data,'world-mode.json'),{mode:'classic'});
  for(const [key,id] of plan.ids){this.record(key).serverId=id;atomic(this.draftFile(key),plan.maps[id]);this.record(key).draft=true;this.record(key).metadataDirty=false;this.record(key).hash=hash(plan.maps[id]);if(key.startsWith('classic:'))this.record(key).baseHash=hash(plan.maps[id]);}this.persist();
  return {backup,count:Object.keys(plan.maps).length};
 }
}
module.exports={MapLibrary,streamMaps,hash,fingerprint};
