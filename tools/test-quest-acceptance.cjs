'use strict';
const assert=require('assert/strict'),fs=require('fs'),os=require('os'),path=require('path'),{World}=require('./world-runtime.cjs');
const dir=fs.mkdtempSync(path.join(os.tmpdir(),'ody-acceptance-'));fs.copyFileSync(path.join(__dirname,'../server/data/classic-world.json'),path.join(dir,'classic-world.json'));
for(const mode of ['story','mmo']){
 const w=new World(dir,{mode,file:path.join(dir,mode+'.json')}),c={index:1,account:{username:'Tester'},send(){}},p={id:1,name:'Tester',map:54,x:5,y:5,hp:42,maxHP:42,level:50,experience:0,inventory:Array(20).fill(null),equipment:{},flags:{},questsSeen:[91,92,93,240,241,242,243],journal:[]};w.players.set(c,p);
 assert.deepEqual(w.quests(p),[]);w.api().getplayerflag(1,92);assert.deepEqual(w.quests(p),[]);
 w.give(p,27);w.runScript('joinmap54',[1]);assert.equal(w.count(p,27),1);assert.deepEqual(w.quests(p),[]);assert.throws(()=>w.acceptQuest(p,91),/Speak/);
 w.process({id:10,data:Buffer.alloc(0)},c);assert.equal(w.questOffer(p).id,91);p.lastTalk=0;w.process({id:10,data:Buffer.from('/acceptquest 91')},c);assert.equal(w.count(p,27),0);assert.equal(w.quests(p)[0].status,'completed');assert.equal(p.experience,1000);assert.throws(()=>w.acceptQuest(p,91));
 p.map=1003;p.lastTalk=0;w.process({id:10,data:Buffer.alloc(0)},c);p.lastTalk=0;w.process({id:10,data:Buffer.from('/acceptquest 93')},c);assert.equal(w.quests(p).find(q=>q.id==='93').status,'active');w.save();const reload=new World(dir,{file:w.file});assert(reload.profiles.Tester.acceptedQuests.includes(93));
 p.flags[92]=1;assert(w.quests(p).some(q=>q.id==='92'));p.flags[92]=0;assert(!w.quests(p).some(q=>q.id==='92'));assert.equal(w.scriptErrors.length,0);
}
console.log('PASS: Story/MMO acceptance-only logs, no discovery from flag reads, no automatic item hand-in before acceptance, active/completed state, duplicate/remote rejection, existing progress and save persistence.');
