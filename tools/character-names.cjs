'use strict';
const fs=require('fs'),path=require('path'),crypto=require('crypto');
class CharacterNames{
 constructor(router){this.router=router;this.file=path.join(router.directory,'characters.json');this.entries=fs.existsSync(this.file)?router.read(this.file):[];if(!Array.isArray(this.entries))throw Error('Invalid character index.');}
 owned(owner,room){return this.entries.filter(e=>e.owner===owner&&(!room||e.room===room));}
 validate(name){if(typeof name!=='string'||! /^[A-Za-z][A-Za-z0-9_]{2,23}$/.test(name.trim()))throw Error('Character names need 3–24 letters, numbers or underscores, starting with a letter.');return name.trim();}
 check(name){name=this.validate(name);const key=name.toLowerCase();if(this.entries.some(e=>e.name.toLowerCase()===key))throw Error('That character name is already taken on this server.');const files=[this.router.catalog.normalFile(),...fs.readdirSync(this.router.directory).filter(n=>/^(mmo-|story-).*\.json$/.test(n)).map(n=>path.join(this.router.directory,n))];for(const file of files){if(!fs.existsSync(file))continue;const data=this.router.read(file);if(Object.keys(data.profiles||{}).some(n=>n.toLowerCase()===key))throw Error('That character name is already taken on this server.');}return name;}
 create(owner,room,name){name=this.check(name);const entry={id:'char-'+crypto.randomBytes(12).toString('hex'),owner,room,name};this.entries.push(entry);try{this.router.write(this.file,this.entries);}catch(e){this.entries.pop();throw e;}return entry;}
}
module.exports={CharacterNames};
