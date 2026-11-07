const assert=require('assert'),fs=require('fs'),path=require('path'),os=require('os'),{World}=require('./world-runtime.cjs'),{newMap}=require('../map-format.cjs');
function fixture(flags=0,safe=[]){const dir=fs.mkdtempSync(path.join(os.tmpdir(),'ody-safe-monsters-')),map={...newMap(12,12),id:1,flags,npc:0,exits:[0,0,0,0],blocked:Array(144).fill(0),attrs:Array.from({length:144},()=>({type:0,data:[0,0,0,0]})),monsterSpawns:[]};for(const[x,y]of safe)map.attrs[y*12+x].type=6;const monsters={1:{Number:1,Name:'Hostile animal',HP:30,Strength:100,Sight:20,Flags:0,Sprite:1},2:{Number:2,Name:'Friendly villager',HP:30,Strength:100,Sight:20,Flags:8,Sprite:2}};fs.writeFileSync(path.join(dir,'classic-world.json'),JSON.stringify({maps:{1:map},items:[],drops:[],monsters,start:{map:1,x:5,y:5}}));const w=new World(dir),client={index:1,account:{username:'safe_player'},send(){}};const p={id:1,name:'safe_player',map:1,x:5,y:5,hp:42,maxHP:42,level:1,experience:0,inventory:Array(20).fill(null),equipment:{},flags:{},questsSeen:[],journal:[],direction:0};w.players.set(client,p);w.ensureMonsters(1);return {w,p,client};}
function inject(w,x,y,type=1){const def=w.content.monsters[type],m={id:-1001,slot:0,map:1,type,x,y,hp:30,maxHP:30,sprite:1,name:def.Name,nextAttack:0};w.monsters.set('1:0',m);return m;}
{
 const {w,p}=fixture(1);assert.equal(w.spawnMonster(1,1,5,4),0,'hostiles cannot spawn on a safe map');assert(w.spawnMonster(1,2,5,4)>=1,'friendly NPCs still spawn');inject(w,5,4);w.tick();assert.equal(p.hp,42);assert(!w.monsters.has('1:0'),'pre-existing hostile removed from safe map');assert(!p.deathApplied);
}
{
 const {w,p}=fixture(0,[[5,5]]),m=inject(w,5,4);w.tick();assert.equal(p.hp,42,'player on a safe tile cannot be attacked');assert.deepEqual([m.x,m.y],[5,4],'monster does not chase a protected player');
}
{
 const {w,p}=fixture(0,[[5,4]]),m=inject(w,5,4);w.tick();assert.equal(p.hp,42,'a hostile inside safe territory cannot attack out of it');assert(!w.safeAt(m.map,m.x,m.y),'hostile evacuated from safe tile');
}
{
 const {w,p}=fixture(0,[[5,4]]),m=inject(w,5,3);p.y=5;w.tick();assert(!w.safeAt(m.map,m.x,m.y),'pursuit routes around sanctuary instead of entering it');assert.equal(p.hp,42,'routing around protection does not deal remote damage');
}
{
 const {w,p}=fixture();inject(w,5,4);w.tick();assert.equal(p.hp,0,'dangerous areas still allow monster damage');assert(p.deathApplied);
}
{
 const {w,p,client}=fixture(0,[[5,5]]),m=inject(w,5,4);w.attackMonster(client,[0,-1]);assert.equal(m.hp,30,'safe-zone players cannot attack out of sanctuary');
}
{
 const {w,p,client}=fixture(0,[[5,4]]),m=inject(w,5,4);w.attackMonster(client,[0,-1]);assert.equal(m.hp,30,'monsters standing in safe areas cannot be attacked');
}
{
 const {w}=fixture(0,[[5,4]]);assert(w.spawnMonster(1,1,5,4)>=1);const m=w.monsters.get('1:0');assert(!w.safeAt(m.map,m.x,m.y),'hostile spawn chooses an unsafe location instead');
}
console.log('PASS: safe maps and safe tiles prevent hostile spawns, targeting, damage and pursuit; existing hostiles are removed/relocated; cross-boundary attacks are blocked both ways; friendly NPCs remain and unsafe-area danger remains.');
