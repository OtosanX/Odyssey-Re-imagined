'use strict';
const {app,BrowserWindow}=require('electron'),fs=require('fs'),path=require('path'),os=require('os'),assert=require('assert/strict');
process.env.ODYSSEY_PROFILE_ROOT=fs.mkdtempSync(path.join(os.tmpdir(),'ody-desktop-ui-'));process.env.ODYSSEY_HEADLESS_TEST='1';app.commandLine.appendSwitch('use-angle','swiftshader');app.commandLine.appendSwitch('enable-unsafe-swiftshader');
require(path.join(process.env.ODYSSEY_TEST_CLIENT_ROOT||__dirname,'src/main'));
setTimeout(()=>{console.error('Desktop UI test exceeded 90 seconds.');app.exit(1);},90000).unref();
const delay=ms=>new Promise(r=>setTimeout(r,ms));
app.whenReady().then(async()=>{const win=BrowserWindow.getAllWindows()[0];let failed=false;const errors=[];win.webContents.on('console-message',(_e,level,message)=>{if(level===3)errors.push(message);});
 const js=code=>win.webContents.executeJavaScript(code);
 async function until(code){for(let i=0;i<400;i++){try{if(await js(code))return;}catch{}await delay(50);}throw Error('Timed out: '+code);}
 try{await until("!!document.querySelector('#add')");assert.equal(win.isVisible(),false);await js("document.getElementById('profileName').value='UITester';document.getElementById('add').click()");await until("document.querySelector('#profiles')?.options.length===1");
 fs.mkdirSync(path.join(__dirname,'../distribution-audit'),{recursive:true});fs.writeFileSync(path.join(__dirname,'../distribution-audit/desktop-launcher.png'),(await win.webContents.capturePage()).toPNG());
 await js("document.getElementById('offline').click()");await until("!!document.querySelector('[data-mode=story]')");assert.ok((await js('document.body.textContent')).includes('UITester'));assert.equal((await js('document.body.textContent')).includes('password'),false);
 await js("[...document.querySelectorAll('button')].find(b=>b.textContent==='Sign Out').click()");await until("!!document.querySelector('#offline')");await until("!document.querySelector('#offline').disabled");await js("document.getElementById('offline').click()");await until("!!document.querySelector('[data-mode=story]')");
 await js("void require('electron').ipcRenderer.invoke('desktop:home')");await until("!!document.querySelector('#offline')");
 assert.deepEqual(errors,[]);console.log('PASS: real desktop launcher, invisible window, create profile, automatic offline sign-in, sign-out shutdown, reopen profile.');
 }catch(e){failed=true;console.error(e,errors);}finally{try{await js("require('electron').ipcRenderer.invoke('desktop:stop')");}catch{}app.exit(failed?1:0);}
});
