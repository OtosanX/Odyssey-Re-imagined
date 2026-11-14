const assert=require('assert'),fs=require('fs'),os=require('os'),path=require('path');
const {World}=require('./world-runtime.cjs');
const {newMap}=require('../map-format.cjs');
function map(id,flags=64){const m=newMap(12,12);return {...m,id,name:'Fixture '+id,flags,attrs:Array.from({length:144},()=>({type:0,data:[0,0,0,0]})),blocked:Array(144).fill(0),exits:[0,0,0,0],death:{map:1,x:5,y:5}};}
const defs=[{id:1,name:'Dagger',type:1,data:[10,8,0,0],level:0,class:0,picture:1},{id:2,name:'Potion',type:5,data:[0,20,0,0],level:0,class:0,picture:2}];
class Client{constructor(index,name){this.index=index;this.account={username:name};this.messages=[];}send(s,id,data){assert(data.length<=65535);this.messages.push({id,data:JSON.parse(data)});}latest(id){return this.messages.filter(m=>m.id===id).at(-1).data;}}
function fixture(options={}){const dir=fs.mkdtempSync(path.join(os.tmpdir(),'ody-rules-'));const a=map(1,options.flags??64),b=map(2);a.exits[1]=2;b.exits[3]=1;if(options.safeTile)a.attrs[5*12+6].type=6;if(options.block)a.blocked[5*12+6]=1;if(options.warp)a.attrs[5*12+6]={type:2,data:[0,2,3,4]};if(options.hazard)a.attrs[5*12+6]={type:9,data:[50,0,0,0]};fs.writeFileSync(path.join(dir,'classic-world.json'),JSON.stringify({maps:{1:a,2:b},items:defs,drops:[{id:'d1',map:1,x:5,y:5,item:1,value:100,quantity:1},{id:'d2',map:1,x:5,y:5,item:2,value:1,quantity:1}],start:{map:1,x:5,y:5}}));return {dir,w:new World(dir)};}
function send(w,c,id,bytes=[]){w.process({id,data:Buffer.from(bytes)},c);}
function enter(w,id=1,name='alice'){const c=new Client(id,name);send(w,c,0);return c;}
function move(w,c,dir){w.players.get(c).lastMove=0;send(w,c,1,[dir]);}
{
 const {w,dir}=fixture();const a=enter(w);assert.equal(a.latest(2).hp,42);assert.equal(a.latest(2).inventory.length,20);assert.equal(a.latest(0).width,36);assert.equal(a.latest(0).layers[0].length,1296);
 send(w,a,3);assert.equal(a.latest(2).inventory.filter(Boolean).length,1);send(w,a,4,[0]);assert(a.latest(2).inventory[0].equipped);send(w,a,5,[0]);assert.equal(a.latest(2).inventory[0],null);assert(!Object.keys(a.latest(2).equipment).length);send(w,a,3);assert.equal(a.latest(2).inventory[0].item,2);
 const b=enter(w,2,'bob');move(w,b,1);send(w,b,2,[3]);assert.equal(a.latest(2).hp,32);send(w,a,4,[0]);assert.equal(a.latest(2).hp,42);assert.equal(a.latest(2).inventory[0],null);
 const hp=b.latest(2).hp;send(w,a,2,[1]);assert(b.latest(2).hp<hp);const after=b.latest(2).hp;send(w,a,2,[1]);assert.equal(b.latest(2).hp,after,'attack cooldown');
 w.leave(a);const restored=new World(dir),r=enter(restored);assert.equal(r.latest(2).hp,42);assert.equal(r.latest(2).inventory[0],null,'consumed item persists');
}
for(const opts of [{flags:1},{safeTile:true},{flags:0}]){const {w}=fixture(opts),a=enter(w),b=enter(w,2,'bob');move(w,b,1);send(w,a,2,[1]);assert.equal(b.latest(2).hp,42,'safe zones and guild restrictions protect');}
{
 const {w}=fixture({block:true}),a=enter(w);move(w,a,1);assert.equal(w.players.get(a).x,5,'wall rejects movement');
}
{
 const {w}=fixture({warp:true}),a=enter(w);move(w,a,1);assert.equal(a.latest(2).map,2);assert.equal(w.players.get(a).x,3);assert.equal(w.players.get(a).y,4);assert(a.latest(0).teleport);
}
{
 const {w}=fixture({hazard:true}),a=enter(w);move(w,a,1);assert(a.latest(2).dead);move(w,a,1);assert.equal(w.players.get(a).x,6);send(w,a,6);assert.equal(a.latest(2).hp,42);assert.equal(w.players.get(a).x,5);
}
{
 const {w}=fixture(),a=enter(w);for(let i=0;i<7;i++)move(w,a,1);assert.equal(a.latest(2).map,2);assert.equal(w.players.get(a).x,0);assert.equal(a.latest(0).shiftX,-12,'crossing preserves scroll continuity');
}
{
 const root=path.resolve(__dirname,'..'),world=JSON.parse(fs.readFileSync(path.join(root,'server/data/classic-world.json')));let maps=0;for(const m of Object.values(world.maps)){assert.equal(m.layers.length,6);assert(m.layers.every(l=>l.length===144&&l.every(t=>Number.isInteger(t)&&t>=0&&t<=6979)));assert.equal(m.attrs.length,144);maps++;}assert.equal(maps,1520);assert.equal(world.items.length,542);assert.equal(world.drops.length,1413);
 const dir=fs.mkdtempSync(path.join(os.tmpdir(),'ody-archive-'));fs.copyFileSync(path.join(root,'server/data/classic-world.json'),path.join(dir,'classic-world.json'));const w=new World(dir),c=enter(w);assert.equal(c.latest(2).map,355);assert.equal(c.latest(2).mapName,world.maps[355].name);
 for(const m of Object.values(world.maps)){w.players.get(c).map=m.id;w.snapshot(c);c.messages=[];}
 const {installMap}=require('./import-map.cjs');const edit={...JSON.parse(JSON.stringify(world.maps[355])),classicId:355,name:'Edited hall'};
 installMap(edit,dir);const imported=JSON.parse(fs.readFileSync(path.join(dir,'classic-world.json')));
 assert.equal(imported.maps[355].name,'Edited hall');assert.equal(Object.keys(imported.maps).length,1520);assert.deepEqual(imported.maps[1],world.maps[1]);assert(fs.readdirSync(dir).some(f=>f.startsWith('classic-world.backup-')));
}
console.log('PASS: 1,520 original maps and snapshot sizes, archived start, 542 items, 1,413 spawns, inventory pickup/drop/equip/use, persistence, HP, cooldown, safe maps, safe tiles, guild restrictions, walls, warps, death/respawn, scrolling exit transition');
