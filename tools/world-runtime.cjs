const fs=require('fs'),path=require('path');
const equipment=require('../client/src/models/equipment');
const {attachVisuals,collectVisuals}=require('./visual-world.cjs');
class World{
 constructor(folder,options={}){
 this.options=options;this.folder=folder;
 this.players=new Map();this.maps={};this.items={};this.profiles=Object.create(null);this.drops=[];
 const mode=path.join(folder,'world-mode.json');this.classic=fs.existsSync(path.join(folder,'classic-world.json'))&&(!fs.existsSync(mode)||JSON.parse(fs.readFileSync(mode)).mode!=='custom');
 this.file=options.file||path.join(folder,'progress-'+(this.classic?'classic':'custom')+'.json');
 if(this.classic){const d=JSON.parse(fs.readFileSync(path.join(folder,'classic-world.json')));this.content=d;this.maps=d.maps;this.start=d.start;for(const i of d.items)this.items[i.id]=i;this.drops=d.drops.map(o=>({...o,quantity:[6,11].includes(this.items[o.item]?.type)?Math.max(1,o.value):1}));}
 else{const format=require('../map-format.cjs'),file=path.join(folder,'world.json'),m=fs.existsSync(file)?format.validateMap(JSON.parse(fs.readFileSync(file))):format.newMap();this.maps[1]={...m,id:1,flags:m.flags??1,attrs:m.attrs||Array.from({length:m.width*m.height},()=>({type:0,data:[0,0,0,0]})),exits:[0,0,0,0]};const a=m.anchors.find(a=>a.id===m.spawnAnchor);this.start={map:1,x:a.x,y:a.y};}
 attachVisuals(this.maps,folder);
 if(this.classic){const startFile=path.join(folder,'start-location.json');if(fs.existsSync(startFile)){const start=JSON.parse(fs.readFileSync(startFile,'utf8'));if(!this.walkable(start.map,start.x,start.y))throw Error('Configured starting location is not walkable.');const map=this.maps[start.map],i=start.y*map.width+start.x;map.attrs||=Array.from({length:map.width*map.height},()=>({type:0,data:[0,0,0,0]}));const attr=map.attrs[i];if(attr.type!==0&&attr.type!==6)throw Error('Configured spawn overlaps a special tile.');this.start={map:start.map,x:start.x,y:start.y};if(start.protectSpawn)map.attrs[i]={type:6,data:[0,0,0,0]};}}
 if(fs.existsSync(this.file)){const d=JSON.parse(fs.readFileSync(this.file));this.savedGame=d.game||{};this.profiles=Object.assign(Object.create(null),d.profiles||{});if(Array.isArray(d.drops))this.drops=d.drops;}
 }
 walkable(map,x,y){const m=this.maps[map];return m&&Number.isInteger(x)&&Number.isInteger(y)&&x>=0&&y>=0&&x<m.width&&y<m.height&&!m.blocked[y*m.width+x];}
 attr(p){return this.maps[p.map].attrs?.[p.y*this.maps[p.map].width+p.x]||{type:0,data:[0,0,0,0]};}
 zone(p){const m=this.maps[p.map];return (m.flags&1)||this.attr(p).type===6?'Safe zone':(m.flags&64)?'Open PvP':'Guild PvP';}
 tell(c,notice=''){
 const p=this.players.get(c);if(!p)return;equipment.normalize(p,this.items);
 const value={...this.state(p),hp:p.hp,maxHP:p.maxHP,level:p.level,dead:!p.hp,inventory:p.inventory.map((s,slot)=>s?{...this.items[s.item],...s,slot,equipped:Object.values(p.equipment).includes(slot)}:null),equipment:p.equipment,zone:this.zone(p),map:p.map,mapName:this.maps[p.map].areaName||this.maps[p.map].name,notice};
 for(const key of ['dialogue','ambientDialogue'])if(value[key])value[key]={...value[key],history:(value[key].history||[]).slice(),messages:(value[key].messages||[]).slice()};
 value.journal=(value.journal||[]).slice();let data=Buffer.from(JSON.stringify(value));
 // Conversation history is bounded and trimmed for the legacy 16-bit packet size.
 const trim=[value.dialogue?.history,value.ambientDialogue?.history,value.journal,value.ambientDialogue?.messages,value.dialogue?.messages];
 while(data.length>60000){const list=trim.find(a=>a?.length>1);if(!list)throw Error('Player state exceeds packet limit.');list.shift();data=Buffer.from(JSON.stringify(value));}
 c.send(4,2,data);
 }
 placements(p){const m=this.maps[p.map],out=[{id:p.map,x:0,y:0}];if(!this.classic)return out;const offsets=[[0,-12],[12,0],[0,12],[-12,0]];for(let d=0;d<4;d++){const id=m.exits[d];if(this.maps[id]&&!out.some(o=>o.id===id))out.push({id,x:offsets[d][0],y:offsets[d][1]});}for(const r of out.slice(1))for(let d=0;d<4;d++){const x=r.x+offsets[d][0],y=r.y+offsets[d][1],id=this.maps[r.id].exits[d];if(Math.abs(x)!==12||Math.abs(y)!==12||!this.maps[id]||out.some(o=>o.id===id||o.x===x&&o.y===y))continue;const other=out.find(o=>o.x===(r.x?0:x)&&o.y===(r.y?0:y));if(other&&this.maps[other.id].exits[r.x?(r.x>0?1:3):(r.y>0?2:0)]===id)out.push({id,x,y});}return out;}
 viewRadius(p){return this._viewRadii?.get(p)||1;}
 viewOffset(p){return this.classic?12*this.viewRadius(p):0;}
 renderPlacements(p){return require('./view-distance.cjs').extendPlacements(this.maps,this.placements(p),this.viewRadius(p));}
 snapshot(c,shiftX=0,shiftY=0,teleport=false){const p=this.players.get(c),m=this.maps[p.map],offset=this.viewOffset(p),width=this.classic?(this.viewRadius(p)*2+1)*12:m.width;let view;
 if(!this.classic)view={...m,tiles:m.blocked.map(v=>v*2),centerX:p.x,centerY:p.y};else{const layers=Array.from({length:6},()=>Array(width*width).fill(0)),tiles=Array(width*width).fill(2);for(const r of this.renderPlacements(p)){const m=this.maps[r.id];for(let y=0;y<12;y++)for(let x=0;x<12;x++){const i=y*12+x,j=(y+offset+r.y)*width+x+offset+r.x;tiles[j]=m.blocked[i]*2;for(let l=0;l<6;l++)layers[l][j]=l>=2&&this.openDoors?.has(r.id+':'+i)?0:m.layers[l][i];}}view={width,height:width,layers,tiles,centerX:offset+p.x,centerY:offset+p.y,name:m.areaName||m.name,scene3d:collectVisuals(this.maps,this.renderPlacements(p),offset)};}
 const packet={...view,viewOffset:offset,viewRadius:this.viewRadius(p),self:c.index,stepMs:150,mapId:p.map,shiftX,shiftY,teleport};let data=Buffer.from(JSON.stringify(packet));
 if(this.viewRadius(p)>1&&data.length>60000){const encoded=data.toString('base64'),revision=this.snapshotRevision=(this.snapshotRevision||0)+1,count=Math.ceil(encoded.length/16000);for(let index=0;index<count;index++)c.send(4,18,Buffer.from(JSON.stringify({revision,index,count,chunk:encoded.slice(index*16000,(index+1)*16000)})));return;}
 if(data.length>60000&&packet.scene3d){const scene=packet.scene3d,revision=this.sceneRevision=(this.sceneRevision||0)+1;delete packet.scene3d;packet.scene3dPending={revision,count:scene.segments.length};data=Buffer.from(JSON.stringify(packet));if(data.length>65535)throw Error('Map snapshot too large');c.send(4,0,data);for(let index=0;index<scene.segments.length;index++){const piece=Buffer.from(JSON.stringify({revision,index,segment:scene.segments[index]}));if(piece.length>65535)throw Error('3D segment exceeds packet size.');c.send(4,17,piece);}return;}
 if(data.length>65535)throw Error('Map snapshot too large');c.send(4,0,data);}
 save(){for(const p of this.players.values()){const {lastMove,lastAttack,id,name,activeDialogue,ambientDialogue,dialogueInteractive,dialogueMessages,dialogueRevision,dialogueSpeaker,dialogueActor,_dialogueBatch,...profile}=p;this.profiles[name]={...profile,lastPlayed:Date.now()};}if(fs.existsSync(this.file)&&(!this.lastBackup||Date.now()-this.lastBackup>60000)){fs.copyFileSync(this.file,this.file+'.backup');this.lastBackup=Date.now();}fs.writeFileSync(this.file+'.tmp',JSON.stringify({profiles:this.profiles,drops:this.drops,game:this.persistentState()}));fs.renameSync(this.file+'.tmp',this.file);}
 process(msg,c){if(!c.account)return;
 if(msg.id===0){if(!this.players.has(c)){const p={map:this.start.map,x:this.start.x,y:this.start.y,hp:42,maxHP:42,level:1,sprite:c.characterSprite||1,experience:0,flags:{},questsSeen:[],specialPvp:false,inventory:Array(20).fill(null),equipment:{},guild:0,direction:2,...this.profiles[c.characterName||c.account.username],id:c.index,name:c.characterName||c.account.username,lastMove:0,lastAttack:0};if(!this.walkable(p.map,p.x,p.y))Object.assign(p,this.start);p.activeDialogue=null;p.ambientDialogue=null;p.dialogueInteractive=false;p.dialogueMessages=[];p.dialogueRevision=0;p._dialogueBatch=false;this.players.set(c,p);c.playing=true;}this.snapshot(c,0,0,true);this.tell(c,'Welcome to '+this.maps[this.players.get(c).map].name+'.');this.save();this.broadcast();return;}
 const p=this.players.get(c);if(!p)return;
 if(msg.id===18&&msg.data.length===1){const radius=msg.data[0]===2?2:1;if(radius!==this.viewRadius(p)){const old=this.viewOffset(p);this._viewRadii||=new WeakMap();this._viewRadii.set(p,radius);const shift=this.viewOffset(p)-old;this.snapshot(c,shift,shift);this.broadcast();}return;}
 if(msg.id===6&&!p.hp){const d=this.maps[p.map].death;Object.assign(p,d&&this.walkable(d.map,d.x,d.y)?d:this.start);p.hp=p.maxHP;this.snapshot(c,0,0,true);this.tell(c,'You have respawned.');this.save();this.broadcast();return;}
 if(!p.hp)return this.tell(c,'You are dead. Choose Respawn.');
 if(msg.id===1&&msg.data.length===1){const d=msg.data[0],delta=[[0,-1],[1,0],[0,1],[-1,0]][d];if(!delta||Date.now()-p.lastMove<140)return;p.lastMove=Date.now();p.direction=d;
 const m=this.maps[p.map];let x=p.x+delta[0],y=p.y+delta[1],map=p.map,transition=false;
 if(x<0||y<0||x>=m.width||y>=m.height){map=m.exits[d];if(!this.maps[map])return;if(x<0)x=this.maps[map].width-1;if(x>=m.width)x=0;if(y<0)y=this.maps[map].height-1;if(y>=m.height)y=0;transition=true;}
 if(!this.walkable(map,x,y)){this.broadcast();return;}
 const from=this.attr(p),to=this.maps[map].attrs?.[y*this.maps[map].width+x];if((from.type===17&&(from.data[0]&(1<<[1,7,2,4][d])))||(to?.type===17&&(to.data[0]&(1<<[3,5,0,6][d]))))return;
 const oldX=p.x,oldY=p.y;Object.assign(p,{map,x,y});const a=this.attr(p);let teleport=false;
 if(a.type===2){const dest=a.data[0]*256+a.data[1];if(this.walkable(dest,a.data[2],a.data[3])){p.map=dest;p.x=a.data[2];p.y=a.data[3];transition=true;teleport=true;}}
 if(a.type===9)p.hp=Math.max(0,p.hp-Math.max(1,a.data[0]));
 if(transition)this.snapshot(c,teleport?0:p.x-oldX-delta[0],teleport?0:p.y-oldY-delta[1],teleport);
 this.tell(c);this.save();this.broadcast();return;
 }
 if(msg.id===2&&msg.data.length===1){const delta=[[0,-1],[1,0],[0,1],[-1,0]][msg.data[0]];if(!delta||Date.now()-p.lastAttack<600)return;p.lastAttack=Date.now();p.direction=msg.data[0];if(this.attackMonster(c,delta))return;const found=Array.from(this.players.entries()).find(([other,q])=>other!==c&&q.hp&&q.map===p.map&&q.x===p.x+delta[0]&&q.y===p.y+delta[1]);if(!found)return this.tell(c,'No player in reach.');const [target,q]=found;
 if(this.zone(p)==='Safe zone'||this.zone(q)==='Safe zone')return this.tell(c,'Combat is blocked in safe zones.');if(!(this.maps[p.map].flags&64)&&(!p.guild||!q.guild)&&!(p.specialPvp&&q.specialPvp))return this.tell(c,'This map requires guild membership for PvP.');
 const weapon=this.items[p.inventory[p.equipment[1]??p.equipment[6]]?.item];const armor=Object.entries(q.equipment).filter(([type])=>['2','3','4'].includes(type)).reduce((n,[,slot])=>n+(this.items[q.inventory[slot]?.item]?.data[1]||0),0);const damage=Math.max(1,10+(weapon?.data[1]||0)-armor);q.hp=Math.max(0,q.hp-damage);q.lastCombat=p.lastCombat=Date.now();this.tell(c,'You hit '+q.name+' for '+damage+'.');this.tell(target,q.hp?'Hit by '+p.name+' for '+damage+'.':'You were defeated by '+p.name+'.');this.save();this.broadcast();return;}
 if(msg.id===3){const d=this.drops.find(d=>d.map===p.map&&d.x===p.x&&d.y===p.y&&(!d.protected||d.owner===p.name));if(!d)return this.tell(c,'No item here. Stand on an item and press E.');const i=this.items[d.item];if(!i)return;const stack=[6,11].includes(i.type)?p.inventory.findIndex(s=>s?.item===d.item):-1,slot=stack>=0?stack:p.inventory.indexOf(null);if(slot<0)return this.tell(c,'Inventory is full (20 slots).');if(stack>=0)p.inventory[slot].quantity+=d.quantity;else p.inventory[slot]={item:d.item,quantity:d.quantity,value:d.value};this.drops.splice(this.drops.indexOf(d),1);this.tell(c,'Picked up '+i.name+'.');this.save();this.broadcast();return;}
 if((msg.id===4||msg.id===5)&&msg.data.length===1){const slot=msg.data[0],s=p.inventory[slot],i=s&&this.items[s.item];if(!i)return;
 if(msg.id===5){if(this.drops.filter(d=>d.map===p.map).length>=80)return this.tell(c,'Too many items on this map.');this.drops.push({id:'drop-'+Date.now()+'-'+c.index,map:p.map,x:p.x,y:p.y,...s});p.inventory[slot]=null;for(const key of Object.keys(p.equipment))if(p.equipment[key]===slot)delete p.equipment[key];this.tell(c,'Dropped '+i.name+'.');}
 else if(equipment.slotFor(i.type)){equipment.normalize(p,this.items);const gearSlot=equipment.slotFor(i.type);if(i.level>p.level)return this.tell(c,'Requires level '+i.level+'.');if(i.class&&!(i.class&(1<<((p.class||1)-1))))return this.tell(c,'This item is for another class.');if(p.equipment[gearSlot]===slot)delete p.equipment[gearSlot];else{if(gearSlot===1)delete p.equipment[6];if(gearSlot===6)delete p.equipment[1];p.equipment[gearSlot]=slot;}this.tell(c,'Equipment updated.');}
 else if(i.type===5&&[0,1].includes(i.data[0])){p.hp=Math.max(0,Math.min(p.maxHP,p.hp+(i.data[0]===0?1:-1)*i.data[1]));if(--s.quantity<=0)p.inventory[slot]=null;this.tell(c,'Used '+i.name+'.');}
 else return this.tell(c,'This item has no supported use yet.');this.save();this.broadcast();}
 }
 leave(c){if(!this.players.has(c))return;this.save();this.players.delete(c);c.playing=false;this.broadcast();}
 broadcast(){for(const [c,p]of this.players){const places=this.placements(p),offset=this.viewOffset(p);const players=Array.from(this.players.values()).flatMap(q=>{const r=places.find(r=>r.id===q.map);return r?[{id:q.id,name:q.name,x:q.x+r.x+offset,y:q.y+r.y+offset,hp:q.hp,maxHP:q.maxHP,direction:q.direction,map:q.map,sprite:q.sprite||1}]:[];});c.send(4,1,Buffer.from(JSON.stringify(players.concat(this.monsterView(p)))));const drops=this.drops.flatMap(d=>{const r=places.find(r=>r.id===d.map);return r?[{...d,picture:this.items[d.item]?.picture,x:d.x+r.x+offset,y:d.y+r.y+offset}]:[];});for(let i=0;i<Math.max(1,drops.length);i+=100)c.send(4,3,Buffer.from(JSON.stringify({reset:i===0,items:drops.slice(i,i+100)})));}}
}
module.exports={World:require('./chat.cjs').extend(require('./game-features.cjs').extend(World))};



