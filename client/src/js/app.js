const {ipcRenderer}=require('electron');
window.accountVault={list:()=>ipcRenderer.invoke('accounts:list'),load:name=>ipcRenderer.invoke('accounts:load',name),save:data=>ipcRenderer.invoke('accounts:save',data),remove:name=>ipcRenderer.invoke('accounts:remove',name)};
const m=require('mithril'),{Network}=require('./bin/network');
(async()=>{
 const session=await ipcRenderer.invoke('desktop:session');
 const net=new Network(session.host,session.port);net.offline=!!session.offline;net.preferredMode=session.mode;net.pendingStoryCode=session.storyCode;net.returnHome=()=>home();net.hostingPort=session.shared?session.port:null;
 const home=async()=>{net.socket.destroy();await ipcRenderer.invoke('desktop:home');};
 const login=session.offline?{oninit:()=>{if(net.username)home();},view:()=>m('.login',[m('h1','Offline play'),m('p','Opening your local profile…'),m('button',{onclick:home},'Back to launcher')])}:require('./views/game/login')(net);
 const original=login.view;login.view=function(...args){return m('div',[original.apply(this,args),!session.offline&&m('button',{style:{position:'fixed',top:'8px',right:'8px'},onclick:home},'Servers / Offline')]);};
 let connectTimer;
 try{
  await Promise.race([net.connect(),new Promise((_,reject)=>{connectTimer=setTimeout(()=>reject(Error('Connection timed out.')),12000);})]);clearTimeout(connectTimer);
  await require('./models/server-admission')(net);
  m.route(document.body,'/login',{'/login':login,'/lobby':require('./views/game/lobby')(net),'/game':require('./views/game/game')(net)});
  if(session.offline){
   // Normal authentication to a private loopback server, never a public bypass.
   const request=id=>new Promise((resolve,reject)=>{const timer=setTimeout(()=>{net.removeListener('message',reply);reject(Error('Local profile did not respond.'));},10000);const reply=msg=>{if(msg.system!==1||msg.id!==id)return;clearTimeout(timer);net.removeListener('message',reply);resolve(msg.data[0]);};net.on('message',reply);net.send(1,id,Buffer.from(session.username+'\0'+session.password));});
   let result=await request(1);if(result===1){const created=await request(0);if(created!==0&&created!==3)throw Error('Could not create local profile.');result=await request(1);}if(result!==0)throw Error('Could not open this offline profile. Your save files have been kept.');
   net.username=session.username;net.launcherReset=true;
   if(session.rotateStoryCode)await new Promise((resolve,reject)=>{const timer=setTimeout(()=>{net.removeListener('message',reply);reject(Error('Could not refresh the Story invitation.'));},10000);function reply(msg){if(msg.system!==4||msg.id!==8)return;clearTimeout(timer);net.removeListener('message',reply);const data=JSON.parse(msg.data);data.error?reject(Error(data.error)):resolve();}net.on('message',reply);net.send(4,15,Buffer.from(JSON.stringify({action:'rotate',saveId:session.storySaveId})));});
   if(session.storySaveId&&session.storyStarted){net.worldOptions={mode:'story',action:'continue',saveId:session.storySaveId};m.route.set('/game');}else{net.createStory=session.createStory;net.openStorySave=session.storySaveId;m.route.set('/lobby');}
  }
 }catch(error){clearTimeout(connectTimer);net.socket.destroy();m.mount(document.body,{view:()=>m('.login',[m('h1','Unable to connect'),m('p',error.message),m('button',{onclick:home},'Back to launcher')])});}
})();


