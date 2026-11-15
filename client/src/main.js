'use-strict';

const { app, BrowserWindow, ipcMain, safeStorage, dialog } = require('electron');
const path = require('path');
const url = require('url');
const Network = require('./bin/network').Network;
const GameState = require('./bin/game-state');

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let win;
const fs=require('fs');
const {reserveClient,Vault}=require('../../tools/desktop-accounts.cjs');
const profileRoot=process.env.ODYSSEY_PROFILE_ROOT||path.join(app.getPath('appData'),'OdysseyReimagined');
const installRoot=path.resolve(__dirname,'../..');
const {DesktopRuntime,endpoint,vaultKey,seedWorld}=require('../../tools/desktop-runtime.cjs');
const runtime=new DesktopRuntime(installRoot,profileRoot,fs.existsSync(path.join(installRoot,'runtime/node.exe'))?path.join(installRoot,'runtime/node.exe'):process.execPath);
const identity=new (require('../../tools/launcher-accounts.cjs').LauncherAccounts)(profileRoot);
const directory=new (require('../../tools/server-browser.cjs').ServerBrowser)(installRoot,profileRoot);
let selectedServer=null,quitting=false,chosenMode=null;
const launcherPasswords=new Vault(path.join(profileRoot,'launcher-passwords'),safeStorage);
ipcMain.handle('launcher:accounts',()=>identity.list());
ipcMain.handle('launcher:password',(_e,name)=>{const account=identity.list().find(a=>a.username.toLowerCase()===String(name).toLowerCase());return {...(account?launcherPasswords.load(account.username):{password:''}),canRemember:safeStorage.isEncryptionAvailable()};});
ipcMain.handle('launcher:login',async(_e,data)=>{if(data.remember&&!safeStorage.isEncryptionAvailable())throw Error('Windows-protected password storage is unavailable. Sign in without remembering the password.');const account=await identity.login(data.username,data.password,data.create);await launcherPasswords.save(account.username,data.password,data.remember===true);return account;});
ipcMain.handle('launcher:logout',async()=>{await runtime.stop();identity.current=null;chosenMode=null;});
ipcMain.handle('launcher:mode',(_e,mode)=>{identity.require();if(mode!==null&&!['story','mmo'].includes(mode))throw Error('Choose Story or MMO.');chosenMode=mode;});
ipcMain.handle('servers:list',()=>{identity.require();return directory.list();});
ipcMain.handle('servers:add',(_e,server)=>{identity.require();return directory.add(server);});
ipcMain.handle('servers:remove',(_e,server)=>{identity.require();directory.remove(server);});
ipcMain.handle('servers:configure',(_e,input)=>{identity.require();if(chosenMode!=='mmo')throw Error('Choose MMO to host a server.');runtime.saveHost(input);});
let lease;
if(!process.argv.includes('--editor')&&!process.argv.includes('--host')){lease=reserveClient(path.join(profileRoot,'locks'));if(lease){const clientData=path.join(profileRoot,'clients',String(lease.slot));fs.mkdirSync(clientData,{recursive:true});app.setPath('userData',clientData);}app.on('will-quit',()=>{if(lease)lease.release();});}
function vault(){if(!selectedServer)throw Error('Choose a server first.');return new Vault(selectedServer.host==='127.0.0.1'&&selectedServer.port===5751?profileRoot:path.join(profileRoot,'servers',vaultKey(selectedServer)),safeStorage);}
ipcMain.handle('accounts:list',()=>vault().list());
ipcMain.handle('accounts:load',(_e,name)=>vault().load(name));
ipcMain.handle('accounts:save',(_e,data)=>vault().save(data.username,data.password,data.remember));
ipcMain.handle('accounts:remove',(_e,name)=>vault().remove(name));
ipcMain.handle('desktop:info',()=>({profiles:runtime.list().map(({id,name})=>({id,name})),hosting:!!runtime.child,profileRoot,identity:identity.current,mode:chosenMode,hostConfig:((c)=>({name:c.name,port:c.port,workspace:path.basename(c.workspace),locked:!!c.joinLock}))(runtime.hostConfig()),hostOnly:process.argv.includes('--host')}));
ipcMain.handle('story:list',()=>{identity.require();return require('../../tools/story-launcher.cjs').storyCards(runtime);});
ipcMain.handle('story:open',async(_e,choice)=>{const account=identity.require();if(!lease||chosenMode!=='story')throw Error('Choose Story to play.');let profileId=choice.profileId,save;
 if(choice.newStory){const profile=runtime.list().find(p=>p.name.toLowerCase()===account.username.toLowerCase());profileId=profile?.id||runtime.add(account.username);}
 else{save=(await require('../../tools/story-launcher.cjs').storyCards(runtime)).find(s=>s.profileId===profileId&&(choice.saveId?s.saveId===choice.saveId:s.legacy));if(!save)throw Error('Story save not found. Refresh your saves.');if(choice.host&&!save.mine)throw Error('Only the save owner can host this Story.');}
 selectedServer={...await runtime.offline(profileId,choice.host===true,save?.saveId),mode:'story',storySaveId:save?.saveId,storyStarted:save?.started,createStory:choice.newStory===true,rotateStoryCode:choice.host===true&&!!save?.saveId};await win.loadFile(path.join(__dirname,'index.html'));
});
ipcMain.handle('desktop:add',(_e,name)=>{identity.require();return runtime.add(name);});
ipcMain.handle('desktop:offline',async(_e,id)=>{if(!lease)throw Error('Open Odyssey.exe to play. This window hosts the server.');identity.require();if(chosenMode!=='story')throw Error('Offline play belongs to Story.');selectedServer={...await runtime.offline(id),mode:'story'};await win.loadFile(path.join(__dirname,'index.html'));});
ipcMain.handle('desktop:share-profile',async(_e,id)=>{if(!lease)throw Error('Open Odyssey.exe to play.');identity.require();if(chosenMode!=='story')throw Error('Choose Story first.');selectedServer={...await runtime.offline(id,true),mode:'story'};await win.loadFile(path.join(__dirname,'index.html'));});
ipcMain.handle('desktop:connect',async(_e,server)=>{if(server.invitation)server=require('../../tools/story-invitation.cjs').decode(server.invitation);if(!lease)throw Error('Open Odyssey.exe to play. This window hosts the server.');identity.require();if(!chosenMode)throw Error('Choose Story or MMO first.');if(chosenMode==='story'&&!/^[A-Z2-9]{8}$/.test(server.storyCode||''))throw Error('Enter the host’s eight-character Story code.');selectedServer={...endpoint(server.host,server.port),mode:chosenMode,storyCode:chosenMode==='story'?server.storyCode:undefined};await win.loadFile(path.join(__dirname,'index.html'));});
ipcMain.handle('desktop:session',()=>selectedServer||endpoint(process.env.ODYSSEY_HOST||'127.0.0.1',process.env.ODYSSEY_PORT||5751));
ipcMain.handle('desktop:host',()=>{identity.require();if(chosenMode!=='mmo')throw Error('Choose MMO first.');return runtime.host();});
ipcMain.handle('desktop:stop',()=>runtime.stop());
ipcMain.handle('desktop:home',async()=>{if(runtime.session?.offline)await runtime.stop();selectedServer=null;await win.loadFile(path.join(__dirname,'desktop.html'));});
ipcMain.handle('desktop:studio',(_e,target)=>{
 const workspace=target==='community'?runtime.hostConfig().workspace:target==='offline'?runtime.session?.workspace:null;
 if(!workspace)throw Error('Select a world to edit.');seedWorld(installRoot,workspace);
 const child=require('child_process').spawn(process.execPath,[path.join(installRoot,'client'),'--editor'],{windowsHide:true,detached:false,stdio:'ignore',env:{...process.env,ODYSSEY_STUDIO_ROOT:workspace}});child.on('error',e=>dialog.showErrorBox('Studio',e.message));
});
app.on('before-quit',e=>{if(runtime.child&&!quitting){e.preventDefault();quitting=true;runtime.stop().finally(()=>app.quit());}});

