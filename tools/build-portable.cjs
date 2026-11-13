'use strict';
// Allowlisted release staging: never recursively copy a working server or user profile.
const fs=require('fs'),path=require('path'),crypto=require('crypto'),{execFileSync}=require('child_process');
const {SEED_FILES}=require('./desktop-runtime.cjs');
const root=path.resolve(__dirname,'..');
function copy(from,to){if(!fs.existsSync(from))throw Error('Missing release input: '+from);fs.mkdirSync(path.dirname(to),{recursive:true});fs.cpSync(from,to,{recursive:true,filter:p=>!/(^|[\\/])(\.git|node_modules|test-[^\\/]+)([\\/]|$)/.test(path.relative(from,p))});}
function productionModules(project,dest){const lock=JSON.parse(fs.readFileSync(path.join(project,'package-lock.json')));for(const [name,entry]of Object.entries(lock.packages)){if(name.startsWith('node_modules/')&&!entry.dev){const from=path.join(project,name);if(fs.existsSync(from))copy(from,path.join(dest,name));}}}
function walk(folder){return fs.readdirSync(folder,{withFileTypes:true}).flatMap(e=>e.isDirectory()?walk(path.join(folder,e.name)):[path.join(folder,e.name)]);}
async function build(){
 if(process.platform!=='win32')throw Error('The portable build currently targets Windows x64.');
 const output=path.join(root,'dist','Odyssey-Reimagined-Windows-'+new Date().toISOString().replace(/[:.]/g,'-'));fs.mkdirSync(output,{recursive:false});
 for(const name of ['map-format.cjs','visual-format.cjs','THIRD-PARTY-NOTICES.md','community-server.json'])copy(path.join(root,name),path.join(output,name));
 copy(path.join(root,'docs','DOWNLOAD-AND-HOST.md'),path.join(output,'README.md'));
 for(const name of fs.readdirSync(path.join(root,'tools')).filter(n=>n.endsWith('.cjs')&&!n.startsWith('test-')))copy(path.join(root,'tools',name),path.join(output,'tools',name));
 const client='odyssey-2-client-develop',server='odyssey-2-server-develop';
 for(const name of ['src','package.json'])copy(path.join(root,client,name),path.join(output,client,name));
 copy(path.join(root,client,'node_modules/mithril'),path.join(output,client,'node_modules/mithril'));
 copy(path.join(root,client,'node_modules/electron/dist'),path.join(output,client,'node_modules/electron/dist'));
 for(const name of ['bin','scripts','LICENSE','package.json'])copy(path.join(root,server,name),path.join(output,server,name));
 productionModules(path.join(root,server),path.join(output,server));
 for(const name of SEED_FILES)copy(path.join(root,server,'data',name),path.join(output,server,'data',name));
 copy(process.execPath,path.join(output,'runtime/node.exe'));
 const license=await fetch('https://raw.githubusercontent.com/nodejs/node/'+process.version+'/LICENSE');if(!license.ok)throw Error('Cannot fetch the matching Node runtime license.');fs.writeFileSync(path.join(output,'runtime/LICENSE.node'),await license.text());
 execFileSync('powershell.exe',['-NoProfile','-ExecutionPolicy','Bypass','-File',path.join(root,'tools/build-launchers.ps1'),'-OutputDirectory',output],{stdio:'inherit',windowsHide:true});
 const files=walk(output);for(const file of files){const relative=path.relative(output,file).replace(/\\/g,'/');if(/(^|\/)(accounts\.data|offline-profiles\.json|progress-[^/]*|rooms\.json|story-saves\.json|\.env|\.server.lock)$/.test(relative)||relative.includes('/sessions/'))throw Error('Private data in release: '+relative);}
 fs.writeFileSync(path.join(output,'release-manifest.json'),JSON.stringify({format:1,platform:'win32-x64',node:process.version,files:files.map(file=>({path:path.relative(output,file).replace(/\\/g,'/'),sha256:crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex')}))},null,2));
 const archive=output+'.zip';execFileSync('powershell.exe',['-NoProfile','-File',path.join(root,'tools/zip-release.ps1'),'-SourceDirectory',output,'-ArchivePath',archive],{stdio:'inherit',windowsHide:true});
 const sha=crypto.createHash('sha256').update(fs.readFileSync(archive)).digest('hex');fs.writeFileSync(archive+'.sha256',sha+'  '+path.basename(archive)+'\n');
 fs.writeFileSync(path.join(root,'dist/latest.json'),JSON.stringify({directory:output,archive,sha256:sha},null,2));console.log(JSON.stringify({directory:output,archive,files:files.length,bytes:fs.statSync(archive).size,sha256:sha},null,2));return output;
}
if(require.main===module){fs.mkdirSync(path.join(root,'dist'),{recursive:true});build().catch(e=>{console.error(e);process.exitCode=1;});}
module.exports={build,copy,walk};
