'use strict';
const fs=require('fs'),path=require('path'),crypto=require('crypto'),{fork}=require('child_process');
const SEED_FILES=['classic-world.json','world.json','world-mode.json','start-location.json','visual-world.json'];
function seedWorld(root,workspace){
 const folder=require('./world-paths.cjs').worldData(workspace);fs.mkdirSync(folder,{recursive:true});
 for(const name of SEED_FILES){const source=path.join(root,'server/data',name),dest=path.join(folder,name);if(!fs.existsSync(dest)&&fs.existsSync(source))fs.copyFileSync(source,dest,fs.constants.COPYFILE_EXCL);}
 return folder;
}
function endpoint(host,port){host=String(host||'').trim().toLowerCase();port=Number(port);if(!host||host.length>253||!/^[a-z0-9.:[\]-]+$/.test(host)||!Number.isInteger(port)||port<1||port>65535)throw Error('Enter a hostname or IP address and a port from 1–65535.');return {host:host.replace(/^\[|\]$/g,''),port};}
function vaultKey(server){return crypto.createHash('sha256').update(server.host+':'+server.port).digest('hex');}
function atomic(file,value){fs.mkdirSync(path.dirname(file),{recursive:true});fs.writeFileSync(file+'.tmp',JSON.stringify(value,null,2));fs.renameSync(file+'.tmp',file);}
class DesktopRuntime{
 constructor(root,home,node){this.root=root;this.home=home;this.node=node;this.child=null;this.session=null;this.profiles=path.join(home,'offline-profiles.json');}
 list(){return fs.existsSync(this.profiles)?JSON.parse(fs.readFileSync(this.profiles)):[];}
 add(name){name=String(name||'').trim();if(!/^[a-zA-Z0-9_]{3,24}$/.test(name))throw Error('Profile names use 3–24 letters, numbers or underscores.');const rows=this.list();if(rows.some(p=>p.name.toLowerCase()===name.toLowerCase()))throw Error('That local profile already exists.');const p={id:crypto.randomUUID(),name,password:crypto.randomBytes(12).toString('hex')};rows.push(p);atomic(this.profiles,rows);return p.id;}
 async offline(id,share=false){if(this.child)throw Error('Close the current world before starting another.');const p=this.list().find(p=>p.id===id);if(!p)throw Error('Choose an offline profile.');const workspace=path.join(this.home,'offline',p.id),data=seedWorld(this.root,workspace);const server=await this.start(data,share?{host:'0.0.0.0',port:this.hostConfig().port}:{host:'127.0.0.1',port:0});this.session={...server,offline:true,shared:share,username:p.name,password:p.password,workspace};return this.session;}
 hostConfig(){const file=path.join(this.root,'community-server.json');if(!fs.existsSync(file))atomic(file,{name:'My Odyssey server',host:'0.0.0.0',port:5751,workspace:'community-world'});const config=JSON.parse(fs.readFileSync(file));if(!Number.isInteger(config.port)||config.port<1||config.port>65535||typeof config.workspace!=='string'||!config.workspace)throw Error('Invalid community-server.json. Set a port and workspace.');return {...config,workspace:path.resolve(this.root,config.workspace)};}
 async host(){if(this.child)throw Error('This window already has a running server.');const config=this.hostConfig(),data=seedWorld(this.root,config.workspace);const ready=await this.start(data,{host:config.host||'0.0.0.0',port:config.port});return {...ready,name:config.name,workspace:config.workspace};}
 start(data,options){
  const config={game:{accounts:{file:'accounts.data'}},server:{...options,adminPort:0,adminEnabled:false,webEnabled:false,interval:100,dataFolder:data,log:{level:'error',file:path.join(data,'server.log')}},scripts:{directory:path.join(this.root,'server/scripts')}};
  const configFile=path.join(data,'runtime-config.json');atomic(configFile,config);
  return new Promise((resolve,reject)=>{let settled=false,tail='';const child=fork(path.join(this.root,'server/bin/odyssey.js'),['--config',configFile],{execPath:this.node,cwd:this.root,windowsHide:true,silent:true,env:{...process.env,ELECTRON_RUN_AS_NODE:'1'}});this.child=child;
   const log=fs.createWriteStream(path.join(data,'server.log'),{flags:'a'});child.stdout.pipe(log,{end:false});child.stderr.pipe(log,{end:false});child.stderr.on('data',b=>{tail=(tail+b.toString()).slice(-2500);});
   const fail=e=>{if(!settled){settled=true;clearTimeout(timer);reject(e);}};const timer=setTimeout(()=>{fail(Error('Server startup timed out. See '+path.join(data,'server.log')));child.kill();},20000);
   child.once('error',fail);child.once('exit',code=>{clearTimeout(timer);log.end();if(this.child===child)this.child=null;fail(Error('Server stopped ('+code+'). '+tail));});
   child.on('message',m=>{if(m?.type==='ready'&&!settled){settled=true;clearTimeout(timer);resolve({host:'127.0.0.1',port:m.port});}});
  });
 }
 async stop(){const child=this.child;if(!child)return;await new Promise(resolve=>{const timer=setTimeout(()=>{child.kill();},5000);child.once('exit',()=>{clearTimeout(timer);resolve();});if(child.connected)child.send('shutdown');else child.kill();});this.session=null;}
}
module.exports={DesktopRuntime,seedWorld,endpoint,vaultKey,SEED_FILES};