function createWindow() {
  if(!process.argv.includes('--editor')&&!process.argv.includes('--host')&&!lease){dialog.showErrorBox('Four clients maximum','Close one Odyssey game client before opening another.');app.quit();return;}
  // Create the browser window.
  // NOTE: nodeIntegration:true + contextIsolation:false is normally a
  // security risk (it lets any loaded web content run Node APIs) —
  // but this window only ever loads our own local index.html/app.js,
  // never remote or user-supplied content, so it's safe here. Modern
  // Electron defaults to the opposite (safer for apps that load
  // remote content), which would otherwise break every existing
  // require() call in app.js/login.js/auth.js.
  win = new BrowserWindow({
    show: !process.env.ODYSSEY_HEADLESS_TEST,
    width: 1280,
    height: 850,
    title: "Odyssey",
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false
    }
  })
  win.odyssey = {
    GameState: GameState,
    Network: Network,
  }
  win.webContents.on('render-process-gone',()=>{if(runtime.child)runtime.stop().catch(()=>{});});
  win.setMenu(null);
  win.webContents.setWindowOpenHandler(()=>({action:'deny'}));
  win.webContents.on('will-navigate',(event,destination)=>{if(!destination.startsWith('file:'))event.preventDefault();});

  // and load the index.html of the app.
  win.loadURL(url.format({
    pathname: path.join(__dirname, process.argv.includes('--editor') ? 'editor.html' : 'desktop.html'),
    protocol: 'file:',
    slashes: true
  }))

  // Open the DevTools.


  // Emitted when the window is closed.
  win.on('closed', () => {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    win = null;runtime.stop().catch(()=>{});
  })
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.on('ready', createWindow)

// Quit when all windows are closed.
app.on('window-all-closed', () => {
  // On macOS it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', () => {
  // On macOS it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (win === null) {
    createWindow()
  }
})

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.

