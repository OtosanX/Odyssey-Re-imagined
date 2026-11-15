'use strict';
const m=require('mithril'),Auth=require('../../models/auth'),Appearances=require('./appearances');
function browserVault(){const read=()=>{try{return JSON.parse(localStorage.getItem('odyssey-accounts')||'[]');}catch{return [];}};return {list:async()=>({accounts:read(),canRemember:false}),load:async username=>({username,password:''}),save:async({username})=>{const rows=read();if(!rows.some(r=>r.username===username))rows.push({username});localStorage.setItem('odyssey-accounts',JSON.stringify(rows));},remove:async username=>localStorage.setItem('odyssey-accounts',JSON.stringify(read().filter(r=>r.username!==username)))};}
module.exports=function Login(net){
 const auth=new Auth(net),vault=window.accountVault||browserVault();let accounts=[],canRemember=false,remember=false,form='',availability='',timer,alive=false,showPassword=false,loading=true,loadingAccount=false;
 async function refresh(){try{const result=await vault.list();accounts=result.accounts;canRemember=result.canRemember;}catch(e){auth.status='Saved accounts could not be loaded: '+e.message;}loading=false;if(alive)m.redraw();}
 auth.onSuccess=async(id,credentials)=>{await vault.save({...credentials,remember});await refresh();if(id===0){form='';auth.password='';availability='';showPassword=false;}};
 const availabilityReply=msg=>{if(msg.system!==1||msg.id!==3)return;const name=msg.data.slice(1).toString('utf8');if(name!==auth.username||form!=='create')return;availability=msg.data[0]===0?'Username available':msg.data[0]===1?'Username already taken':msg.data[0]===255?'Availability check unavailable. You can still try creating the account.':'Use 3–24 letters, numbers or underscores.';m.redraw();};
 async function choose(username){if(auth.status==='pending'||loadingAccount)return;loadingAccount=true;m.redraw();try{const saved=await vault.load(username);auth.username=username;auth.password=saved.password||'';remember=!!saved.password;auth.status='';availability='';form='signin';showPassword=false;}catch(e){auth.status='Could not open this saved account: '+e.message;}loadingAccount=false;if(alive)m.redraw();}
 function begin(kind){if(auth.status==='pending')return;form=kind;auth.username='';auth.password='';auth.status='';availability='';remember=false;showPassword=false;}
 function username(value){auth.username=value;availability='';clearTimeout(timer);if(form==='create'&&/^[a-zA-Z0-9_]{3,24}$/.test(value)){availability='Checking username…';timer=setTimeout(()=>net.send(1,3,Buffer.from(value)),400);}}
 return {
  oninit(){alive=true;form='';auth.password='';auth.status='';showPassword=false;availability='';net.on('message',availabilityReply);window.addEventListener('focus',refresh);refresh();},
  onremove(){alive=false;window.removeEventListener('focus',refresh);clearTimeout(timer);net.removeListener('message',availabilityReply);},
  view(){const busy=auth.status==='pending'||loadingAccount;return m('main.account-screen.rpg-shell',[
   m('.rpg-masthead',[m('span.rpg-eyebrow','THE ODYSSEY CONTINUES'),m('h1','Odyssey Reimagined'),m('p',form?'Your next adventure begins here.':'Choose your account to begin your adventure.')]),
   !form?[
    m('.screen-heading',[m('h2','Choose an account'),m('span.rpg-muted','Saved on this device')]),loading?m('p.rpg-loading',{role:'status'},'Loading remembered accounts…'):null,
    m('.account-cards',[
     ...accounts.map(a=>{const sprite=a.avatar||Appearances.remembered(a.username);return m('.account-card',{key:a.username},[
      m('button.account-choice',{disabled:busy,onclick:()=>choose(a.username)},[sprite?m(Appearances.Portrait,{sprite,scale:3}):m('span.account-avatar',a.username[0].toUpperCase()),m('strong',a.username),m('span.card-action','Sign In →')]),
      m('button.forget-account',{disabled:busy,title:'Remove this account from this device only',onclick:async()=>{try{await vault.remove(a.username);await refresh();}catch(e){auth.status=e.message;}}},'Forget on this device')]);}),
     m('button.account-card.add-account',{disabled:busy,onclick:()=>begin('create')},[m('span.plus','+'),m('strong','Add Account'),m('small','Create a new server account')])
    ]),m('button.rpg-primary',{disabled:busy,onclick:()=>begin('existing')},'Sign in with username and password'),m('p.account-status',{role:'status'},loadingAccount?'Opening saved account…':auth.status)
   ]:m('form.account-form.rpg-panel',{onsubmit:e=>{e.preventDefault();if(form==='create')auth.createAccount();else auth.login();}},[
    m('span.rpg-eyebrow',form==='create'?'A NEW BEGINNING':'WELCOME BACK'),m('h2',form==='create'?'Create Account':'Sign In'),
    m('p.rpg-muted',form==='create'?'Username: 3–24 characters. Password: 6–24 characters. Use letters, numbers or underscores.':'Enter your username and password for this server.'),
    m('label',['Username',m('input',{type:'text',disabled:busy,value:auth.username,readonly:form==='signin',autocomplete:'username',maxLength:24,oninput:e=>username(e.target.value)})]),
    form==='create'?m('p.availability',{class:availability.includes('taken')?'error':'',role:'status'},availability):null,
    m('label',['Password',m('.password-field',[m('input',{type:showPassword?'text':'password',disabled:busy,value:auth.password,autocomplete:form==='create'?'new-password':'current-password',oninput:e=>auth.setPassword(e.target.value)}),m('button.password-toggle',{type:'button',disabled:busy,'aria-label':showPassword?'Hide password':'Show password','aria-pressed':showPassword,onclick:()=>showPassword=!showPassword},showPassword?'Hide':'Show')])]),
    canRemember?m('label.remember-account',[m('input',{type:'checkbox',disabled:busy,checked:remember,onchange:e=>remember=e.target.checked}),'Remember password on this PC (protected by Windows)']):m('small.rpg-muted','This device remembers account names. Enter your password to sign in.'),
    m('p.account-status',{role:'status','aria-live':'polite'},busy?'Signing in…':auth.status),
    m('.rpg-actions',[m('button.rpg-primary',{type:'submit',disabled:!auth.canSubmit()||form==='create'&&availability.includes('taken')},busy?'Please wait…':form==='create'?'Create Account':'Sign In'),m('button',{type:'button',disabled:busy,onclick:()=>begin(form==='create'?'existing':'create')},form==='create'?'Use Existing Account':'Create Account'),m('button.rpg-back',{type:'button',disabled:busy,onclick:()=>{form='';auth.status='';auth.password='';showPassword=false;}},'Back')])
   ]),m('p.rpg-footnote','Up to four desktop game clients can run at once.')
  ]);}
 };
};
