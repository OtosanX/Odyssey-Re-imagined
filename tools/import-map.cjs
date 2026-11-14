const fs=require('fs'),path=require('path');
const {validateMap}=require('../map-format.cjs');
function installMap(map,directory){
 validateMap(map);fs.mkdirSync(directory,{recursive:true});
 const stamp=new Date().toISOString().replace(/[:.]/g,'-');
 if(Number.isInteger(map.classicId)){
   const target=path.join(directory,'classic-world.json'),world=JSON.parse(fs.readFileSync(target,'utf8'));
   if(!world.maps[map.classicId])throw Error('Original map ID does not exist.');
   if(map.width!==12||map.height!==12)throw Error('Original maps must remain 12 × 12 to preserve exits.');
   fs.copyFileSync(target,path.join(directory,'classic-world.backup-'+stamp+'.json'));
   world.maps[map.classicId]={...world.maps[map.classicId],...map,id:map.classicId};
   fs.writeFileSync(target+'.tmp',JSON.stringify(world));fs.renameSync(target+'.tmp',target);
   fs.writeFileSync(path.join(directory,'world-mode.json'),JSON.stringify({mode:'classic'}));return target;
 }
 const target=path.join(directory,'world.json');
 if(fs.existsSync(target))fs.copyFileSync(target,path.join(directory,'world.backup-'+stamp+'.json'));
 fs.writeFileSync(target+'.tmp',JSON.stringify(map,null,2));fs.renameSync(target+'.tmp',target);fs.writeFileSync(path.join(directory,'world-mode.json'),JSON.stringify({mode:'custom'}));return target;
}
module.exports={installMap};
if(require.main===module){try{const input=process.argv[2];if(!input)throw Error('Usage: node tools/import-map.cjs map.json');console.log('Imported:',installMap(JSON.parse(fs.readFileSync(input,'utf8')),path.join(__dirname,'../server/data')));console.log('Restart the modern server to load the map.');}catch(e){console.error(e.message);process.exitCode=1;}}

