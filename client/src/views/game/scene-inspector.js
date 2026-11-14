'use strict';
// CPU diagnostics are opt-in for Studio. Gameplay keeps no triangle copies.
const sub=(a,b)=>a.map((n,i)=>n-b[i]);
const cross=(a,b)=>[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]];
const dot=(a,b)=>a.reduce((s,n,i)=>s+n*b[i],0);
function capture(scene,group,geometry,starts){
 if(!scene.inspectGeometry)return;
 const faces=[],warnings=[],seen=new Set();
 for(const [page,data] of geometry)for(let i=starts.get(page)||0;i<data.length;i+=27){
  const points=[data.slice(i,i+3),data.slice(i+9,i+12),data.slice(i+18,i+21)],normal=cross(sub(points[1],points[0]),sub(points[2],points[0])),length=Math.hypot(...normal);
  if(length<1e-8)continue; // Quad triangles intentionally collapse at gable tips.
  const key=points.map(p=>p.map(n=>n.toFixed(4)).join(',')).sort().join('|');if(seen.has(key))warnings.push('Coincident triangle');seen.add(key);
  if(!points.flat().every(Number.isFinite))warnings.push('Non-finite vertex');
  faces.push({points,page,color:data.slice(i+5,i+9),normal:normal.map(n=>n/length),uv:[data.slice(i+3,i+5),data.slice(i+12,i+14),data.slice(i+21,i+23)]});
 }
 (scene.inspectionObjects||=[]).push({group,faces,warnings:[...new Set(warnings)]});
}
function rayTriangle(ray,points){const [a,b,c]=points,e1=sub(b,a),e2=sub(c,a),p=cross(ray.direction,e2),det=dot(e1,p);if(Math.abs(det)<1e-8)return null;const t=sub(ray.origin,a),u=dot(t,p)/det;if(u<0||u>1)return null;const q=cross(t,e1),v=dot(ray.direction,q)/det;if(v<0||u+v>1)return null;const distance=dot(e2,q)/det;return distance>=0?distance:null;}
function pick(objects,ray){return objects.map((object,index)=>{let distance=Infinity;for(const face of object.faces){const d=rayTriangle(ray,face.points);if(d!==null)distance=Math.min(distance,d);}return {object,index,distance};}).filter(h=>Number.isFinite(h.distance)).sort((a,b)=>a.distance-b.distance);}
function draw(ctx,pose,objects,options={}){
 for(const [i,object]of objects.entries()){
  if(options.selected!=null&&options.selected!==i)continue;
  if(options.labels||options.warnings&&object.warnings.length){const g=object.group,p=pose.project(g.anchor?.x??g.x+g.width/2,g.anchor?.z??g.y+g.height/2,0);if(p){ctx.font='11px system-ui';ctx.fillStyle=object.warnings.length?'#ff8181':'#ffe1a1';ctx.fillText((options.labels?g.kind+' '+(g.profile?.family||i):'')+(options.warnings&&object.warnings.length?' ⚠ '+object.warnings.join(', '):''),p.x,p.y);}}
  if(options.tileIds)for(const c of object.group.cells){const p=pose.project(c.x+.5,c.y+.5,0);if(p){ctx.font='10px system-ui';ctx.fillStyle='#fff0ac';ctx.fillText(c.parts.map(p=>p.id).join('/'),p.x,p.y);}}
  for(const face of object.faces){const points=face.points.map(p=>pose.project(p[0],p[2],p[1]));if(points.some(p=>!p))continue;const roof=Math.abs(face.normal[1])>.25;
   if(options.faces){ctx.fillStyle=roof?'#dfb95355':'#4dbdec55';ctx.beginPath();points.forEach((p,n)=>n?ctx.lineTo(p.x,p.y):ctx.moveTo(p.x,p.y));ctx.closePath();ctx.fill();}
   if(options.wire){ctx.strokeStyle=object.warnings.length?'#ff5c62':'#eacb83';ctx.lineWidth=.6;ctx.beginPath();points.forEach((p,n)=>n?ctx.lineTo(p.x,p.y):ctx.moveTo(p.x,p.y));ctx.closePath();ctx.stroke();}
   if(options.normals){const center=[0,1,2].map(n=>face.points.reduce((s,p)=>s+p[n],0)/3),end=center.map((n,j)=>n+face.normal[j]*.18),a=pose.project(center[0],center[2],center[1]),b=pose.project(end[0],end[2],end[1]);if(a&&b){ctx.strokeStyle='#f38bf0';ctx.beginPath();ctx.moveTo(a.x,a.y);ctx.lineTo(b.x,b.y);ctx.stroke();}}
  }
 }
}
function filteredGeometry(objects,{hideRoofs=false,hideWalls=false}={}){const groups=new Map();for(const object of objects)for(const face of object.faces){const building=object.group.kind==='building',roof=building&&Math.abs(face.normal[1])>.25,wall=object.group.kind==='wall'||building&&!roof;if(hideRoofs&&roof||hideWalls&&wall)continue;let data=groups.get(face.page);if(!data){data=[];groups.set(face.page,data);}for(let i=0;i<3;i++)data.push(...face.points[i],...face.uv[i],...face.color);}return groups;}
function tileRules(world){const result=[];for(let i=0;i<world.width*world.height;i++){const owner=world.owners?.[i],a=owner?world.maps?.[owner.key]?.attrs?.[owner.index]:world.attrs?.[i];if(!a)continue;for(const type of [a.type,a.type2])if(type){const label=({1:'Blocked',2:'Warp',3:'Warp',6:'Safe',8:'Hall',9:'Damage',10:'No monsters',11:'Script',13:'Door',14:'Door',15:'Door',16:'Door',17:'Directional wall',19:'Light',20:'Dampening'})[type]||'Rule '+type;result.push({x:i%world.width,y:Math.floor(i/world.width),type,label});}}return result;}
function drawRules(ctx,project,world){ctx.font='10px system-ui';for(const rule of tileRules(world)){const p=project(rule.x+.5,rule.y+.5);if(!p)continue;ctx.fillStyle=rule.type===2||rule.type===3?'#ddadff':rule.type===10?'#ffbe7c':'#9ce6ef';ctx.fillText(rule.label,p.x,p.y);}}
module.exports={capture,pick,draw,rayTriangle,filteredGeometry,tileRules,drawRules};
