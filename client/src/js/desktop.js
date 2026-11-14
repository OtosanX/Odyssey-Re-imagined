'use strict';
const {ipcRenderer}=require('electron');
const $=id=>document.getElementById(id);let busy=false;
async function info(){const d=await ipcRenderer.invoke('desktop:info'),selected=$('profiles').value;$('profiles').replaceChildren(...d.profiles.map(p=>{const o=document.createElement('option');o.value=p.id;o.textContent=p.name;return o;}));if(d.profiles.some(p=>p.id===selected))$('profiles').value=selected;$('offline').disabled=$('shareProfile').disabled=!d.profiles.length||d.hosting||d.hostOnly;$('connect').disabled=d.hostOnly;$('startHost').disabled=d.hosting;$('stopHost').disabled=!d.hosting;$('saveLocation').textContent=d.profileRoot;$('hostDetails').textContent=(d.hosting?'Running':'Stopped')+' · '+d.hostConfig.name+' · port '+d.hostConfig.port;}
async function run(fn){if(busy)return;busy=true;$('status').textContent='Working…';try{await fn();await info();}catch(e){$('status').textContent=e.message;}finally{busy=false;}}
$('add').onclick=()=>run(async()=>{const id=await ipcRenderer.invoke('desktop:add',$('profileName').value);await info();$('profiles').value=id;$('profileName').value='';$('status').textContent='Local profile created. Choose Play offline.';});
$('offline').onclick=()=>run(()=>ipcRenderer.invoke('desktop:offline',$('profiles').value));
$('shareProfile').onclick=()=>run(()=>ipcRenderer.invoke('desktop:share-profile',$('profiles').value));
$('connect').onclick=()=>run(async()=>{localStorage.setItem('odyssey.server',JSON.stringify({host:$('host').value,port:$('port').value}));await ipcRenderer.invoke('desktop:connect',{host:$('host').value,port:$('port').value});});
$('startHost').onclick=()=>run(async()=>{const d=await ipcRenderer.invoke('desktop:host');$('status').textContent='Server running on port '+d.port+'. Players connect using your PC’s LAN or public address. External access requires network forwarding or a tunnel. Keep this window open.';});
$('stopHost').onclick=()=>run(async()=>{await ipcRenderer.invoke('desktop:stop');$('status').textContent='Server saved and stopped.';});
$('studio').onclick=()=>run(async()=>{await ipcRenderer.invoke('desktop:studio','community');$('status').textContent='Studio opened for your community world. Published changes take effect after a server restart.';});
try{const s=JSON.parse(localStorage.getItem('odyssey.server'));if(s){$('host').value=s.host;$('port').value=s.port;}}catch{}
info().catch(e=>$('status').textContent=e.message);
