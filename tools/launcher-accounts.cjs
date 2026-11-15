'use strict';
const fs=require('fs'),path=require('path'),crypto=require('crypto');
class LauncherAccounts{
 constructor(home){this.file=path.join(home,'launcher-accounts.json');this.current=null;this.nextTry=0;}
 rows(){return fs.existsSync(this.file)?JSON.parse(fs.readFileSync(this.file)):[];}
 list(){return this.rows().map(({username})=>({username}));}
 async login(username,password,create=false){if(Date.now()<this.nextTry)throw Error('Please wait a moment before trying again.');this.nextTry=Date.now()+750;username=String(username||'').trim();password=String(password||'');if(!/^[a-zA-Z0-9_]{3,24}$/.test(username)||password.length<6||password.length>72)throw Error('Username: 3–24 letters, numbers or underscores. Password: 6–72 characters.');const rows=this.rows();let row=rows.find(r=>r.username.toLowerCase()===username.toLowerCase());if(create&&row)throw Error('That Odyssey username is already saved on this PC.');if(!create&&!row)throw Error('Account not found on this PC. Add an Odyssey account first.');const salt=row?.salt||crypto.randomBytes(16).toString('hex');const key=await new Promise((resolve,reject)=>crypto.scrypt(password,salt,32,(e,k)=>e?reject(e):resolve(k)));if(create){row={username,salt,hash:key.toString('hex'),id:crypto.randomUUID()};rows.push(row);const vault=new (require('./desktop-accounts.cjs').Vault)(path.dirname(this.file),null);vault.file=this.file;await vault.mutate(current=>{if(current.some(r=>r.username.toLowerCase()===username.toLowerCase()))throw Error('That Odyssey username is already saved on this PC.');current.push(row);});}else if(!crypto.timingSafeEqual(key,Buffer.from(row.hash,'hex')))throw Error('Incorrect password.');this.current={username:row.username,id:row.id};return this.current;}
 require(){if(!this.current)throw Error('Sign in to Odyssey first.');return this.current;}
}
module.exports={LauncherAccounts};
