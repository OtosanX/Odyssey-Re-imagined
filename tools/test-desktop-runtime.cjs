'use strict';
const assert=require('assert/strict'),fs=require('fs'),path=require('path'),os=require('os');
const {DesktopRuntime,endpoint,vaultKey,seedWorld}=require('./desktop-runtime.cjs');
const {Network}=require('../odyssey-2-client-develop/src/bin/network');
const root=path.resolve(__dirname,'..'),tmp=fs.mkdtempSync(path.join(os.tmpdir(),'odyssey-portable-'));
const runtime=new DesktopRuntime(root,tmp,process.execPath);let net;
function request(system,id,data){return new Promise((resolve,reject)=>{const timer=setTimeout(()=>{net.removeListener('message',reply);reject(Error('Reply timeout '+system+':'+id));},10000);function reply(m){if(m.system!==system||m.id!==(system===4&&id===15?8:id))return;clearTimeout(timer);net.removeListener('message',reply);resolve(m.data);}net.on('message',reply);net.send(system,id,data);});}
(async()=>{
 assert.throws(()=>endpoint('https://bad/path',5751));assert.notEqual(vaultKey(endpoint('one.test',5751)),vaultKey(endpoint('two.test',5751)));
 const id=runtime.add('OfflineTester');assert.throws(()=>runtime.add('offlinetester'));let session=await runtime.offline(id);
 assert.equal(session.host,'127.0.0.1');assert.ok(session.port>0);
 const data=path.join(session.workspace,'odyssey-2-server-develop/data');assert.equal(fs.existsSync(path.join(data,'accounts.data')),true);assert.equal(fs.existsSync(path.join(data,'sessions/story-saves.json')),false);
 net=new Network(session.host,session.port);await net.connect();const credentials=Buffer.from(session.username+'\0'+session.password);
 assert.equal((await request(1,0,credentials))[0],0);assert.equal((await request(1,1,credentials))[0],0);
 const state=new Promise((resolve,reject)=>{const timer=setTimeout(()=>reject(Error('No player state')),10000);net.on('message',m=>{if(m.system===4&&m.id===2){clearTimeout(timer);resolve(JSON.parse(m.data));}});});
 net.send(4,0,Buffer.from(JSON.stringify({action:'create',mode:'story',difficulty:'normal',name:'Offline persistence',sprite:1})));const player=await state;assert.ok(player.hp>0);
 await runtime.stop();net.socket.destroy();const saves=JSON.parse(fs.readFileSync(path.join(data,'sessions/story-saves.json')));assert.equal(Object.values(saves)[0].name,'Offline persistence');
 session=await runtime.offline(id);net=new Network(session.host,session.port);await net.connect();assert.equal((await request(1,1,credentials))[0],0);
 const catalog=JSON.parse(await request(4,15,Buffer.from('{"action":"catalogue"}')));assert.ok(catalog.characters.some(c=>c.mode==='story'&&c.started));
 const other=new DesktopRuntime(root,path.join(tmp,'other'),process.execPath);const second=await other.offline(other.add('SecondTester'));assert.notEqual(second.port,session.port);await other.stop();
 await runtime.stop();net.socket.destroy();assert.equal(fs.existsSync(path.join(data,'.server.lock')),false);
 console.log('PASS: private loopback, automatic-port isolation, authentication, durable Story saves after restart, separate profiles and server credential namespaces.');
})().catch(e=>{console.error(e);process.exitCode=1;}).finally(async()=>{net?.socket.destroy();await runtime.stop();});
