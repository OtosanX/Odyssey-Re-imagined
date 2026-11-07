'use strict';
const crypto=require('crypto');
const DIRECTIONS=[[0,-1],[1,0],[0,1],[-1,0]];
function attribute(world,map,x,y){return world.maps[map]?.attrs?.[y*world.maps[map].width+x]||{type:0,data:[0,0,0,0]};}
function environment(world,map,x,y){
 const m=world.maps[map];if(!m||m.chat?.local==='silent')return null;
 const a=attribute(world,map,x,y);if(a.type===20&&(a.data[3]&1))return null; // Original light-wall attribute.
 let indoor=!!(m.flags&2);if(a.type===20){if(a.data[3]&2)indoor=false;if(a.data[3]&4)indoor=true;}
 return m.chat?.local==='isolated'?'room:'+map:indoor?'room:'+(m.chat?.group||map):'outdoor';
}
// Flood open ground in a 3-by-3 map neighborhood. Doors, walls, indoor boundaries,
// silent maps and warp entrances stop sound; teleport targets are never followed.
function audibleCells(world,p){
 const start=environment(world,p.map,p.x,p.y),out=new Set();if(!start)return out;
 const key=(map,x,y)=>map+':'+x+':'+y,queue=[{map:p.map,x:p.x,y:p.y,mx:0,my:0}];out.add(key(p.map,p.x,p.y));
 for(let at=0;at<queue.length;at++){
  const q=queue[at],m=world.maps[q.map];
  for(let d=0;d<4;d++){
   let x=q.x+DIRECTIONS[d][0],y=q.y+DIRECTIONS[d][1],map=q.map,mx=q.mx,my=q.my;
   if(x<0||y<0||x>=m.width||y>=m.height){
    map=m.exits?.[d];const dest=world.maps[map];if(!dest||dest.exits?.[(d+2)%4]!==q.map)continue;
    mx+=DIRECTIONS[d][0];my+=DIRECTIONS[d][1];if(Math.abs(mx)>1||Math.abs(my)>1)continue;
    if(start!=='outdoor'&&!(m.chat?.group&&dest.chat?.group===m.chat.group))continue;
    if(x<0)x=dest.width-1;else if(x>=m.width)x=0;if(y<0)y=dest.height-1;else if(y>=m.height)y=0;
   }
   const dest=world.maps[map];if(x<0||y<0||x>=dest.width||y>=dest.height||dest.blocked[y*dest.width+x]||attribute(world,map,x,y).type===2||environment(world,map,x,y)!==start)continue;
   const k=key(map,x,y);if(out.has(k))continue;out.add(k);queue.push({map,x,y,mx,my});
  }
 }
 return out;
}
function category(text){return /\b(hit|hits|damage|defeated|death|died|respawn|combat|killed|slain|healed)\b/i.test(text)?'combat':'system';}
function extend(Base){return class ChatWorld extends Base{
 constructor(...args){super(...args);this.chatPrefix=crypto.randomBytes(6).toString('hex');this.chatSequence=0;this.chatRates=new WeakMap();this.chatNotices=new WeakMap();this.chatPending=[];this.chatDepth=0;}
 event(channel,text,details={}){return {id:this.chatPrefix+':'+(++this.chatSequence),time:Date.now(),channel,text,...details};}
 deliver(client,event){client.send(4,16,Buffer.from(JSON.stringify(event)));}
 log(p,text,channel=category(text),details={}){if(!p||!text)return;this.chatPending.push({p,event:this.event(channel,String(text).slice(0,1000),details)});}
 flushChat(){if(this.chatDepth||!this.chatPending)return;const list=this.chatPending.splice(0);for(const {p,event} of list){const c=this.client(p);if(c)this.deliver(c,event);}}
 recordDialogue(p,role,text,speaker){const entry=super.recordDialogue(p,role,text,speaker);if(this.chatPending)this.log(p,role==='player'?'You: '+entry.text:entry.text,'npc',{id:'dialogue:'+entry.id,role,speaker:entry.speaker,map:p.map,time:entry.time});return entry;}
 message(p,text){const before=p?.dialogueHistorySeq||0;super.message(p,text);if(p&&(p.dialogueHistorySeq||0)===before&&this.chatPending)this.log(p,text);}
 tell(c,notice=''){super.tell(c,notice);const p=this.players.get(c);if(p&&notice&&notice!==p.journal?.at(-1)){const last=this.chatNotices?.get(p);if(!last||last.text!==notice||Date.now()-last.time>1200){this.log(p,notice);this.chatNotices?.set(p,{text:notice,time:Date.now()});}}this.flushChat();}
 runScript(name,args=[]){
  const begin=this.chatPending?.length||0,lastError=this.scriptErrors?.at(-1),result=super.runScript(name,args);
  // Failed script side effects are rolled back by GameWorld. Discard their chat too.
  if(this.chatPending&&this.scriptErrors.at(-1)!==lastError){const final=this.chatPending.at(-1);this.chatPending.splice(begin);if(final&&/not available yet/.test(final.event.text))this.chatPending.push(final);}return result;
 }
 endChatBatch(){this._interactionPlayer=null;for(const p of this.players.values())p._dialogueBatch=false;}
 tick(){this.chatDepth++;try{return super.tick();}finally{this.endChatBatch();this.chatDepth--;this.flushChat();}}
 process(msg,c){if(!c.account)return;if(msg.id===16){const p=this.players.get(c);if(p)this.playerChat(c,p,msg.data);return;}this.chatDepth++;try{const result=super.process(msg,c);if(msg.id===0){const p=this.players.get(c);for(const entry of p?.dialogueHistory||[])this.deliver(c,{id:'dialogue:'+entry.id,time:entry.time,channel:'npc',text:entry.role==='player'?'You: '+entry.text:entry.text,role:entry.role,speaker:entry.speaker,map:entry.map,history:true});}return result;}finally{this.endChatBatch();this.chatDepth--;this.flushChat();}}
 playerChat(c,p,raw){
  const fail=text=>this.deliver(c,this.event('system',text));
  const now=Date.now(),r=this.chatRates.get(c)||{tokens:4,time:now};r.tokens=Math.min(4,r.tokens+(now-r.time)/1200);r.time=now;this.chatRates.set(c,r);if(r.tokens<1)return fail('You are sending messages too quickly. Please wait a moment.');r.tokens--;
  try{
   if(!Buffer.isBuffer(raw)||raw.length>2048)throw Error('Chat message is too long.');const a=JSON.parse(raw.toString('utf8'));
   if(!a||!['world','local','guild','party','trade','whisper'].includes(a.channel)||typeof a.text!=='string')throw Error('Choose a valid chat channel.');
   const text=a.text.replace(/[\u0000-\u001f\u007f-\u009f]/g,' ').trim();if(!text)throw Error('Enter a message.');if(Array.from(text).length>400)throw Error('Messages may contain up to 400 characters.');
   let recipients=[];const online=[...this.players.entries()];
   if(a.channel==='world')recipients=online;
   if(a.channel==='trade'){if(this.options.mode!=='mmo')throw Error('Trade chat is available in MMO worlds.');recipients=online;}
   if(a.channel==='party'){if(this.options.mode!=='story')throw Error('Party chat is for the players in your Story save.');recipients=online;}
   if(a.channel==='guild'){const g=this.game.guilds[p.guild];if(!g||!g.members.includes(p.name))throw Error('Join a guild to use Guild chat.');recipients=online.filter(([,q])=>q.guild===p.guild&&g.members.includes(q.name));}
   if(a.channel==='local'){const cells=audibleCells(this,p);if(!cells.size)throw Error('Local chat is disabled in this area.');recipients=online.filter(([,q])=>cells.has(q.map+':'+q.x+':'+q.y));}
   let target;
   if(a.channel==='whisper'){if(typeof a.target!=='string'||!/^[a-zA-Z0-9_]{3,24}$/.test(a.target))throw Error('Enter the recipient’s account name.');const recipient=online.find(([,q])=>q.name.toLowerCase()===a.target.toLowerCase());if(!recipient)throw Error('That player is not online in this world.');target=recipient[1].name;recipients=[...new Map([[c,p],recipient]).entries()];}
   const event=this.event(a.channel,text,{sender:p.name,map:p.map,...(target?{target}:{})});for(const [client] of recipients)this.deliver(client,event);
  }catch(e){fail(e.message);}
 }
};}
module.exports={extend,audibleCells,environment};
