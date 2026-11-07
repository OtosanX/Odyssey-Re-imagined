'use strict';
const m=require('mithril');
const NAMES={all:'All',local:'Local',world:'World',combat:'Combat',npc:'NPC',guild:'Guild',party:'Party',trade:'Trade',whisper:'Whispers',system:'System'};
const CHANNELS=Object.keys(NAMES);
module.exports=function Chat(net,onFocus=()=>{},onOpen=()=>{}){
 const defaults={height:180,width:100,font:13,collapsed:false};let prefs;
 try{prefs={...defaults,...JSON.parse(localStorage.getItem('odyssey-chat')||'{}')};}catch{prefs={...defaults};}
 let events=[],seen=new Set(),tab='all',channel='local',text='',target='',lastWhisper='',stats={},sizeOpen=false,pinned=true,focusPending=false,drag=null;
 let layoutOptions={};
 const collapsed=()=>layoutOptions.managed?layoutOptions.collapsed:prefs.collapsed;
 const unread=Object.fromEntries(CHANNELS.map(k=>[k,0]));
 const height=()=>Math.max(100,Math.min(+(layoutOptions.managed?layoutOptions.size:prefs.height)||180,480,window.innerHeight*.5));
 const width=()=>Math.max(window.innerWidth<=600?100:45,Math.min(100,+(layoutOptions.managed?layoutOptions.widthPercent:prefs.width)||100));
 const font=()=>Math.max(11,Math.min(20,+prefs.font||13));
 function save(){try{localStorage.setItem('odyssey-chat',JSON.stringify(prefs));}catch{}}
 function add(event){
  if(!event||typeof event.text!=='string'||!CHANNELS.includes(event.channel)||event.channel==='all')return;
  if(event.id&&seen.has(event.id))return;event={...event,id:event.id||'event:'+Date.now()+':'+Math.random(),text:event.text.slice(0,1200)};events.push(event);if(event.id)seen.add(event.id);
  if(events.length>800){const old=events.shift();if(old.id)seen.delete(old.id);}
  if(event.channel==='whisper'&&event.sender&&event.sender!==net.username)lastWhisper=event.sender;
  if(!event.history&&(collapsed()||tab!=='all'&&tab!==event.channel))unread[event.channel]=Math.min(99,unread[event.channel]+1);
  m.redraw();
 }
 function localNotice(line){add({id:'client:'+Date.now()+':'+Math.random(),channel:'system',time:Date.now(),text:line});}
 function switchTab(name){tab=name;pinned=true;if(name==='all')for(const k of CHANNELS)unread[k]=0;else unread[name]=0;if(['local','world','npc','guild','party','trade','whisper'].includes(name))channel=name;m.redraw();}
 function submit(){
  let message=text.trim(),sendChannel=channel,to=target.trim();if(!message)return;
  if(message.startsWith('/')){
   const match=/^\/(\S+)\s*([\s\S]*)$/.exec(message),command=match?.[1].toLowerCase(),rest=match?.[2]||'';
   const aliases={l:'local',local:'local',world:'world',g:'guild',guild:'guild',p:'party',party:'party',trade:'trade',npc:'npc'};
   if(command==='help'){localNotice('/local /world /guild /party /trade /npc, /w name message, /r message, /quests, /craft, /smith. Enter focuses chat; Escape returns to the game. Local reaches connected open ground in a 3×3 map neighborhood; buildings and walls block sound.');text='';return;}
   if(['quests','craft','smith'].includes(command)){net.send(4,10,Buffer.from(message));text='';return;}
   if(command==='w'||command==='whisper'){const parts=/^(\S+)\s+([\s\S]+)$/.exec(rest);if(!parts)return localNotice('Use /w account_name message.');sendChannel='whisper';to=parts[1];message=parts[2];}
   else if(command==='r'||command==='reply'){if(!lastWhisper)return localNotice('There is no whisper to reply to yet.');sendChannel='whisper';to=lastWhisper;message=rest;}
   else if(aliases[command]){sendChannel=aliases[command];message=rest;}
   else return localNotice('Unknown command. Type /help for chat commands.');
  }
  if(!message&&sendChannel!=='npc')return;
  if(Array.from(message).length>(sendChannel==='npc'?160:400))return localNotice(sendChannel==='npc'?'NPC replies may contain up to 160 characters.':'Messages may contain up to 400 characters.');
  if(sendChannel==='npc')net.send(4,10,Buffer.from(message));
  else{if(sendChannel==='whisper'&&!to)return localNotice('Enter the recipient’s account name.');net.send(4,16,Buffer.from(JSON.stringify({channel:sendChannel,text:message,...(sendChannel==='whisper'?{target:to}:{})})));}
  text='';pinned=true;m.redraw();
 }
 function focus(){onOpen();prefs.collapsed=false;layoutOptions.onExpand?.();focusPending=true;onFocus();m.redraw();}
 function focusInput(v){if(focusPending){focusPending=false;v.dom.focus();}}
 function resize(e,both){e.preventDefault();onFocus();drag={id:e.pointerId,x:e.clientX,y:e.clientY,height:height(),width:width(),both};e.currentTarget.setPointerCapture(e.pointerId);}
 function resizeMove(e){if(!drag||e.pointerId!==drag.id)return;prefs.height=Math.max(100,Math.min(480,window.innerHeight*.5,drag.height+drag.y-e.clientY));if(drag.both)prefs.width=Math.max(45,Math.min(100,drag.width+(e.clientX-drag.x)/window.innerWidth*100));m.redraw();}
 function resizeEnd(){if(drag){drag=null;save();}}
 const resizeAttrs=both=>({onpointerdown:e=>resize(e,both),onpointermove:resizeMove,onpointerup:resizeEnd,onpointercancel:resizeEnd});
 const sendOptions=()=>['local','world','npc','guild',...(stats.mode==='story'?['party']:['trade']),'whisper'];
 function label(event){return event.sender?event.channel==='whisper'?`${event.sender} → ${event.target}`:event.sender:'';}
 return {
  add,onState(value){stats=value;},get focused(){return ['INPUT','TEXTAREA','SELECT'].includes(document.activeElement?.tagName)&&!!document.activeElement?.closest?.('.chat-dock');},
  handleKey(e,blocked=false){if(e.target?.closest?.('.chat-dock')){if(e.code==='Escape'){e.preventDefault();e.target.blur();onFocus();return true;}if(['INPUT','TEXTAREA','SELECT'].includes(e.target.tagName)||['Enter','Space'].includes(e.code))return true;e.target.blur();return false;}if(e.code==='Enter'&&!blocked&&!['INPUT','TEXTAREA','SELECT','BUTTON'].includes(e.target?.tagName)&&!e.ctrlKey&&!e.altKey&&!e.metaKey){e.preventDefault();focus();return true;}return false;},
  reset(){events=[];seen.clear();for(const k of CHANNELS)unread[k]=0;lastWhisper='';text='';pinned=true;},
  view(options={}){layoutOptions=options;const visible=events.filter(e=>tab==='all'||e.channel===tab),tabs=CHANNELS.filter(k=>k!=='party'||stats.mode==='story').filter(k=>k!=='trade'||stats.mode!=='story');return m('section.chat-dock',{class:collapsed()?'chat-collapsed':'',style:{height:options.managed?'100%':collapsed()?'39px':height()+'px',width:options.managed?'100%':width()+'%',fontSize:font()+'px'},onfocusin:onFocus,'aria-label':'Game chat'},[
   collapsed()||options.managed?null:m('div.chat-resize-top',{...resizeAttrs(false),role:'separator','aria-label':'Drag to resize chat height'}),
   prefs.collapsed?null:m('div.chat-resize-corner',{...resizeAttrs(true),title:'Drag to resize width and height','aria-label':'Resize chat width and height'}),
   m('.chat-header',[m('.chat-tabs',{role:'tablist','aria-label':'Chat channels'},tabs.map(k=>m('button',{type:'button',role:'tab','aria-selected':tab===k,class:tab===k?'active':'',onclick:()=>switchTab(k)},NAMES[k]+(unread[k]?' ('+unread[k]+')':'')))),m('button.chat-size-button',{type:'button',onclick:()=>{sizeOpen=!sizeOpen;prefs.collapsed=false;options.onExpand?.();save();},'aria-expanded':sizeOpen},'Size'),m('button.chat-collapse',{type:'button',onclick:()=>{if(options.managed)options.onCollapse();else{prefs.collapsed=!prefs.collapsed;save();}},'aria-label':collapsed()?'Expand chat':'Minimize chat'},collapsed()?'▲':'▼')]),
   collapsed()?null:[sizeOpen?m('.chat-size-settings',[
    m('label',[options.managed?'Dock size':'Height',m('input',{type:'range',min:100,max:Math.max(100,Math.min(480,window.innerHeight*.5)),value:height(),oninput:e=>{prefs.height=+e.target.value;options.onResize?.(prefs.height);save();}})]),
    !options.managed||options.horizontal?m('label',['Width',m('input',{type:'range',min:window.innerWidth<=600?100:45,max:100,value:width(),oninput:e=>{prefs.width=+e.target.value;options.onWidth?.(prefs.width);save();}})]):null,
    m('label',['Text',m('input',{type:'range',min:11,max:20,value:font(),oninput:e=>{prefs.font=+e.target.value;save();}})]),m('button',{type:'button',onclick:()=>{prefs={...defaults};options.onResize?.(defaults.height);options.onWidth?.(defaults.width);save();}},'Reset size')]):null,
    m('.chat-log',{role:'log','aria-label':NAMES[tab]+' chat','aria-live':tab==='combat'?'off':'polite',oncreate:v=>{v.dom.scrollTop=v.dom.scrollHeight;},onupdate:v=>{if(pinned)v.dom.scrollTop=v.dom.scrollHeight;},onscroll:e=>{pinned=e.target.scrollHeight-e.target.scrollTop-e.target.clientHeight<24;}},visible.length?visible.map(e=>m('.chat-line',{key:e.id,class:'channel-'+e.channel},[m('time',{datetime:new Date(e.time||Date.now()).toISOString()},new Date(e.time||Date.now()).toLocaleTimeString([],{hour:'2-digit',minute:'2-digit'})),tab==='all'?m('span.chat-channel','['+NAMES[e.channel]+']'):null,label(e)?m('strong',label(e)+': '):null,m('span',e.text)])):m('.chat-empty',tab==='npc'?'NPC conversations and your replies appear here. Press T to talk.':'No messages yet. Enter to chat; /help for commands.')),
    !pinned?m('button.chat-latest',{type:'button',onclick:()=>{pinned=true;}},'Jump to latest'):null,
    m('form.chat-compose',{onsubmit:e=>{e.preventDefault();submit();}},[
     m('select.chat-send-channel',{'aria-label':'Send to channel',value:channel,onchange:e=>channel=e.target.value},sendOptions().map(k=>m('option',{value:k},NAMES[k]))),
     channel==='whisper'?m('input.chat-recipient',{'aria-label':'Whisper recipient',placeholder:'Account name',maxLength:24,value:target,oninput:e=>target=e.target.value}):null,
     m('input#chatInput',{'aria-label':'Chat message',placeholder:channel==='npc'?'Reply to NPC…':'Message… /help',maxLength:800,value:text,oninput:e=>text=e.target.value,onfocus:onFocus,oncreate:focusInput,onupdate:focusInput,autocomplete:'off'}),
     m('button',{type:'submit'},'Send')])]
  ]);}
 };
};
