'use strict';
const m=require('mithril'),InviteCode=require('./invite-code'),Appearances=require('./appearances');
module.exports=net=>{
 let stage='modes',mode=null,characters=[],capabilities=null,loading=true,error='',warning='',alive=false,timer,animation;
 let difficulty='normal',sprite=1,name='My adventure',invite=null,existingSave=null,appearanceData=null,artLoading=false,artError='',page=0,query='',facing=1,walking=true,tick=0;
 let joinCode='',joinBusy=false,renameId='',renameName='',mutation=false,previousUser='',draft=null;
 const PAGE_SIZE=64;
 const resized=()=>m.redraw();
 const request=data=>net.send(4,15,Buffer.from(JSON.stringify(data)));
 function refresh(){loading=true;error='';clearTimeout(timer);request({action:'catalogue'});timer=setTimeout(()=>{if(alive&&loading){loading=false;error='The character list did not load. Please retry.';m.redraw();}},12000);}
 function modeName(){return mode==='story'?'Story':'MMO';}
 function available(d){return capabilities?.mmoSlots.find(s=>s.difficulty===d)?.available===true;}
 function filteredSprites(){const terms=query.trim().toLowerCase();return (appearanceData?.items||[]).filter(s=>!terms||String(s.id).includes(terms)||('appearance '+s.id).includes(terms));}
 function selectedFrame(){const item=appearanceData?.items.find(s=>s.id===sprite),base=facing*3,step=walking?tick%2:0;return item?.frames.includes(base+step)?base+step:item?.frames.includes(base)?base:item?.frames[0]??3;}
 async function loadArt(){if(artLoading)return;artLoading=true;artError='';try{appearanceData=await Appearances.load(capabilities.spriteMin,capabilities.spriteMax);if(!appearanceData.items.length)throw Error('No selectable character artwork was found.');if(stage==='create'&&!appearanceData.items.some(s=>s.id===sprite))sprite=appearanceData.items[0].id;}catch(e){artError=e.message;}artLoading=false;if(alive)m.redraw();}
 function startCreation(context={}){
  if(!capabilities||loading)return;invite=context.invite||null;existingSave=context.save||null;
  if(mode==='mmo'&&!capabilities.mmoSlots.some(s=>s.available))return;
  difficulty=invite?.difficulty||existingSave?.difficulty||(mode==='mmo'&&!available('normal')?'hardcore':'normal');
  sprite=appearanceData?.items.find(s=>s.id===1)?.id||appearanceData?.items[0]?.id||1;name=existingSave?.name||'My adventure';query='';page=0;facing=1;walking=true;error='';stage='create';
 }
 function enter(options,returnDraft=null){net.worldError='';draft=returnDraft;net.worldOptions=options;if(options.sprite)Appearances.remember(net.username,options.sprite);m.route.set('/game');}
 function continueCharacter(c){if(!c.started){startCreation({save:c});return;}Appearances.remember(net.username,c.sprite);enter(c.mode==='story'?{mode:'story',action:'continue',saveId:c.saveId}:{mode:'mmo',action:'continue',characterId:c.id});}
 function canCreate(){return !loading&&!artLoading&&!artError&&appearanceData?.items.some(s=>s.id===sprite)&&(mode==='story'||available(difficulty))&&(mode!=='story'||invite||name.trim().length>=1&&name.trim().length<=60);}
 function create(){if(!canCreate())return;const options={mode,action:invite?'join':'create',difficulty,sprite};if(mode==='story'){if(invite)options.code=invite.code;else if(existingSave)options.saveId=existingSave.saveId;else options.name=name.trim();}enter(options,{mode,difficulty,sprite,name,invite,existingSave});}
 function reply(msg){
  if(msg.system!==4||msg.id!==8)return;const data=JSON.parse(msg.data.toString());
  if(data.invite){joinBusy=false;const found=data.invite;if(found.character?.started)continueCharacter(found.character);else startCreation({invite:found});m.redraw();return;}
  if(data.error){error=data.error;loading=false;joinBusy=false;mutation=false;clearTimeout(timer);m.redraw();return;}
  if(data.characters&&data.capabilities){characters=data.characters;capabilities=data.capabilities;loading=false;mutation=false;warning=data.warning||'';error=net.worldError||'';net.worldError='';clearTimeout(timer);if(!appearanceData&&!artLoading)loadArt();if(net.createStory||net.openStorySave){const save=characters.find(c=>c.saveId===net.openStorySave);net.createStory=false;net.openStorySave=null;mode='story';startCreation(save?{save}:{});}}
  else if(mutation){mutation=false;renameId='';refresh();}else if(data.saves&&!capabilities){loading=false;clearTimeout(timer);error='Restart the server to enable the updated character launcher.';}
  m.redraw();
 }
 const button=(label,onclick,attrs={})=>m('button',{type:'button',onclick,...attrs},label);
 function top(){return m('.rpg-masthead.compact',[m('span.rpg-eyebrow','ODYSSEY REIMAGINED'),m('h1',stage==='modes'?'Choose your Odyssey':stage==='characters'?modeName()+' Characters':'Creating '+modeName()+' Character'),net.hostingPort?m('p','Hosting this profile on port '+net.hostingPort+'. Friends connect to your address, then use your Story join code. Keep this game open.'):net.offline?m('p','Offline · Saved on this PC · No internet connections accepted'):null,m('.launcher-account',[m('span','Signed in as '+net.username),button('Sign Out',()=>{net.send(1,2,Buffer.alloc(0));m.route.set('/login');},{class:'rpg-back'})])]);}
 function modes(){return [m('p.rpg-intro','Choose the kind of adventure you want to play.'),m('.mode-cards',[
  m('button.mode-card.story-mode',{type:'button','data-mode':'story',onclick:()=>{mode='story';stage='characters';error='';}},[m('.mode-art',m(Appearances.Portrait,{sprite:84,scale:4})),m('span.rpg-eyebrow','YOUR ADVENTURE'),m('h2','Story Mode'),m('p','Experience your own Odyssey adventure.'),m('small','Your saves · Up to 8 players'),m('span.card-action','Choose Story →')]),
  m('button.mode-card.mmo-mode',{type:'button','data-mode':'mmo',onclick:()=>{mode='mmo';stage='characters';error='';}},[m('.mode-art',m(Appearances.Portrait,{sprite:1,scale:4})),m('span.rpg-eyebrow','A SHARED WORLD'),m('h2','MMO Mode'),m('p','Explore a shared world with other players.'),m('small','A persistent world · Player economy'),m('span.card-action','Choose MMO →')])
 ])];}
 function characterCard(c){const unavailable=!Appearances.valid(c.sprite);return m('article.character-card.story-save-card',{key:c.id,'data-character-id':c.id},[
  m('.character-card-top',[m(Appearances.Portrait,{sprite:c.sprite,scale:3}),m('div',[m('span.difficulty-badge',{class:c.difficulty},c.difficulty==='hardcore'?'Hardcore':'Normal'),m('h3',c.name),m('small',c.characterName!==c.name?c.characterName:modeName()+' character')])]),
  m('.character-facts',[m('span',c.started?'Level '+c.level:'Not started'),m('span',c.location),m('small',c.updated?'Last played '+new Date(c.updated).toLocaleDateString():'Not played yet')]),
  unavailable?m('p.appearance-warning','Appearance '+c.sprite+' is unavailable. Your saved appearance will be kept; a temporary fallback is shown in game.'):null,
  c.joinCode?m(InviteCode,{code:c.joinCode}):null,
  renameId===c.id?m('form.rename-save',{onsubmit:e=>{e.preventDefault();if(!renameName.trim()||renameName.trim().length>60)return;mutation=true;request({action:'rename',saveId:c.saveId,name:renameName.trim()});}},[m('input',{'aria-label':'Save name',maxLength:60,value:renameName,oninput:e=>renameName=e.target.value,disabled:mutation}),m('button',{type:'submit',disabled:mutation||!renameName.trim()},mutation?'Saving…':'Save'),button('Cancel',()=>renameId='',{disabled:mutation})]):null,
  m('.rpg-actions',[button(c.started?'Continue':'Create Character',()=>continueCharacter(c),{class:'rpg-primary continue-character',disabled:loading}),c.mode==='story'&&c.mine?button('Rename',()=>{renameId=c.id;renameName=c.name;error='';}):null,c.mode==='story'&&c.mine?button('New Join Code',()=>{if(confirm('Replace the join code? Your save and existing members stay available.')){mutation=true;request({action:'rotate',saveId:c.saveId});}},{disabled:mutation}):null])
 ]);}
 function selection(){const entries=characters.filter(c=>c.mode===mode),full=mode==='mmo'&&capabilities&&!capabilities.mmoSlots.some(s=>s.available);return [
  m('.screen-heading',[button('← Game Modes',()=>{if(net.returnHome&&net.preferredMode)return net.returnHome();stage='modes';error='';},{class:'rpg-back'}),button(loading?'Loading…':'Refresh Characters',refresh,{disabled:loading})]),
  loading?m('p.rpg-loading',{role:'status'},'Loading your characters…'):null,
  !loading&&!entries.length?m('p.rpg-intro','Your '+modeName()+' adventure starts with a new character.'):null,
  mode==='mmo'?m('p.rpg-muted','MMO currently supports one character per difficulty on this account. Existing characters are never overwritten.'):null,
  m('.character-cards',[...entries.map(characterCard),m('button.create-character-card',{type:'button',disabled:loading||!capabilities||full,onclick:()=>startCreation()},[m('span.plus','+'),m('strong','Create New Character'),m('small',full?'Both MMO slots are in use. Continue an existing character.':'Choose difficulty and appearance')])]),
  mode==='story'?m('form.join-story.rpg-panel',{onsubmit:e=>{e.preventDefault();if(joinCode.trim().length!==8||joinBusy)return;joinBusy=true;error='';request({action:'inspectInvite',code:joinCode.trim()});}},[m('div',[m('h3','Join a friend'),m('p.rpg-muted','Use their join code. The host’s difficulty applies; existing progress stays intact.')]),m('label',['Join code',m('input',{'aria-label':'Story join code',maxLength:8,value:joinCode,placeholder:'8-character code',oninput:e=>joinCode=e.target.value.toUpperCase(),disabled:joinBusy})]),m('button',{type:'submit',disabled:joinBusy||joinCode.trim().length!==8},joinBusy?'Checking invitation…':'Join Story')]):null
 ];}
 function difficultyIcon(hard){return m('svg',{viewBox:'0 0 32 32',width:32,height:32,fill:'none',stroke:'currentColor','stroke-width':2,'aria-hidden':'true'},hard?[m('path',{d:'M8 23v-3C1 13 6 3 16 3s15 10 8 17v3H8Zm3 0v6h10v-6M16 24v5'}),m('circle',{cx:11,cy:13,r:2}),m('circle',{cx:21,cy:13,r:2}),m('path',{d:'m14 20 2-4 2 4'})]:[m('path',{d:'M16 2 28 7v10c0 6-12 13-12 13S4 23 4 17V7L16 2Z'}),m('path',{d:'m10 15 4 4 8-9'})]);}
 function spriteGrid(){const choices=filteredSprites(),pages=Math.max(1,Math.ceil(choices.length/PAGE_SIZE));page=Math.min(page,pages-1);const visible=choices.slice(page*PAGE_SIZE,(page+1)*PAGE_SIZE);return m('.appearance-section',[
  m('.screen-heading',[m('h3','Choose your appearance'),m('span.rpg-muted',(appearanceData?.items.length||0)+' available')]),
  m('input.appearance-search',{type:'search','aria-label':'Search appearance ID',placeholder:'Search appearance ID…',value:query,oninput:e=>{query=e.target.value;page=0;}}),
  artLoading?m('p.rpg-loading',{role:'status'},'Discovering character artwork…'):null,artError?m('.inline-error',[m('p',artError),button('Retry artwork',loadArt)]):null,
  m('.appearance-grid',{role:'group','aria-label':'Character appearances'},visible.map(item=>m('button.appearance-card',{key:item.id,type:'button',class:sprite===item.id?'selected':'','data-sprite-id':item.id,'aria-pressed':sprite===item.id,tabindex:sprite===item.id||!visible.some(s=>s.id===sprite)&&item===visible[0]?0:-1,onclick:()=>sprite=item.id,onkeydown:e=>{
   if(!['ArrowLeft','ArrowRight','ArrowUp','ArrowDown','Home','End'].includes(e.code))return;e.preventDefault();const grid=e.currentTarget.parentElement,cols=Math.max(1,getComputedStyle(grid).gridTemplateColumns.split(/\s+/).filter(Boolean).length),index=choices.findIndex(s=>s.id===sprite),next=e.code==='Home'?0:e.code==='End'?choices.length-1:Math.max(0,Math.min(choices.length-1,index+({ArrowLeft:-1,ArrowRight:1,ArrowUp:-cols,ArrowDown:cols}[e.code])));sprite=choices[next].id;page=Math.floor(next/PAGE_SIZE);m.redraw();setTimeout(()=>document.querySelector('.appearance-grid [data-sprite-id="'+sprite+'"]')?.focus(),30);
  }},[m(Appearances.Portrait,{sprite:item.id,scale:2}),m('span','ID '+item.id),sprite===item.id?m('span.appearance-check',{'aria-hidden':'true'},'✓'):null]))),
  !artLoading&&!artError&&!visible.length?m('p.rpg-muted','No appearances match this search.'):null,
  m('.appearance-pagination',[button('← Previous Page',()=>page--,{disabled:page===0}),m('span',`Page ${page+1} of ${pages}`),button('Next Page →',()=>page++,{disabled:page>=pages-1})])
 ]);}
 function creation(){const locked=!!(invite||existingSave);return [
  button('← Characters',()=>{stage='characters';error='';},{class:'rpg-back'}),
  invite?m('p.invitation-summary','Joining '+invite.name+' · Hosted by '+invite.owner):null,
  m('.character-creation',[
   m('.creation-options.rpg-panel',[
    mode==='story'&&!invite?m('label.creation-name',['Story save name',m('input',{value:name,maxLength:60,readonly:!!existingSave,oninput:e=>name=e.target.value}),m('small.rpg-muted','Your character uses your account name. This names the Story save.')]):m('.creation-name',[m('strong','Character: '+net.username),m('p.rpg-muted',invite?'Your progress will belong to this account in your friend’s save.':'Characters currently use your account name.')]),
    m('h3','Choose your difficulty'),m('.difficulty-cards',['normal','hardcore'].map(d=>m('button.difficulty-card',{type:'button',class:d+(difficulty===d?' selected':''),'data-difficulty':d,'aria-pressed':difficulty===d,disabled:locked&&d!==difficulty||mode==='mmo'&&!available(d),onclick:()=>difficulty=d},[difficultyIcon(d==='hardcore'),m('strong',d==='hardcore'?'Hardcore':'Normal'),m('p',d==='hardcore'?'All items drop on death. Lose one level, down to level 1.':'Carried items drop; most equipped gear is protected. Lose 5% of current-level XP.'),mode==='mmo'&&!available(d)?m('small','An existing character uses this slot.'):locked?m('small','This save’s difficulty is fixed.'):null,difficulty===d?m('span.difficulty-check','✓ Selected'):null]))),
    spriteGrid()
   ]),
   m('aside.creation-preview.rpg-panel',[
    m('span.rpg-eyebrow','YOUR CHARACTER'),m('h2',net.username),m('.large-appearance',m(Appearances.Portrait,{sprite,scale:window.innerWidth<=680?4:6,frame:selectedFrame()})),m('strong.selected-appearance','Appearance '+sprite),
    m('label',['Facing',m('select',{'aria-label':'Preview facing',value:facing,onchange:e=>facing=+e.target.value},['North','South','West','East'].map((label,i)=>m('option',{value:i},label)))]),
    m('label.preview-walking',[m('input',{type:'checkbox',checked:walking,onchange:e=>walking=e.target.checked}),'Walking preview']),
    m('dl.creation-summary',[m('dt','Game Mode'),m('dd',modeName()),m('dt','Difficulty'),m('dd',{class:difficulty},difficulty==='hardcore'?'Hardcore':'Normal'),m('dt','Appearance'),m('dd','ID '+sprite),mode==='story'?m('dt','Story Save'):null,mode==='story'?m('dd',invite?.name||name):null]),
    m('button.rpg-primary.create-and-play',{type:'button',disabled:!canCreate(),onclick:create},'Create Character & Play'),m('small.rpg-muted','Your character is created only when you confirm. Continuing a character keeps its saved settings.')
   ])
  ])
 ];}
 return {
  oninit(){alive=true;window.addEventListener('resize',resized);error=net.worldError||'';if(net.launcherReset||previousUser!==net.username){stage=net.preferredMode?'characters':'modes';mode=net.preferredMode||null;draft=null;characters=[];capabilities=null;net.launcherReset=false;}else if(error&&draft){mode=draft.mode;difficulty=draft.difficulty;sprite=draft.sprite;name=draft.name;invite=draft.invite;existingSave=draft.existingSave;stage='create';}else if(mode)stage='characters';previousUser=net.username;net.on('message',reply);const worldError=error;refresh();if(worldError)error=worldError;animation=setInterval(()=>{if(alive&&stage==='create'&&walking){tick++;m.redraw();}},150);},
  onremove(){alive=false;window.removeEventListener('resize',resized);clearInterval(animation);clearTimeout(timer);net.removeListener('message',reply);},
  view:()=>m('main.lobby.rpg-shell',[
   top(),net.profileWarning?m('p.inline-error',net.profileWarning):null,warning?m('p.rpg-muted',warning):null,
   stage==='modes'?modes():stage==='characters'?selection():creation(),
   error?m('.inline-error',{role:'alert'},[m('p',error),!capabilities?button('Retry character list',refresh,{disabled:loading}):null]):null
  ])
 };
};
