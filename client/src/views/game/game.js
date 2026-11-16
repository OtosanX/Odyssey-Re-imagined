const Camera=require('../../models/camera-settings');
const {MapChunks}=require('../../models/map-chunks');
const m = require('mithril');
const {Controls}=require('../../models/controls');
const Panels=require('./panels');
const {MovementIntent}=require('../../models/movement-intent');
const InventoryGrid=require('./inventory-grid');
const Chat=require('./chat');
const InviteCode=require('./invite-code');
const Appearances=require('./appearances');
const HUD=require('./hud');
const {Scene3D}=require('./scene3d');
module.exports = function(net) {
  const tilesImage = new Image(), spriteImage = new Image(), objectsImage = new Image();
  tilesImage.src = 'assets/tiles.png'; spriteImage.src = 'assets/sprites.png'; objectsImage.src = 'assets/objects.png';
  let stats = {hp:0,maxHP:42,inventory:[]}, drops = [], facing = 2, freezeUntil=0, speech=[], speechRevision=0, floating=[], respawning=false, respawnTimer;
  const controls=new Controls(action); const ui=Panels(net,controls),intent=new MovementIntent(),inventory=InventoryGrid(net);
  const chat=Chat(net,()=>{controls.clear();intent.reset();},()=>hud.show('chat'));
  const hud=HUD(()=>{controls.clear();intent.reset();},(id,show)=>{if(id==='quest'&&show&&!controls.settings.tracker){controls.settings.tracker=true;controls.save();}});
  controls.hud=hud;
  function openPanel(name){hud.show('player');ui.open(name);}
  function respawn(){if(respawning||!stats.dead)return;respawning=true;controls.clear();intent.reset();net.send(4,6,Buffer.alloc(0));respawnTimer=setTimeout(()=>{respawning=false;m.redraw();},3000);m.redraw();}
  function action(name){if(hud.editing||chat.focused)return;if(chat.focused)return;if(ui.dialogueOpen){if(name==='settings')ui.closeDialogue();return;}if(stats.dead&&name==='attack'){respawn();return;}if(ui.tab==='settings'&&name!=='settings')return;if(name==='inventory'){if(!hud.layout.player.hidden&&!hud.layout.player.collapsed&&ui.tab==='inventory')hud.collapse('player');else{hud.show('player');ui.open('inventory');}return;}if(name==='zoomIn'||name==='zoomOut'){const delta=name==='zoomIn'?4:-4;if(controls.settings.viewMode==='3d'){controls.settings.cameraZoom=Camera.zoom(controls.settings.cameraZoom+delta);controls.save();}else zoom=Math.max(16,Math.min(64,zoom+delta));}else if(name==='pickup'&&performance.now()>=freezeUntil)net.send(4,3,Buffer.alloc(0));else if(name==='attack'&&performance.now()>=freezeUntil&&ui.tab!=='settings')net.send(4,2,Buffer.from([facing]));else {if(['inventory','quests','market','settings'].includes(name))hud.show('player');ui.action(name);}}

  function tile(image, id, x, y, size) {
    if (!id || !image.complete || !image.naturalWidth) return;
    const n = id - 1; ctx.drawImage(image,(n%32)*32,Math.floor(n/32)*32,32,32,x,y,size,size);
  }
  let mapChunks=new MapChunks(),requestedRadius=null;
  let world, viewRevision=0, players = [], sprites = new Map(), keys = new Set(), frame, canvas, ctx, last = 0;
  let zoom = 32, camera = {x:24,y:35},renderer3D=null;
  controls.refreshView=()=>{const radius=controls.settings.viewMode==='3d'&&controls.settings.viewDistance===2?2:1;if(world&&requestedRadius!==radius){requestedRadius=radius;net.send(4,18,Buffer.from([radius]));}};
  function toggleView(){controls.clear();intent.reset();controls.settings.viewMode=controls.settings.viewMode==='3d'?'classic':'3d';controls.save();}
  const message = msg => {
    if (msg.system !== 4) return;
    const data = JSON.parse(msg.data.toString());
    if(msg.id===18){const assembled=mapChunks.add(data);if(assembled)message({system:4,id:0,data:assembled});return;}
    if(msg.id===16){chat.add(data);return;}
    if(msg.id===17){if(world?.scene3dPending?.revision!==data.revision)return;world.sceneParts||=[];world.sceneParts[data.index]=data.segment;if(world.sceneParts.filter(Boolean).length===world.scene3dPending.count){world={...world,scene3d:{version:1,segments:world.sceneParts}};delete world.scene3dPending;delete world.sceneParts;}return;}
    if (msg.id === 0) {
      if(data.teleport){ui.closeDialogue();floating=[];speech=[];intent.reset();controls.clear();sprites.clear();camera.x=data.centerX;camera.y=data.centerY;}
      else if(data.shiftX||data.shiftY){for(const f of floating){f.x+=data.shiftX;f.y+=data.shiftY;}for(const p of sprites.values()){p.x+=data.shiftX;p.rx+=data.shiftX;p.fx+=data.shiftX;p.y+=data.shiftY;p.ry+=data.shiftY;p.fy+=data.shiftY;}camera.x+=data.shiftX;camera.y+=data.shiftY;}
      world = {...data,viewRevision:++viewRevision};controls.refreshView();
    }
    if (msg.id === 2) { stats=data;ui.onState(data);chat.onState(data);if(data.ambientDialogue&&data.ambientDialogue.actor&&data.ambientDialogue.revision!==speechRevision){speechRevision=data.ambientDialogue.revision;speech.push({actor:data.ambientDialogue.actor.id,text:data.ambientDialogue.messages.filter(line=>!/^\d+[.)]/.test(line)).at(-1)?.slice(0,110)||'',started:performance.now()});speech=speech.slice(-8);}if(!stats.dead){respawning=false;clearTimeout(respawnTimer);}if(data.roomCode)localStorage.setItem('odyssey-last-story',data.roomCode);freezeUntil=performance.now()+(data.freezeMs||0); }
    if (msg.id === 5) {net.worldError=data.error;m.route.set('/lobby');return;}
    if (msg.id === 6) ui.onMarket(data);
    if (msg.id === 3) {if(Array.isArray(data))drops=data;else {if(data.reset)drops=[];drops.push(...data.items);}}
    if (msg.id === 1) {
      players = data;
      for (const p of players) {
        const old = sprites.get(p.id);
        if(old&&Number.isFinite(old.hp)&&Number.isFinite(p.hp)&&old.hp!==p.hp){const delta=p.hp-old.hp;floating.push({x:p.x+.5,y:p.y-.6,text:(delta>0?'+':'')+delta,color:delta>0?'#92ee8c':p.monster?'#ffdc77':'#ff817b',started:performance.now()});if(floating.length>80)floating.shift();}
        const dir = [0,3,1,2][p.direction] ?? (old ? old.dir : 1);
        if(old&&p.x===old.x&&p.y===old.y){Object.assign(old,p,{dir});continue;}
        sprites.set(p.id, {...p, dir, fx:old ? old.rx : p.x, fy:old ? old.ry : p.y, rx:old ? old.rx : p.x, ry:old ? old.ry : p.y, time:performance.now()});
      }
      for (const id of sprites.keys()) if (!players.some(p=>p.id===id)) sprites.delete(id);
    }
    m.redraw();
  };
  const status=text=>chat.add({id:'connection:'+Date.now()+':'+Math.random(),time:Date.now(),channel:'system',text:String(text)});
  const down=e=>{if(hud.handleKey(e))return;if(chat.handleKey(e,stats.dead||ui.dialogueOpen||ui.tab==='settings'))return;if(['INPUT','TEXTAREA','SELECT'].includes(e.target?.tagName)&&e.code!=='Escape')return;if(ui.dialogueOpen&&e.code==='Escape'){e.preventDefault();ui.closeDialogue();}else if(ui.dialogueOpen&&/^Digit[1-9]$/.test(e.code)&&!['INPUT','TEXTAREA'].includes(e.target?.tagName)){e.preventDefault();ui.reply(e.code.slice(-1));}else if(stats.dead&&e.code==='Enter'){e.preventDefault();respawn();}else controls.down(e);},up=e=>controls.up(e),blur=()=>{controls.clear();intent.reset();};
  function draw(now) {
    const w=canvas.clientWidth, h=canvas.clientHeight, dpr=window.devicePixelRatio||1;
    if (canvas.width!==Math.round(w*dpr)||canvas.height!==Math.round(h*dpr)) {canvas.width=Math.round(w*dpr);canvas.height=Math.round(h*dpr);}
    ctx.setTransform(dpr,0,0,dpr,0,0);ctx.fillStyle='#13212a';ctx.fillRect(0,0,w,h);
    ctx.imageSmoothingEnabled=false;
    let scene=null;if(controls.settings.viewMode!=='3d'&&renderer3D){renderer3D.dispose();renderer3D=null;}
    if (world) {
      const padDir=controls.direction(),typing=['INPUT','TEXTAREA','SELECT'].includes(document.activeElement?.tagName);
      const dir=hud.editing||stats.dead||now<freezeUntil||ui.dialogueOpen||ui.tab==='settings'||typing?-1:padDir;
      intent.delay=controls.settings.turnDelay||110;
      const movement=intent.update(dir,now);
      if(movement.turn>=0){facing=movement.turn;net.send(4,14,Buffer.from([facing]));const self=sprites.get(world.self);if(self)self.dir=[0,3,1,2][facing];}
      if(movement.ready&&now-last>=world.stepMs){net.send(4,1,Buffer.from([dir]));last=now;intent.moved();}
      for(const p of sprites.values()){const t=Math.min(1,(now-p.time)/world.stepMs);p.rx=p.fx+(p.x-p.fx)*t;p.ry=p.fy+(p.y-p.fy)*t;}
      const self=sprites.get(world.self);if(self){camera.x=self.rx;camera.y=self.ry;}
      if(controls.settings.viewMode==='3d'){try{renderer3D||=new Scene3D();scene=renderer3D.render(world,[...sprites.values()],drops,{tiles:tilesImage,sprites:spriteImage,objects:objectsImage},camera,w,h,Camera.zoom(controls.settings.cameraZoom),now,{...controls.settings,progressive:true});if(scene)ctx.drawImage(scene.canvas,0,0,w,h);}catch(error){renderer3D?.dispose();renderer3D=null;controls.settings.viewMode='classic';controls.save();chat.add({id:'graphics:'+Date.now(),time:Date.now(),channel:'system',text:'3D graphics could not start on this device. Classic view is still available.'});}}
      if(!scene){
      const left=camera.x-w/zoom/2, top=camera.y-h/zoom/2;
      for(let y=Math.max(0,Math.floor(top));y<Math.min(world.height,top+h/zoom+1);y++)for(let x=Math.max(0,Math.floor(left));x<Math.min(world.width,left+w/zoom+1);x++){
        const tile=world.tiles[y*world.width+x],px=Math.round((x-left)*zoom),py=Math.round((y-top)*zoom);
        if(world.layers){
          const background=Math.floor(now/400)%2&&world.layers[3][y*world.width+x]?3:2;
          for(const layer of [0,1,background]) {
            const id=world.layers[layer][y*world.width+x];
            if(id && tilesImage.complete && tilesImage.naturalWidth)ctx.drawImage(tilesImage,((id-1)%32)*32,Math.floor((id-1)/32)*32,32,32,px,py,zoom,zoom);
          }
          continue;
        }
        ctx.fillStyle=tile===1?'#ac9567':tile===2?'#35667e':(x+y)%2?'#42633c':'#466840';ctx.fillRect(px,py,zoom+1,zoom+1);
        if(tile===3){ctx.fillStyle='#263f2c';ctx.beginPath();ctx.arc(px+zoom/2,py+zoom/2,zoom*.44,0,Math.PI*2);ctx.fill();}
        if(tile===0&&(x*7+y*11)%9===0){ctx.fillStyle='#779151';ctx.fillRect(px+zoom*.3,py+zoom*.7,2,4);}
      }
      for(const d of drops)tile(objectsImage,d.picture,Math.round((d.x-left)*zoom),Math.round((d.y-top)*zoom),zoom);
      for(const p of sprites.values()){
        const x=(p.rx-left+.5)*zoom,y=(p.ry-top+.5)*zoom;
        // The sprite ends at y; overlap its feet instead of detaching the shadow below them.
        ctx.fillStyle='#0005';ctx.beginPath();ctx.ellipse(x,y-zoom*.03,zoom*.28,zoom*.12,0,0,Math.PI*2);ctx.fill();
        const walking=now-p.time<world.stepMs&&(p.x!==p.fx||p.y!==p.fy);
        ctx.globalAlpha=p.hp===0?.4:1;
        tile(spriteImage,Appearances.frameId(p.sprite||1,p.dir*3+(walking?Math.floor(now/120)%2:0)),x-zoom/2,y-zoom,zoom);
        ctx.globalAlpha=1;
        ctx.fillStyle='#341c20';ctx.fillRect(x-zoom/2,y-zoom-9,zoom,4);ctx.fillStyle='#8dc56b';ctx.fillRect(x-zoom/2,y-zoom-9,zoom*Math.max(0,p.hp/p.maxHP),4);
        // Classic sprites extend one tile above their foot anchor; keep names above the health bar.
        ctx.font='12px sans-serif';ctx.textAlign='center';ctx.textBaseline='alphabetic';ctx.fillStyle='#fff';ctx.fillText(p.name,x,y-zoom-14);
      }
      if(world.layers)for(let y=Math.max(0,Math.floor(top));y<Math.min(world.height,top+h/zoom+1);y++)for(let x=Math.max(0,Math.floor(left));x<Math.min(world.width,left+w/zoom+1);x++){const layer=Math.floor(now/400)%2&&world.layers[5][y*world.width+x]?5:4;tile(tilesImage,world.layers[layer][y*world.width+x],Math.round((x-left)*zoom),Math.round((y-top)*zoom),zoom);}
      }else{for(const p of sprites.values()){const anchor=scene.anchors.get(p.id);if(!anchor)continue;const {x,y,size}=anchor;ctx.fillStyle='#341c20';ctx.fillRect(x-size/2,y-size-12,size,4);ctx.fillStyle='#8dc56b';ctx.fillRect(x-size/2,y-size-12,size*Math.max(0,p.hp/(p.maxHP||1)),4);ctx.textAlign='center';ctx.font='12px sans-serif';ctx.fillStyle='#fff';ctx.lineWidth=3;ctx.strokeStyle='#13212a';ctx.strokeText(p.name,x,y-size-16);ctx.fillText(p.name,x,y-size-16);}}
    }
    speech=speech.filter(s=>now-s.started<4500);
    for(const bubble of speech){const actor=sprites.get(bubble.actor);if(!actor)continue;const anchor=scene?.anchors.get(actor.id),x=anchor?anchor.x:(actor.rx-camera.x)*zoom+w/2,y=anchor?anchor.y-anchor.size-38:(actor.ry-camera.y)*zoom+h/2-zoom-32;ctx.save();ctx.font='12px sans-serif';const text=bubble.text.replace(/^[^:]+:\s*/,'');const width=Math.min(330,ctx.measureText(text).width+18);ctx.fillStyle='#10212ee8';ctx.fillRect(x-width/2,y-20,width,26);ctx.fillStyle='#f2e4c5';ctx.textAlign='center';ctx.fillText(text,x,y-3,Math.max(50,width-12));ctx.restore();}
    floating=floating.filter(f=>now-f.started<1100);
    for(const f of floating){const t=(now-f.started)/1100,point=scene?.project(f.x,f.y+1.1),x=point?point.x:(f.x-camera.x)*zoom+w/2,y=point?point.y-point.scale-t*42:(f.y-camera.y)*zoom+h/2-t*42;ctx.save();ctx.globalAlpha=1-t;ctx.font='bold 20px sans-serif';ctx.textAlign='center';ctx.lineWidth=3;ctx.strokeStyle='#101217';ctx.strokeText(f.text,x,y);ctx.fillStyle=f.color;ctx.fillText(f.text,x,y);ctx.restore();}
    if(world)ui.arrow(ctx,stats,world,camera,w,h,zoom,scene?.project);
    if(performance.now()<freezeUntil){ctx.fillStyle='#071119b0';ctx.fillRect(0,0,w,h);ctx.fillStyle='#f3d276';ctx.textAlign='center';ctx.font='18px sans-serif';ctx.fillText('Traveling…',w/2,h/2);}
    frame=requestAnimationFrame(draw);
  }
  return {
    oninit(){hud.init(net.username||'guest');net.on('message',message);net.on('status',status);stats={hp:0,maxHP:42,inventory:[]};drops=[];sprites.clear();world=null;mapChunks=new MapChunks();requestedRadius=null;chat.reset();ui.resetDialogue();speech=[];speechRevision=0;net.send(4,0,Buffer.from(JSON.stringify(net.worldOptions||{})));window.addEventListener('keydown',down);window.addEventListener('keyup',up);window.addEventListener('blur',blur);},
    onremove(){renderer3D?.dispose();renderer3D=null;hud.destroy();net.removeListener('message',message);net.removeListener('status',status);controls.clear();intent.reset();clearTimeout(respawnTimer);cancelAnimationFrame(frame);window.removeEventListener('keydown',down);window.removeEventListener('keyup',up);window.removeEventListener('blur',blur);},
    view:()=>m('.game.hud-shell',[hud.view({
      utility:m('header',[m('strong','ODYSSEY'),m('span',`${world?.name || 'Connecting…'} · ${stats.zone || ''}`),m('button.view-mode-toggle',{'aria-label':'Toggle 3D view',onclick:toggleView},controls.settings.viewMode==='3d'?'Classic View':'3D View'),m('button',{onclick:()=>openPanel('journal')},'Quests'),m('button',{onclick:()=>openPanel('guild')},'Guild'),m('button',{onclick:()=>openPanel('market')},'Market'),m('button',{onclick:()=>openPanel('settings')},'Settings'),m('button',{onclick:()=>{net.send(4,8,Buffer.alloc(0));m.route.set('/lobby');}},'Worlds'),m('button',{onclick:()=>{net.send(1,2,Buffer.alloc(0));m.route.set('/login');}},'Sign out'),m('.game-status',[m('span',((stats.mode||'')+' '+(stats.difficulty||'')).trim()),m('span',players.filter(p=>!p.monster).length+' nearby'),m('span.game-control-hint','Enter to chat · Controls in Settings'),stats.roomCode?m(InviteCode,{code:net.invitationEndpoint?require('../../../../tools/story-invitation.cjs').encode(net.invitationEndpoint,stats.roomCode):stats.roomCode,label:net.invitationEndpoint?'Invitation':'Join code'}):null])]),
      viewport:m('.playarea',{onpointerdown:()=>{if(chat.focused)document.activeElement.blur();}},[
        m('canvas.worldcanvas',{oncreate:v=>{canvas=v.dom;ctx=canvas.getContext('2d');frame=requestAnimationFrame(draw);}}),
        ui.dialogue(stats),
        stats.dead?m('.death-overlay',{role:'dialog','aria-modal':'true'},[m('.death-card',[
          m('h2','You have fallen'),
          m('p',stats.difficulty==='hardcore'?'Hardcore: all items dropped and one level lost (minimum level 1).':'Normal: carried items dropped; most equipped gear is protected.'),
          m('p',stats.deathSummary?String(stats.deathSummary.dropped)+' item slots dropped. '+String(stats.deathSummary.xpLost)+' XP lost.':''),
          m('p',stats.deathSummary?.protected?'Only you can recover these drops in this safe zone.':'Other players can take your drops outside safe zones.'),
          m('button.respawn-button',{onclick:respawn,disabled:respawning},respawning?'Respawning…':'Respawn'),
          m('small','Enter or controller A also respawns.')
        ])]):null,
        stats.dead?null:ui.touch()
      ]),
      player:ui.view(stats,inventory(stats)),quest:ui.tracker(stats),chat:w=>chat.view({managed:true,size:w.size,widthPercent:w.widthPercent,collapsed:w.collapsed,horizontal:['top','bottom'].includes(w.zone),onWidth:value=>hud.setChatWidth(value),onResize:size=>hud.resize('chat',size),onCollapse:()=>hud.collapse('chat'),onExpand:()=>hud.show('chat')})})])
  };
};
