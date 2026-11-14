'use strict';
const m=require('mithril');
class Auth{
 constructor(net){this.net=net;this.username='';this.password='';this.status='';this.onSuccess=async()=>{};}
 setUsername(value){this.username=value;}
 setPassword(value){this.password=value;}
 canSubmit(){return /^[a-zA-Z0-9_]{3,24}$/.test(this.username)&&this.password.length>=6&&this.status!=='pending';}
 buildCredentials(){return Buffer.from(this.username+'\0'+this.password,'utf8');}
 login(){return this.request(1);}
 createAccount(){return this.request(0);}
 request(id){if(this.status==='pending')return;if(id===0&&!/^[a-zA-Z0-9_]{6,24}$/.test(this.password)){this.status='Use 6–24 letters, numbers or underscores for a new password.';m.redraw();return;}const credentials={username:this.username,password:this.password};this.status='pending';m.redraw();return new Promise(resolve=>{const finish=async code=>{clearTimeout(timer);this.net.removeListener('message',handler);if(code===0){try{await this.onSuccess(id,credentials);}catch(e){this.net.profileWarning='Account is valid, but could not save it on this device: '+e.message;}if(id===1){this.net.username=credentials.username;this.net.launcherReset=true;this.password='';this.status='';m.route.set('/lobby');}else this.status='Account created and saved. Choose it to sign in.';}else this.status=code===3?'That username is already taken.':code===2?'That account is already signed in.':code===4?'Check the username and password requirements.':code===1?'Username or password is incorrect.':'The server did not respond. Try again.';m.redraw();resolve(code===0);};const handler=msg=>{if(msg.system===1&&msg.id===id&&msg.data.length)finish(msg.data.readUInt8(0));};const timer=setTimeout(()=>finish(255),10000);this.net.on('message',handler);this.net.send(1,id,Buffer.from(credentials.username+'\0'+credentials.password,'utf8'));});}
}
module.exports=Auth;
