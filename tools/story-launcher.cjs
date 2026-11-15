'use strict';
const fs=require('fs'),path=require('path'),{CharacterCatalog}=require('./character-catalog.cjs');
// Read saved characters without starting a world or rewriting its save files.
async function storyCards(runtime){const cards=[];for(const profile of runtime.list()){
 const folder=require('./world-paths.cjs').worldData(path.join(runtime.home,'offline',profile.id)),directory=path.join(folder,'sessions'),file=path.join(directory,'story-saves.json');
 if(!fs.existsSync(file)){if(fs.existsSync(path.join(directory,'rooms.json')))cards.push({profileId:profile.id,name:profile.name,legacy:true,location:'Existing Story saves',sprite:1});continue;}
 const saves=JSON.parse(fs.readFileSync(file,'utf8'));for(const save of Object.values(saves))if(!/^story-[a-zA-Z0-9-]{1,80}$/.test(save.room))throw Error('Invalid Story save. Original files were kept.');
 const namesFile=path.join(directory,'characters.json'),entries=fs.existsSync(namesFile)?JSON.parse(fs.readFileSync(namesFile,'utf8')):[];const catalog=new CharacterCatalog({folder,directory,saves,sessions:new Map(),characterNames:{entries,owned:(owner,room)=>entries.filter(e=>e.owner===owner&&(!room||e.room===room))}}),result=await catalog.list({account:{username:profile.name}});
 for(const entry of result.characters)if(entry.mode==='story')cards.push({...entry,profileId:profile.id,profileName:profile.name});
 }return cards.sort((a,b)=>(b.updated||0)-(a.updated||0));}
module.exports={storyCards};
