'use strict';
const crypto=require('crypto');
function passwordRecord(password){if(!password)return null;if(typeof password!=='string'||password.length<6||password.length>72)throw Error('Server password must be 6–72 characters.');const salt=crypto.randomBytes(16).toString('hex');return {salt,hash:crypto.pbkdf2Sync(password,salt,100000,32,'sha256').toString('hex')};}
// Runs before account and gameplay handlers for both TCP and browser connections.
function gate(game,msg,c){const cfg=game.config.server,lock=cfg.joinLock;if(msg.system===1&&msg.id===4){if(!c.directoryAt||Date.now()-c.directoryAt>1000){c.directoryAt=Date.now();c.directoryCount=0;}if(++c.directoryCount>20)return true;c.joinNonce=crypto.randomBytes(24).toString('hex');c.joinExpires=Date.now()+30000;const clients=game.clients.clients.filter(Boolean);c.send(1,4,Buffer.from(JSON.stringify({name:String(cfg.name||'Odyssey server').slice(0,80),players:clients.filter(p=>p.playing&&p.account).length,maxPlayers:game.options.max.players,locked:!!lock,salt:lock?.salt,nonce:c.joinNonce})));return true;}
 if(msg.system===1&&msg.id===5){let ok=!lock;if(lock&&c.joinNonce&&Date.now()<c.joinExpires&&msg.data.length===64){const expected=crypto.createHmac('sha256',Buffer.from(lock.hash,'hex')).update(c.joinNonce).digest('hex');ok=crypto.timingSafeEqual(Buffer.from(expected),msg.data);}delete c.joinNonce;if(ok)c.serverAdmitted=true;c.send(1,5,Buffer.from([ok?0:1]));return true;}
 if(lock&&!c.serverAdmitted){if(msg.system===1&&[0,1].includes(msg.id))c.send(1,msg.id,Buffer.from([255]));return true;}return false;
}
module.exports={gate,passwordRecord};
