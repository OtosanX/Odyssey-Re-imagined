'use strict';
const fs=require('fs'),path=require('path'),os=require('os'),assert=require('assert/strict');
const {World}=require('./world-runtime.cjs'),{SessionWorld}=require('./session-world.cjs'),{newMap}=require('../map-format.cjs');
const root=fs.mkdtempSync(path.join(os.tmpdir(),'ody-chat-')),maps={};
class Client{constructor(id,name){this.index=id;this.account={username:name};this.packets=[];}send(system,id,data){assert(data.length<=65535,'packet length');this.packets.push({system,id,data:JSON.parse(data)});}chat(){return this.packets.filter(m=>m.id===16).map(m=>m.data);}last(id){return this.packets.filter(m=>m.id===id).at(-1)?.data;}}
function map(id,flags=1){return maps[id]={...newMap(12,12),id,flags,attrs:Array.from({length:144},()=>({type:0,data:[0,0,0,0]})),exits:[0,0,0,0],monsterSpawns:[]};}
for(let i=1;i<=12;i++)map(i,i===11?3:1);
const positions=[[1,0,0],[2,0,-1],[3,1,0],[4,0,1],[5,-1,0],[6,1,-1],[7,-1,-1],[8,1,1],[9,-1,1],[10,2,0]];
for(const [id,x,y] of positions)for(const [d,[dx,dy]] of [[0,-1],[1,0],[0,1],[-1,0]].entries()){const n=positions.find(([,xx,yy])=>xx===x+dx&&yy===y+dy);if(n)maps[id].exits[d]=n[0];}
maps[2].exits[0]=11;maps[11].exits[2]=2;
const data={maps,items:[],drops:[],monsters:{},npcs:{},scripts:{},start:{map:1,x:5,y:5}};fs.writeFileSync(path.join(root,'classic-world.json'),JSON.stringify(data));
let serial=0;function fresh(options={}){return new World(root,{file:path.join(root,'progress-'+(++serial)+'.json'),...options});}
function player(w,id,name,map=1,x=5,y=5){const c=new Client(id,name),p={id,name,map,x,y,hp:42,maxHP:42,level:1,experience:0,inventory:Array(20).fill(null),equipment:{},guild:0,direction:2,flags:{},questsSeen:[],journal:[]};w.players.set(c,p);return {p,c};}
function clear(w){for(const c of w.players.keys())c.packets=[];}
function say(w,c,channel,text='Hello',extra={}){w.chatRates.delete(c);w.process({id:16,data:Buffer.from(JSON.stringify({channel,text,...extra}))},c);}
{
 const w=fresh(),a=player(w,1,'speaker'),listeners=positions.slice(1).map(([id])=>player(w,id,'listener'+id,id)),indoors=player(w,20,'inside',11),warp=player(w,21,'warp_guest',12);
 say(w,a.c,'local');for(const {p,c}of listeners)assert.equal(c.chat().some(e=>e.channel==='local'),p.map!==10,'3×3 local scope #'+p.map);assert(!indoors.c.chat().length,'indoor cutoff');assert(!warp.c.chat().length,'warp destinations cannot hear');
 clear(w);say(w,a.c,'world','Whole world',{sender:'fake',map:11});for(const c of w.players.keys()){const event=c.chat().find(e=>e.channel==='world');assert.equal(event.sender,'speaker');assert.equal(event.map,1);}
 clear(w);say(w,a.c,'whisper','Private',{target:'INSIDE'});assert.equal(indoors.c.chat()[0].text,'Private');assert.equal(a.c.chat()[0].target,'inside');assert(!listeners[0].c.chat().length);
 clear(w);say(w,a.c,'guild');assert.match(a.c.chat().at(-1).text,/Join a guild/);a.p.guild=1;indoors.p.guild=1;listeners[0].p.guild=2;w.game.guilds[1]={members:['speaker','inside']};clear(w);say(w,a.c,'guild','Guild secret');assert.equal(indoors.c.chat()[0].text,'Guild secret');assert(!listeners[0].c.chat().length);
 clear(w);say(w,a.c,'party');assert.equal(a.c.chat().at(-1).channel,'system');say(w,a.c,'trade','Selling');assert(indoors.c.chat().some(e=>e.channel==='trade'));
 clear(w);say(w,a.c,'world','🙂'.repeat(400));assert.equal(Array.from(indoors.c.chat()[0].text).length,400);clear(w);say(w,a.c,'world','x'.repeat(401));assert.equal(a.c.chat()[0].channel,'system');assert.equal(indoors.c.chat().length,0);
 clear(w);say(w,a.c,'world','one\nline\u0000');assert.equal(indoors.c.chat()[0].text,'one line');
 clear(w);w.chatRates.delete(a.c);for(let i=0;i<5;i++)w.process({id:16,data:Buffer.from(JSON.stringify({channel:'world',text:'burst'+i}))},a.c);assert.equal(indoors.c.chat().length,4);assert.match(a.c.chat().at(-1).text,/too quickly/);
 clear(w);w.chatRates.delete(a.c);w.process({id:16,data:Buffer.from('{broken')},a.c);assert.equal(a.c.chat().at(-1).channel,'system');
}
{
 const w=fresh(),a=player(w,1,'outside'),b=player(w,2,'inside',11),c=player(w,3,'same_room',11,4,5),d=player(w,4,'next_room',11,9,5);
 for(let y=0;y<12;y++)w.maps[11].blocked[y*12+7]=1;clear(w);say(w,b.c,'local','Room');assert(c.c.chat().some(e=>e.text==='Room'));assert(!a.c.chat().length);assert(!d.c.chat().length);
 w.maps[1].chat={local:'silent'};clear(w);say(w,a.c,'local');assert.match(a.c.chat()[0].text,/disabled/);
 delete w.maps[1].chat;w.maps[1].attrs[5*12+5]={type:20,data:[0,0,0,4]};const e=player(w,5,'other_outside',1,6,5);clear(w);say(w,a.c,'local');assert(!e.c.chat().length,'original per-tile indoor flag blocks outdoor hearing');
 // A closed strip at the only shared edge blocks sound into a neighboring map.
 const q=fresh(),p=player(q,1,'left'),neighbor=player(q,2,'right',3);q.maps=JSON.parse(JSON.stringify({1:maps[1],3:maps[3]}));q.maps[1].exits=[0,3,0,0];q.maps[3].exits=[0,0,0,1];for(let y=0;y<12;y++)q.maps[1].blocked[y*12+11]=1;say(q,p.c,'local');assert(!neighbor.c.chat().length);
}
{
 const router=new SessionWorld(root),a=new Client(100,'story_host'),b=new Client(101,'story_guest'),other=new Client(102,'hard_player');
 router.process({id:0,data:Buffer.from(JSON.stringify({mode:'story',difficulty:'normal'}))},a);const code=a.last(2).roomCode;router.process({id:0,data:Buffer.from(JSON.stringify({mode:'story',difficulty:'normal',code}))},b);router.process({id:0,data:Buffer.from(JSON.stringify({mode:'mmo',difficulty:'hardcore'}))},other);
 for(const c of [a,b,other])c.packets=[];router.process({id:16,data:Buffer.from(JSON.stringify({channel:'party',text:'Our party'}))},a);assert.equal(b.chat()[0].text,'Our party');assert(!other.chat().length);router.process({id:15,data:Buffer.from('{}')},a);assert(a.last(8).saves,'chat does not collide with Story-save protocol');
}
{
 const dir=fs.mkdtempSync(path.join(os.tmpdir(),'ody-dialogue-history-'));fs.copyFileSync(path.join(__dirname,'../odyssey-2-server-develop/data/classic-world.json'),path.join(dir,'classic-world.json'));const w=new World(dir),c=new Client(1,'king_visitor');w.process({id:0,data:Buffer.alloc(0)},c);const p=w.players.get(c);w._interactionPlayer=null;p._dialogueBatch=false;w.message(p,'King Dekkar III says, Ambient greeting for passers-by');w.flushChat();p.dialogueHistory.push({id:900000,role:'npc',speaker:'King Dekkar III',map:p.map,text:'Old unclassified ambient line',time:Date.now()});p.lastTalk=0;w.lastTick=Date.now();w.process({id:10,data:Buffer.alloc(0)},c);assert.equal(c.last(2).dialogue.sprite,84,'King uses his actual sprite');assert.equal(c.last(2).dialogue.speaker,'King Dekkar III');assert(!c.last(2).dialogue.history.some(e=>/Ambient greeting|Old unclassified/.test(e.text)),'ambient/legacy unclassified speech excluded from conversation');assert(c.chat().some(e=>e.text.includes('Ambient greeting')),'ambient speech remains in chat log');p.lastTalk=0;w.lastTick=Date.now();w.process({id:10,data:Buffer.from('Hello, Your Majesty')},c);
 assert(p.dialogueHistory.some(e=>e.role==='player'&&e.text==='Hello, Your Majesty'));assert(c.chat().some(e=>e.channel==='npc'&&e.text==='You: Hello, Your Majesty'));assert(c.last(2).dialogue.history.some(e=>e.role==='player'));assert.equal(c.last(2).dialogue.sprite,84);
 const activeBefore=JSON.stringify(p.activeDialogue);w._interactionPlayer=null;p._dialogueBatch=false;w.message(p,'Oracle says, A passing prophecy');w.flushChat();assert.equal(JSON.stringify(p.activeDialogue),activeBefore,'ambient speech does not mutate active conversation');p.lastTalk=0;w.lastTick=Date.now();w.process({id:10,data:Buffer.from('Thanks, Your Majesty')},c);assert(c.last(2).dialogue.history.some(e=>e.role==='player'&&e.text==='Thanks, Your Majesty'));assert(!c.last(2).dialogue.history.some(e=>e.text.includes('passing prophecy')));w.save();w.leave(c);const reload=new World(dir),again=new Client(2,'king_visitor');reload.process({id:0,data:Buffer.alloc(0)},again);assert(again.chat().some(e=>e.history&&e.text==='You: Hello, Your Majesty'),'history survives reconnect');assert(!again.last(2).dialogue,'history does not force a conversation open');
 // Actual numbered choices echo their text, not just a meaningless number.
 const q=reload.players.get(again);q.map=342;q.level=50;q.lastTalk=0;reload.lastTick=Date.now();reload.process({id:10,data:Buffer.alloc(0)},again);const label=q.activeDialogue.choices.find(c=>c.value==='1').label;q.lastTalk=0;reload.lastTick=Date.now();reload.process({id:10,data:Buffer.from('1')},again);assert(q.dialogueHistory.some(e=>e.role==='player'&&e.text===label));
 const n=q.dialogueHistory.length;q.lastTalk=0;reload.lastTick=Date.now();reload.process({id:10,data:Buffer.from('9')},again);assert.equal(q.dialogueHistory.length,n,'invalid replies are not echoed as accepted');
 // Rolled-back script text must not enter the public/private chat logs.
 reload.scripts.chatrollback='sub main(player as long)\nplayermessage(player,"Secret success",7)\ngiveobj(player,999999,1)\nend sub';again.packets=[];reload.runScript('chatrollback',[q.id]);reload.flushChat();assert(!again.chat().some(e=>e.text==='Secret success'));
 q.dialogueInteractive=true;q.dialogueSpeaker='Test';for(let i=0;i<160;i++)reload.recordDialogue(q,i%2?'player':'npc','x'.repeat(1000),'Test');assert.equal(q.dialogueHistory.length,120);q.activeDialogue=reload.dialoguePage(q);q.journal=Array(20).fill('j'.repeat(1000));reload.tell(again);assert(again.packets.every(m=>Buffer.byteLength(JSON.stringify(m.data))<=65535));
}
console.log('PASS: World/Local/Guild/Party/Trade/Whisper routing, connected 3×3 hearing, indoor/room/wall/warp cutoffs, Story/difficulty isolation and protocol compatibility, validation/rate limits, actual King portrait, player reply text, persistent NPC history, rollback privacy and packet bounds.');
