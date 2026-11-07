'use strict';
const fs=require('fs'),path=require('path');
const {copy,walk}=require('./build-portable.cjs'),{SEED_FILES}=require('./desktop-runtime.cjs');
const root=path.resolve(__dirname,'..'),dest=path.join(root,'publish','odyssey-reimagined');
fs.mkdirSync(dest,{recursive:true});
for(const name of ['map-format.cjs','visual-format.cjs','THIRD-PARTY-NOTICES.md','DOWNLOAD-AND-HOST.md','community-server.json','EDITOR-RENDERER-OVERHAUL.md'])copy(path.join(root,name),path.join(dest,name));
copy(path.join(root,'DOWNLOAD-AND-HOST.md'),path.join(dest,'README.md'));
for(const name of fs.readdirSync(path.join(root,'tools')).filter(n=>/\.(cjs|ps1|cs)$/.test(n)))copy(path.join(root,'tools',name),path.join(dest,'tools',name));
for(const project of ['odyssey-2-client-develop','odyssey-2-server-develop']){
 for(const name of ['src','lib','bin','definitions','scripts','tests','package.json','package-lock.json','tsconfig.json','LICENSE'])if(fs.existsSync(path.join(root,project,name)))copy(path.join(root,project,name),path.join(dest,project,name));
 for(const name of fs.readdirSync(path.join(root,project)).filter(n=>/^test-.*\.cjs$/.test(n)))copy(path.join(root,project,name),path.join(dest,project,name));
}
for(const name of SEED_FILES)copy(path.join(root,'odyssey-2-server-develop/data',name),path.join(dest,'odyssey-2-server-develop/data',name));
fs.writeFileSync(path.join(dest,'.gitignore'),`**/node_modules/\ndist/\npublish/\ncommunity-world/\n.map-library*/\n**/accounts.data*\n**/offline-profiles.json*\n**/progress-*.json*\n**/sessions/\n**/.server.lock\n**/runtime-config.json\n**/*.log\n**/.env*\n**/*.exe\n**/*.zip\n**/*test-result.json\nscenery-audit/\ndistribution-audit/\n**/.editor-test-profile/\n`);
copy(path.join(root,'release-workflow.yml'),path.join(dest,'.github/workflows/release.yml'));
const files=walk(dest).filter(f=>!f.includes(path.sep+'.git'+path.sep));
for(const file of files){const relative=path.relative(dest,file).replace(/\\/g,'/');if(/accounts\.data|offline-profiles\.json|progress-[^/]*\.json|\/sessions\/|\.env$/.test(relative))throw Error('Private file in source staging: '+relative);if(/\.(js|cjs|ts|md|json|yml)$/.test(file)&&fs.statSync(file).size<2000000){const text=fs.readFileSync(file,'utf8');if(/gh[pousr]_[a-zA-Z0-9]{30,}|github_pat_[a-zA-Z0-9_]{30,}|-----BEGIN (RSA |OPENSSH )?PRIVATE KEY-----/.test(text))throw Error('Potential credential in '+relative);}}
console.log('Source prepared:',dest,'('+files.length+' allowlisted files, no user databases or saves).');
