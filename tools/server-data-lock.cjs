'use strict';
const fs=require('fs'),path=require('path');
function lockData(folder){
 const file=path.join(folder,'.server.lock');fs.mkdirSync(folder,{recursive:true});
 for(let retry=0;retry<2;retry++){
  try{const fd=fs.openSync(file,'wx');fs.writeFileSync(fd,String(process.pid));fs.closeSync(fd);return()=>{try{if(fs.readFileSync(file,'utf8')===String(process.pid))fs.unlinkSync(file);}catch{}};}
  catch(e){if(e.code!=='EEXIST')throw e;const pid=Number(fs.readFileSync(file,'utf8'));let alive=true;try{process.kill(pid,0);}catch(e){if(e.code==='ESRCH')alive=false;}if(!Number.isSafeInteger(pid)||pid<1||alive)throw Error('This save folder is already in use by another server. Close that server first.');fs.unlinkSync(file);}
 }
 throw Error('Could not reserve this save folder.');
}
module.exports={lockData};
