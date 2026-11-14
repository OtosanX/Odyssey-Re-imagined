process.env.ODYSSEY_WEB_PORT='0';
const {spawn}=require('child_process');
const fs=require('fs'),os=require('os'),path=require('path'),assert=require('assert');
const root=path.join(__dirname,'server');
const tmp=fs.mkdtempSync(path.join(os.tmpdir(),'odyssey-test-'));
const {installMap}=require('./tools/import-map.cjs');
const fixture=JSON.parse(fs.readFileSync(path.join(root,'data/world.json'),'utf8'));
installMap(fixture,tmp);
installMap(fixture,tmp);
assert(fs.readdirSync(tmp).some(f=>f.startsWith('world.backup-')),'import keeps a backup');
const invalid=JSON.parse(JSON.stringify(fixture));invalid.anchors[0].x=-1;
assert.throws(()=>installMap(invalid,tmp));
assert.deepEqual(JSON.parse(fs.readFileSync(path.join(tmp,'world.json'),'utf8')),fixture,'invalid import leaves map intact');
const config={game:{accounts:{file:'accounts.data'}},server:{port:15751,adminPort:13000,dataFolder:tmp,interval:100},scripts:{directory:'scripts'}};
fs.writeFileSync(path.join(tmp,'config.json'),JSON.stringify(config));
const {Network}=require('./client/src/bin/network');
const server=spawn(process.execPath,['bin/odyssey.js','--config',path.join(tmp,'config.json')],{cwd:root,stdio:['ignore','pipe','pipe']});
let output='';server.stdout.on('data',d=>output+=d);server.stderr.on('data',d=>output+=d);
const delay=ms=>new Promise(r=>setTimeout(r,ms));
function receive(net,system,id){return new Promise((resolve,reject)=>{const timer=setTimeout(()=>{net.removeListener('message',handler);reject(Error('Response timeout '+output));},5000);const handler=msg=>{if(msg.system===system&&msg.id===id){clearTimeout(timer);net.removeListener('message',handler);resolve(msg.data);}};net.on('message',handler);});}
async function send(net,s,id,data){const reply=receive(net,s,id);net.send(s,id,data);return reply;}
(async()=>{
 let a,b;
 try{
  const deadline=Date.now()+10000;
  while(!output.includes('Listening on 15751')){if(server.exitCode!==null||Date.now()>deadline)throw Error('Server startup: '+output);await delay(100);}
  a=new Network('127.0.0.1',15751);await a.connect();
  const credentials=Buffer.from('tester\0password123');
  assert.equal((await send(a,1,0,credentials))[0],0);
  assert.equal((await send(a,1,0,credentials))[0],3);
  assert.equal((await send(a,1,1,Buffer.from('tester\0incorrect')))[0],1);
  assert.equal((await send(a,1,1,credentials))[0],0);
  const players=receive(a,4,1);const world=JSON.parse((await send(a,4,0,Buffer.alloc(0))).toString());
  assert.equal(world.tiles.length,fixture.width*fixture.height);
  assert.deepEqual(world.layers,fixture.layers);assert.deepEqual(world.anchors,fixture.anchors);
  let initial=JSON.parse((await players).toString())[0];
  const spawn=fixture.anchors.find(a=>a.id===fixture.spawnAnchor);assert.equal(initial.x,spawn.x);assert.equal(initial.y,spawn.y);
  let moved=JSON.parse((await send(a,4,1,Buffer.from([1]))).toString())[0];assert.equal(moved.x,initial.x+1);
  await send(a,1,2,Buffer.alloc(0));assert(fs.existsSync(path.join(tmp,'progress-custom.json')));
  b=new Network('127.0.0.1',15751);await b.connect();assert.equal((await send(b,1,1,credentials))[0],0);
  const restored=receive(b,4,1);await send(b,4,0,Buffer.alloc(0));assert.equal(JSON.parse((await restored).toString())[0].x,moved.x);
  // TCP may split a four-byte header anywhere.
  await send(b,1,2,Buffer.alloc(0));const response=receive(b,1,1);const payload=credentials;
  const packet=Buffer.alloc(4+payload.length);packet[0]=1;packet[1]=1;packet.writeUInt16BE(payload.length,2);payload.copy(packet,4);
  b.socket.write(packet.subarray(0,2));await delay(30);b.socket.write(packet.subarray(2));assert.equal((await response)[0],0);
  console.log('PASS: import backup, invalid import rejection, six map layers, anchor round trip, spawn anchor, registration, duplicate name, bad password, login, movement, saved position, fragmented TCP header');
 }finally{if(a)a.socket.destroy();if(b)b.socket.destroy();server.kill();}
})().catch(e=>{console.error(e);process.exitCode=1;});
