'use strict';
(()=>{
 const area=$('mapArea'),viewBar=document.querySelector('.studio-view-tools');
 // Keep the actual drawing controls together; move nodes, not copies with separate state.
 const essentials=document.createElement('div');essentials.className='toolbar studio-essential-tools';essentials.id='studioPaintControls';
 area.querySelector('.toolbar').after(essentials);
 const title=document.createElement('strong');title.textContent='Paint';essentials.append(title);
 for(const id of ['studioTool','layer','tileId','surfaceKind','eraseMap','mapGrid']){const node=$(id);essentials.append(node.parentElement?.tagName==='LABEL'?node.parentElement:node);}
 const layerLabel=$('layer').parentElement;layerLabel.firstChild.textContent='Paint layer ';
 $('surfaceKind').parentElement.title='Controls the 3D surface of tiles you paint. To change existing artwork without replacing it, use Fix existing 3D surfaces.';
 const access=document.createElement('div');access.id='studioMapAccess';access.className='studio-access-notice';const message=document.createElement('strong'),authorize=document.createElement('button'),duplicate=document.createElement('button');authorize.id='studioAuthorizeMap';authorize.textContent='Edit original draft';duplicate.id='studioDuplicateMap';duplicate.textContent='Make editable copy';access.append(message,authorize,duplicate);
 const report=document.createElement('div');report.id='studioActionStatus';report.setAttribute('role','status');report.textContent=$('status').textContent;
 const observer=new MutationObserver(()=>report.textContent=$('status').textContent);observer.observe($('status'),{childList:true,characterData:true,subtree:true});
 const first=area.querySelector('.toolbar');first.after(access,essentials,report);
 async function run(fn){try{await fn();refresh();}catch(e){status(e.message);}}
 authorize.onclick=()=>run(()=>studioLibrary.authorize(studioEditor.key));
 duplicate.onclick=()=>run(async()=>{const key=await studioLibrary.library.duplicate(studioEditor.key);studioLibrary.refresh();await studioLibrary.openMap(key);status('Editing a Player Made copy. The original map is unchanged.');});
 function refresh(){const protectedMap=studioEditor.readOnly;message.textContent=protectedMap?'Viewing protected Classic map — painting and repairs are locked.':'Editing '+studioEditor.map.name+' · '+(studioEditor.dirty?'Unsaved draft':'Draft ready');authorize.hidden=duplicate.hidden=!protectedMap;access.classList.toggle('protected',protectedMap);}
 const timer=setInterval(refresh,250);refresh();window.addEventListener('unload',()=>{clearInterval(timer);observer.disconnect();});
 // Explicit layer choice for repairs, independent of the layer used for painting.
 const layer=document.createElement('select');layer.id='repairLayer';for(const option of [...$('layer').options].filter(o=>/^[0-5]$/.test(o.value)))layer.append(option.cloneNode(true));layer.value='0';const label=document.createElement('label');label.textContent='Repair layer ';label.append(layer);$('surfaceRepair').insertBefore(label,$('surfaceRepair').children[1]);
 const fold=(label,nodes,reference)=>{const details=document.createElement('details');details.className='studio-advanced';const summary=document.createElement('summary');summary.textContent=label;details.append(summary);reference.after(details);const body=document.createElement('div');body.className='toolbar';details.append(body);for(const node of nodes)if(node)body.append(node);details.addEventListener('toggle',()=>{window.fitStudioPanels?.();window.studio3d?.draw();});return details;};
 const diagnostics=[...viewBar.querySelectorAll('label')].filter(n=>n.querySelector('input[type=checkbox]')&&n!==$('studioSyncLabel'));
 fold('Advanced inspection · wireframe, faces, hidden geometry',diagnostics,viewBar);
 for(const details of document.querySelectorAll('.studio-inspector'))details.open=false;
 // Collapse rarely used map-rule and geometry controls while keeping editing visible.
 const rules=area.querySelectorAll(':scope > .toolbar')[1];
 const labels=['pvpMode','noMonsterCombat','localChatMode'].map(id=>$(id)?.parentElement);
 fold('Map rules · PvP, NPC protection, local chat',labels,report);
 if(document.querySelector('.studio-geometry-tools'))fold('3D structure tools · heights and houses',[document.querySelector('.studio-geometry-tools')],$('surfaceRepair'));
 if(document.querySelector('.studio-geometry-help'))document.querySelector('.studio-geometry-help').hidden=true;
 window.fitStudioPanels?.();
})();
