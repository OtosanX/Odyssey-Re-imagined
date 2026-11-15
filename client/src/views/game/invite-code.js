'use strict';
const m=require('mithril');
const InviteCode={
 async copyText(text){
  if(typeof process!=='undefined'&&process.versions?.electron){require('electron').clipboard.writeText(text);return;}
  if(navigator.clipboard?.writeText){try{await navigator.clipboard.writeText(text);return;}catch{ /* HTTP hosts may need the selection fallback. */ }}
  const active=document.activeElement,input=document.createElement('textarea');input.value=text;input.setAttribute('aria-hidden','true');input.style.cssText='position:fixed;left:-10000px;top:0';document.body.append(input);
  try{input.select();if(!document.execCommand('copy'))throw Error('Clipboard unavailable.');}finally{input.remove();active?.focus();}
 },
 oninit(v){Object.assign(v.state,{code:v.attrs.code,visible:false,copied:false,error:false,alive:true,timer:null});},
 onbeforeupdate(v){if(v.state.code!==v.attrs.code){clearTimeout(v.state.timer);Object.assign(v.state,{code:v.attrs.code,visible:false,copied:false,error:false});}},
 onremove(v){v.state.alive=false;clearTimeout(v.state.timer);},
 view(v){const s=v.state;return m('span.invite-code',[
  m('span.invite-label',v.attrs.label||'Join code'),m('code.invite-value',{'aria-label':s.visible?'Join code':'Join code hidden'},s.visible?v.attrs.code:'XXXXXXXX'),
  m('button.invite-eye',{type:'button',title:s.visible?'Hide join code':'Show join code','aria-label':s.visible?'Hide join code':'Show join code','aria-pressed':s.visible,onclick:()=>s.visible=!s.visible},m('svg',{viewBox:'0 0 24 24',width:18,height:18,fill:'none',stroke:'currentColor','stroke-width':1.8,'aria-hidden':'true'},[m('path',{d:'M2 12s3.5-7 10-7 10 7 10 7-3.5 7-10 7S2 12 2 12Z'}),m('circle',{cx:12,cy:12,r:3}),s.visible?null:m('path',{d:'m3 3 18 18'})])),
  m('button.invite-copy',{type:'button','aria-label':'Copy join code',onclick:async()=>{const code=v.attrs.code;try{await InviteCode.copyText(code);if(s.alive&&s.code===code){s.copied=true;s.error=false;clearTimeout(s.timer);s.timer=setTimeout(()=>{s.copied=false;m.redraw();},2000);}}catch{if(s.alive&&s.code===code)s.error=true;}m.redraw();}},s.copied?'Copied!':'Copy'),
  m('span.invite-feedback',{role:'status'},s.error?'Copy unavailable. Reveal and select the code.':s.copied?'Join code copied.':'')
 ]);}
};
module.exports=InviteCode;
