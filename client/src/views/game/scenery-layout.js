'use strict';
const catalog=require('./scenery-catalog');
const profiles=require('./scenery-profiles');
const {addVegetation,finishVegetation}=require('./vegetation-layout');
// Build connected silhouettes across layers AND map seams. Do not use collision
// to decide whether water, carpets or paths are walls.
function* sceneryLayoutSteps(world,art,masked=new Set()){
 const w=world.width,h=world.height,cells=new Map(),plants=new Map(),removed=new Set(),counts={};
 if(!world.layers)return {groups:[],removed,counts};
 const regions=world.scene3d?.segments||(world.visual3d?[world.visual3d]:[]);
 const autoMasonry=!profiles.overrides[122]&&!regions.some(r=>r.assetProfiles?.[122]||r.instances?.some(i=>i.tile===122))&&world.layers.some(layer=>layer.some(t=>t>=240&&t<=244));
 for(let y=0;y<h;y++){for(let x=0;x<w;x++){const i=y*w+x;for(const l of [0,1,2,4]){
  if(masked.has(i)&&l>=2)continue;const primary=world.layers[l][i],alternate=l===2||l===4?world.layers[l+1]?.[i]||primary:primary,id=primary||alternate;if(!id)continue;const a=art(id);let entry=profiles.profileAt(world,x,y,id);if(id===122&&(world.blocked?world.blocked[i]:world.tiles?.[i]===2)&&entry?.kind==='ground'&&autoMasonry)entry={kind:'wall',family:'masonry-infill'};const kind=entry?.kind||(a.coverage<.97?'object':'ground');if(kind==='ground'||kind==='ceiling'||kind==='bridge'||entry?.collisionOnly&&!(world.blocked?world.blocked[i]:world.tiles?.[i]===2))continue;
  const b=alternate?art(alternate):a;if(!a.coverage&&!b.coverage)continue;if(kind==='plant'){addVegetation(plants,{[id]:entry},art,x,y,{layer:l,id:primary,alternate});removed.add(l+':'+i);counts.plant=(counts.plant||0)+1;continue;}const family=entry?.join?entry.family:kind,key=x+':'+y+':'+family;let c=cells.get(key);if(!c){c={x,y,kind,family,profile:entry,parts:[],pixels:new Uint8Array(1024)};cells.set(key,c);}if(c.parts.some(p=>p.id===primary&&p.alternate===alternate)){removed.add(l+':'+i);continue;}c.parts.push({layer:l,id:primary,alternate});for(let n=0;n<1024;n++)c.pixels[n]|=a.alpha[n]|b.alpha[n];removed.add(l+':'+i);counts[kind]=(counts[kind]||0)+1;
 }}yield; }
 const touches=(a,b,dx,dy)=>{if(a.profile?.join==='individual')return false;if(a.profile?.join==='house-four'){const pos=id=>({59:[0,0],60:[1,0],61:[0,1],62:[1,1]})[id];return a.parts.some(p=>b.parts.some(q=>{const x=pos(p.id||p.alternate),y=pos(q.id||q.alternate);return x&&y&&y[0]-x[0]===dx&&y[1]-x[1]===dy;}));}if(a.kind==='plant'&&a.parts.some(p=>b.parts.some(q=>(p.id||p.alternate)===(q.id||q.alternate))))return false;if(a.profile?.join==='assembly')return true;if(a.profile?.join==='source')return a.parts.some(p=>b.parts.some(q=>{const pa=(p.id||p.alternate)-1,pb=(q.id||q.alternate)-1;return pb%7-pa%7===dx&&Math.floor(pb/7)-Math.floor(pa/7)===dy;}));if(dy&&(a.kind==='wall'||a.parts.some(p=>b.parts.some(q=>p.id&&p.id===q.id&&p.layer===q.layer))))return false;for(let v=0;v<32;v++)for(let d=0;d<3;d++){const ax=dx===1?31-d:dx===-1?d:v,ay=dy===1?31-d:dy===-1?d:v,bx=dx===1?d:dx===-1?31-d:v,by=dy===1?d:dy===-1?31-d:v;if(a.pixels[ay*32+ax]&&b.pixels[by*32+bx])return true;}return false;};
 const seen=new Set(),groups=[];for(const [key,c]of cells){if(seen.has(key))continue;const parts=[c];let minY=c.y,maxY=c.y;seen.add(key);for(let n=0;n<parts.length;n++){const a=parts[n];for(const [dx,dy]of [[1,0],[-1,0],[0,1],[0,-1]]){const k=(a.x+dx)+':'+(a.y+dy)+':'+a.family,b=cells.get(k),heightLimit=a.profile?.maxHeight||(a.kind==='plant'?3:a.kind==='building'?6:4);if(b&&!seen.has(k)&&Math.max(maxY,b.y)-Math.min(minY,b.y)<heightLimit&&touches(a,b,dx,dy)){seen.add(k);parts.push(b);minY=Math.min(minY,b.y);maxY=Math.max(maxY,b.y);}}}
  const x0=Math.min(...parts.map(p=>p.x)),y0=Math.min(...parts.map(p=>p.y)),x1=Math.max(...parts.map(p=>p.x))+1,y1=Math.max(...parts.map(p=>p.y))+1;
  // An interior wall follows its own row in the map's floor plan; trees and
  // complete house silhouettes may span several rows of old artwork.
  const depth=c.profile?.depth||(c.kind==='building'?Math.min(1.3,Math.max(.65,(y1-y0)*.5)):c.kind==='wall'?1.02:c.kind==='plant'?.12:x1-x0>=2&&y1-y0>=2?.65:x1-x0>=2?.35:.18);
  let bottom=0;for(const p of parts)for(let n=0;n<1024;n++)if(p.pixels[n])bottom=Math.max(bottom,(p.y-y0)*32+Math.floor(n/32)+1);
  groups.push({kind:c.kind,profile:c.profile,cells:parts,x:x0,y:y0,width:x1-x0,height:y1-y0,bottom,depth});yield;
 }for(const tree of plants.values()){groups.push(finishVegetation(tree,world));yield;}for(const group of groups)profiles.applyInstance(world,group);return {groups,removed,counts};
}
function sceneryLayout(...args){const steps=sceneryLayoutSteps(...args);let next;do{next=steps.next();}while(!next.done);return next.value;}
module.exports={sceneryLayout,sceneryLayoutSteps};
