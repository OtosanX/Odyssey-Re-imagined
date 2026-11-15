'use strict';
function allow(game,msg,client){const policy=game.config.server.storyHost;if(!policy||msg.system!==4||![0,15].includes(msg.id)||!client.account)return true;let options;try{options=JSON.parse(msg.data.toString()||'{}');}catch{return true;}if(!options||typeof options!=='object')return true;let error='';const selected=policy.saveId&&game.world.saves[policy.saveId];
 if(msg.id===0){if(options.mode!=='story')error='This host is sharing a Story save, not an MMO.';else if(policy.saveId&&(!selected||options.saveId!==policy.saveId&&options.code!==selected.joinCode))error='Only the shared Story save is available.';else if(!policy.saveId&&client.account.username!==policy.owner)error='The host has not selected a Story save yet.';}
 if(msg.id===15&&options.action==='inspectInvite'&&policy.saveId&&options.code!==selected?.joinCode)error='Invitation not found on this host.';
 if(error){client.send(4,msg.id===15?8:5,Buffer.from(JSON.stringify({error})));return false;}return true;
}
module.exports={allow};
