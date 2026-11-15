'use strict';
const fs=require('fs'),path=require('path');
const {streamMaps}=require('./map-library.cjs');
const SPRITE_MIN=1,SPRITE_MAX=643;
class CharacterCatalog{
 constructor(router){this.router=router;this.names=new Map();this.namesPromise=null;this.warnings=[];}
 normalFile(){const r=this.router,mode=path.join(r.folder,'world-mode.json');let classic=fs.existsSync(path.join(r.folder,'classic-world.json'));if(fs.existsSync(mode))classic&&=JSON.parse(fs.readFileSync(mode,'utf8')).mode!=='custom';return path.join(r.folder,'progress-'+(classic?'classic':'custom')+'.json');}
 file(room){return room==='mmo-normal'?this.normalFile():path.join(this.router.directory,room+'.json');}
 profile(room,username,selectedName){
  const owner=username;username=selectedName||this.router.characterNames?.owned(username,room)[0]?.name||username;const registered=this.router.characterNames?.entries?.find(e=>e.name.toLowerCase()===username.toLowerCase());if(registered&&registered.owner!==owner)return null;
  const active=this.router.sessions.get(room);if(active){const p=[...active.players.values()].find(p=>p.name===username);if(p)return p;return active.profiles[username]||null;}
  const file=this.file(room);if(!fs.existsSync(file))return null;
  try{return JSON.parse(fs.readFileSync(file,'utf8')).profiles?.[username]||null;}catch(error){if(fs.existsSync(file+'.backup')){try{this.warnings.push('A save could only be read from its backup. The original files were kept.');return JSON.parse(fs.readFileSync(file+'.backup','utf8')).profiles?.[username]||null;}catch{}}throw Error('Could not read an existing character. Its files have been kept.');}
 }
 async loadNames(){if(this.namesPromise)return this.namesPromise;this.namesPromise=(async()=>{const file=path.join(this.router.folder,'classic-world.json');if(fs.existsSync(file))for await(const {id,map}of streamMaps(file))this.names.set(+id,map.areaName||map.name);else if(fs.existsSync(path.join(this.router.folder,'world.json'))){const m=JSON.parse(fs.readFileSync(path.join(this.router.folder,'world.json'),'utf8'));this.names.set(1,m.areaName||m.name);} })();try{await this.namesPromise;}catch(e){this.namesPromise=null;throw e;}}
 descriptor(c,{mode,difficulty,save,character}){
  const room=save?.room||'mmo-'+difficulty,p=this.profile(room,c.account.username,character?.name),file=this.file(room);
  if(mode==='mmo'&&!p)return null;
  return {id:save?.id||character?.id||'mmo-'+difficulty,mode,difficulty:save?.difficulty||difficulty,saveId:save?.id,name:save?.name||character?.name||this.router.characterNames?.owned(c.account.username,room)[0]?.name||c.account.username,characterName:character?.name||this.router.characterNames?.owned(c.account.username,room)[0]?.name||c.account.username,sprite:p?.sprite??1,level:p?.level??1,map:p?.map??null,location:p?this.names.get(p.map)||'Map #'+p.map:'Not started',updated:p?.lastPlayed||(fs.existsSync(file)?fs.statSync(file).mtimeMs:save?.created)||null,started:!!p,mine:save?save.host===c.account.username:true,owner:save?.host,joinCode:save?.host===c.account.username?save.joinCode:undefined};
 }
 async list(c){await this.loadNames();this.warnings=[];const characters=[];for(const difficulty of ['normal','hardcore']){const owned=this.router.characterNames?.owned(c.account.username,'mmo-'+difficulty)||[];if(owned.length){for(const character of owned){const entry=this.descriptor(c,{mode:'mmo',difficulty,character});if(entry)characters.push(entry);}if(this.profile('mmo-'+difficulty,c.account.username,c.account.username)){const entry=this.descriptor(c,{mode:'mmo',difficulty,character:{id:'mmo-'+difficulty,name:c.account.username}});if(entry)characters.push(entry);}}else{const entry=this.descriptor(c,{mode:'mmo',difficulty});if(entry)characters.push(entry);}}for(const save of Object.values(this.router.saves))if(save.host===c.account.username||save.members.includes(c.account.username))characters.push(this.descriptor(c,{mode:'story',save}));return {characters:characters.sort((a,b)=>(b.updated||0)-(a.updated||0)),capabilities:{characterNaming:true,storySaveNaming:true,spriteMin:SPRITE_MIN,spriteMax:SPRITE_MAX,mmoSlots:['normal','hardcore'].map(difficulty=>({difficulty,available:true}))},warning:[...new Set(this.warnings)].join(' ')};}
 inspect(c,code){code=String(code||'').trim().toUpperCase();if(!/^[A-Z2-9]{8}$/.test(code))throw Error('Enter an 8-character join code.');const save=Object.values(this.router.saves).find(s=>s.joinCode===code);if(!save)throw Error('Join code not found on this server.');return {name:save.name,difficulty:save.difficulty,owner:save.host,code,character:(save.host===c.account.username||save.members.includes(c.account.username))?this.descriptor(c,{mode:'story',save}):null};}
}
module.exports={CharacterCatalog,SPRITE_MIN,SPRITE_MAX};
