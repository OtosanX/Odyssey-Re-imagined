'use strict';
function crop(tile,x0,y0,x1,y1){if(!tile)return null;const [u0,v0,u1,v1]=tile.uv;return {page:tile.page,uv:[u0+(u1-u0)*x0,v0+(v1-v0)*y0,u0+(u1-u0)*x1,v0+(v1-v0)*y1]};}
function patch(scene,id){scene.materialPatches||=new Map();if(scene.materialPatches.has(id))return scene.materialPatches.get(id);const art=scene.artAnalysis(id),p=art.rgba,hist=new Map();let minX=32,maxX=-1;for(let n=0;n<1024;n++)if(art.alpha[n]){minX=Math.min(minX,n%32);maxX=Math.max(maxX,n%32);const at=n*4;if((p[at]+p[at+1]+p[at+2])/3>32){const key=(p[at]>>4)*256+(p[at+1]>>4)*16+(p[at+2]>>4);hist.set(key,(hist.get(key)||0)+1);}}const key=[...hist].sort((a,b)=>b[1]-a[1])[0]?.[0]||0,target=[(key>>8)*16+8,(key>>4&15)*16+8,(key&15)*16+8],width=Math.max(1,Math.min(8,maxX-minX-1));let best=null,score=-Infinity;
 for(let y=0;y<=24;y+=2)for(let x=Math.max(0,minX);x<=Math.min(31-width,maxX-width+1);x+=2){let sum=0,square=0,count=0;const rgb=[0,0,0];for(let yy=0;yy<8;yy++)for(let xx=0;xx<width;xx++){const i=((y+yy)*32+x+xx)*4;if(p[i+3]<240)continue;const r=p[i],g=p[i+1],b=p[i+2],v=(r+g+b)/3;sum+=v;square+=v*v;rgb[0]+=r;rgb[1]+=g;rgb[2]+=b;count++;}if(count!==width*8)continue;const mean=sum/count,variance=square/count-mean*mean,distance=rgb.reduce((n,c,i)=>n+(c/count-target[i])**2,0),value=-distance*.02+Math.min(variance,200)*.05-Math.max(0,variance-500)*.01;if(value>score&&mean>22&&mean<235){score=value;best=crop(scene.tileAtlas.tile(id),(x+.1)/32,(y+.1)/32,(x+width-.1)/32,(y+7.9)/32);}}
 const result=best||crop(scene.tileAtlas.tile(100),.25,.16,.75,.84);scene.materialPatches.set(id,result);return result;
}
function roofMaterial(scene,id){const shared=scene.sharedMaterials||(scene.sharedMaterials={roofs:new Map(),texture:null});if(shared.roofs.has(id))return shared.roofs.get(id);if(shared.roofs.size>=256)return patch(scene,id);const gl=scene.gl;
 if(!shared.texture){shared.texture=gl.createTexture();shared.page={texture:shared.texture,width:512,height:512};gl.bindTexture(gl.TEXTURE_2D,shared.texture);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MIN_FILTER,gl.NEAREST);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MAG_FILTER,gl.NEAREST);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_WRAP_S,gl.CLAMP_TO_EDGE);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_WRAP_T,gl.CLAMP_TO_EDGE);gl.texImage2D(gl.TEXTURE_2D,0,gl.RGBA,512,512,0,gl.RGBA,gl.UNSIGNED_BYTE,null);}
 const p=scene.artAnalysis(id).rgba,palette=[];for(let i=0;i<p.length;i+=4)if(p[i+3]>240&&(p[i]+p[i+1]+p[i+2])>60)palette.push([p[i],p[i+1],p[i+2]]);palette.sort((a,b)=>a[0]+a[1]+a[2]-b[0]-b[1]-b[2]);const color=palette[Math.floor(palette.length*.5)]||[100,80,60],pixels=new Uint8Array(4096);
 for(let y=0;y<32;y++)for(let x=0;x<32;x++){const row=Math.floor(y/8),seam=y%8===7||(x+(row%2)*8)%16===15,highlight=y%8===0,f=seam?.65:highlight?1.12:1+((x*7+y*3)%5-2)*.025,at=(y*32+x)*4;for(let c=0;c<3;c++)pixels[at+c]=Math.max(0,Math.min(255,Math.round(color[c]*f)));pixels[at+3]=255;}
 const n=shared.roofs.size,x=n%16*32,y=Math.floor(n/16)*32;gl.bindTexture(gl.TEXTURE_2D,shared.texture);gl.texSubImage2D(gl.TEXTURE_2D,0,x,y,32,32,gl.RGBA,gl.UNSIGNED_BYTE,pixels);const tile={page:shared.page,uv:[(x+.3)/512,(y+.3)/512,(x+31.7)/512,(y+31.7)/512]};shared.roofs.set(id,tile);return tile;
}
function tiled(scene,geometry,tile,points,w,h,light=1){const {quad}=scene.geometry;for(let y=0;y<h;y+=.5)for(let x=0;x<w;x+=.5){const u0=x/w,u1=Math.min(w,x+.5)/w,v0=y/h,v1=Math.min(h,y+.5)/h,at=(u,v)=>points[0].map((p,n)=>p+(points[1][n]-p)*u+(points[3][n]-p)*v);quad(geometry,tile,[at(u0,v0),at(u1,v0),at(u1,v1),at(u0,v1)],[light,light,light,1]);}}
function house(scene,geometry,g,phase=0){
 if((g.profile?.family!=='native-houses'&&g.profile?.model!=='house')||g.width>3||g.height>3)return false;
 const {quad}=scene.geometry,idFor=p=>phase?p.alternate:p.id,bottomRow=g.y+g.height-1,front=g.y+g.bottom/32,back=front-Math.max(1.15,g.width*.65),base=scene.terrain.at(g.x+g.width/2,front-.1),facades=g.cells.filter(c=>c.y===bottomRow),roofCells=g.cells.filter(c=>c.y<bottomRow),wallId=facades.flatMap(c=>c.parts).map(idFor).find(Boolean);if(!wallId)return false;
 const wall=patch(scene,wallId),roof=roofMaterial(scene,roofCells.flatMap(c=>c.parts).map(idFor).find(Boolean)||wallId),height=g.height===1?.8:1.15,rise=Math.max(.35,(g.height-1)*.65),top=base+height,ridge=top+rise,x=g.x,end=x+g.width,mid=x+g.width/2;
 tiled(scene,geometry,wall,[[end,base,back],[x,base,back],[x,top,back],[end,top,back]],g.width,height,.68);
 tiled(scene,geometry,wall,[[x,base,back],[x,base,front],[x,top,front],[x,top,back]],front-back,height,.7);
 tiled(scene,geometry,wall,[[end,base,front],[end,base,back],[end,top,back],[end,top,front]],front-back,height,.84);
 const door=facades.find(c=>scene.world.tiles?.[c.y*scene.world.width+c.x]===0||scene.world.blocked?.[c.y*scene.world.width+c.x]===0),doorX=door?door.x+.5:mid,doorH=Math.min(height,1.1);
 const frontWall=(a,b,y,h)=>{if(b>a&&h>0)tiled(scene,geometry,wall,[[a,y,front],[b,y,front],[b,y+h,front],[a,y+h,front]],b-a,h,.96);};
 if(door){frontWall(x,doorX-.36,base,height);frontWall(doorX+.36,end,base,height);frontWall(doorX-.36,doorX+.36,base+doorH,height-doorH);}else frontWall(x,end,base,height);
 // Original windows/signs/doors stay on the front. The back uses masonry or
 // timber surfaces; copying the front door onto it produced false rear holes.
 for(const c of facades)for(const p of c.parts)if(idFor(p)){const tile=scene.tileAtlas.tile(idFor(p)),face=crop(tile,0,g.height===1?.4:.18,1,1);quad(geometry,face,[[c.x,base,front+.005],[c.x+1,base,front+.005],[c.x+1,top,front+.005],[c.x,top,front+.005]]);}
 tiled(scene,geometry,roof,[[x-.07,top,front+.1],[mid,ridge,front+.1],[mid,ridge,back-.1],[x-.07,top,back-.1]],g.width/2,front-back+.2,.9);
 tiled(scene,geometry,roof,[[mid,ridge,front+.1],[end+.07,top,front+.1],[end+.07,top,back-.1],[mid,ridge,back-.1]],g.width/2,front-back+.2,.73);
 const gable=patch(scene,roofCells.flatMap(c=>c.parts).map(idFor).find(Boolean)||wallId);for(const z of [front,back]){const points=[[x,top,z],[end,top,z],[mid,ridge,z],[mid,ridge,z]];quad(geometry,gable,z===back?[points[1],points[0],points[2],points[3]]:points,[.94,.94,.94,1]);}return true;
}
function wallStrips(scene,geometry,g,phase=0){const handled=new Set();if(g.kind!=='wall')return handled;const {quad}=scene.geometry,idFor=p=>phase?p.alternate:p.id;
 for(const c of g.cells){let min=32,max=-1,count=0;for(let n=0;n<1024;n++)if(c.pixels[n]){min=Math.min(min,n%32);max=Math.max(max,n%32);count++;}if(max-min>14||count<60)continue;
  const x=c.x+min/32,end=c.x+(max+1)/32,front=c.y+1.01,back=c.y-.01,base=scene.terrain.at(c.x+.5,c.y+.5),material=patch(scene,c.parts.map(idFor).find(Boolean)||240);
  tiled(scene,geometry,material,[[x,base,back],[x,base,front],[x,base+1,front],[x,base+1,back]],front-back,1,.72);tiled(scene,geometry,material,[[end,base,front],[end,base,back],[end,base+1,back],[end,base+1,front]],front-back,1,.9);
  quad(geometry,material,[[x,base+1,front],[end,base+1,front],[end,base+1,back],[x,base+1,back]],[.95,.95,.95,1]);for(const p of c.parts)if(idFor(p))quad(geometry,scene.tileAtlas.tile(idFor(p)),[[c.x,base,front],[c.x+1,base,front],[c.x+1,base+1,front],[c.x,base+1,front]]);handled.add(c);
 }return handled;}
function gatehouse(scene,geometry,g){
 if(g.profile?.model!=='gatehouse'||g.width!==4||g.height!==5)return false;
 if(g.cells.some(c=>c.parts.some(p=>p.id!==p.alternate)))return false;
 const used=new Set(g.cells.flatMap(c=>c.parts.map(p=>p.id)));if(![79,82,86,89,108,109].every(id=>used.has(id)))return false;
 const {quad}=scene.geometry,brick=crop(scene.tileAtlas.tile(100),.25,.16,.75,.84),wood=scene.tileAtlas.tile(553),white={page:scene.whitePage,uv:[0,0,1,1]},front=g.y+g.bottom/32-.06,base=scene.terrain.at(g.x+2,front-.1),center=g.x+2,depth=1.45,top=base+3.15;
 const box=(x,z,w,d,y,h,t=brick)=>scene.box(geometry,x,z,w,d,y,h,t),face=(tile,points,light=1)=>quad(geometry,tile,points,[light,light,light,1]);
 // The keep occupies the rear of the original footprint as well. A facade-only
 // gatehouse left grass/empty space where its back and roof should have been.
 const rear=g.y+2.15,rearFront=front-depth+.04,rearTop=base+2.65,leftBack=g.x+.12,rightBack=g.x+g.width-.12,walkway=crop(scene.tileAtlas.tile(94),.1,.1,.9,.9);
 box(leftBack,rear,rightBack-leftBack,rearFront-rear,base,2.65);
 tiled(scene,geometry,brick,[[rightBack,base,rear-.004],[leftBack,base,rear-.004],[leftBack,rearTop,rear-.004],[rightBack,rearTop,rear-.004]],rightBack-leftBack,2.65,.72);
 tiled(scene,geometry,brick,[[leftBack-.004,base,rear],[leftBack-.004,base,rearFront],[leftBack-.004,rearTop,rearFront],[leftBack-.004,rearTop,rear]],rearFront-rear,2.65,.68);
 tiled(scene,geometry,brick,[[rightBack+.004,base,rearFront],[rightBack+.004,base,rear],[rightBack+.004,rearTop,rear],[rightBack+.004,rearTop,rearFront]],rearFront-rear,2.65,.84);
 tiled(scene,geometry,walkway,[[leftBack,rearTop+.004,rearFront],[rightBack,rearTop+.004,rearFront],[rightBack,rearTop+.004,rear],[leftBack,rearTop+.004,rear]],rightBack-leftBack,rearFront-rear,.9);
 for(let x=leftBack;x<rightBack-.2;x+=.5)box(x,rear,.24,.24,rearTop,.24);
 for(let z=rear+.5;z<rearFront;z+=.5){box(leftBack,z,.24,.24,rearTop,.24);box(rightBack-.24,z,.24,.24,rearTop,.24);}
 // A real arched opening: no opaque rectangle covers either entrance cell.
 const opening=1.7,bodyWidth=3,left=center-bodyWidth/2,pier=(bodyWidth-opening)/2;
 for(let y=0;y<3.15;y+=.7){const h=Math.min(.7,3.15-y);box(left,front-depth,pier,depth,base+y,h);box(center+opening/2,front-depth,pier,depth,base+y,h);}
 for(let n=0;n<12;n++){const a=-opening/2+n*opening/12,b=-opening/2+(n+1)*opening/12,mid=(a+b)/2,arch=base+.95+Math.sqrt(Math.max(0,(opening/2)**2-mid**2));box(center+a,front-depth,b-a,depth,arch,top-arch);}
 // Tower walls wrap opaque original masonry, with shaded facets and open tops.
 for(const cx of [g.x+.65,g.x+3.35]){const cz=front-.62,r=.69,height=4.25,sides=16;
  for(let n=0;n<sides;n++){const a=n/sides*Math.PI*2,b=(n+1)/sides*Math.PI*2,x0=cx+Math.cos(a)*r,z0=cz+Math.sin(a)*r,x1=cx+Math.cos(b)*r,z1=cz+Math.sin(b)*r,light=.74+.19*Math.sin((a+b)/2);for(let y=0;y<height;y+=.75){const h=Math.min(.75,height-y),tile=crop(brick,n%4/4,0,(n%4+1)/4,1);face(tile,[[x1,base+y,z1],[x0,base+y,z0],[x0,base+y+h,z0],[x1,base+y+h,z1]],light);}
   const diskY=base+height-.1;face(white,[[cx,diskY,cz],[x0,diskY,z0],[x1,diskY,z1],[cx,diskY,cz]],.35);
  }
  for(let n=0;n<10;n++){const a=n/10*Math.PI*2,x=cx+Math.cos(a)*r,z=cz+Math.sin(a)*r;box(x-.13,z-.13,.26,.26,base+height,.32);}
 }
 // The connecting rampart has matching masonry and battlements, not blank caps.
 face(brick,[[left,top,front],[left+bodyWidth,top,front],[left+bodyWidth,top,front-depth],[left,top,front-depth]],.9);
 for(let n=0;n<7;n++){const x=left+n*.44;box(x,front-.18,.22,.22,top,.25);box(x,front-depth,.22,.22,top,.25);}
 const roofY=base+1.8,roofZ=front+.15,ridge=roofY+.35;face(wood,[[center-.95,roofY,roofZ+.65],[center+.95,roofY,roofZ+.65],[center,ridge,roofZ+.65],[center,ridge,roofZ+.65]],.8);face(wood,[[center-.95,roofY,roofZ+.65],[center,ridge,roofZ+.65],[center,ridge,roofZ-.15],[center-.95,roofY,roofZ-.15]],.85);face(wood,[[center,ridge,roofZ+.65],[center+.95,roofY,roofZ+.65],[center+.95,roofY,roofZ-.15],[center,ridge,roofZ-.15]],.72);
 return true;
}
// Furniture has a real footprint and horizontal top instead of an extruded
// upright picture. Each source cell stays anchored to its original map cell.
function furniture(scene,geometry,g,phase=0){
 const model=g.profile?.model;if(model!=='round-table'&&model!=='barrel')return false;
 const {quad}=scene.geometry;
 for(const c of g.cells){const id=c.parts.map(p=>phase?p.alternate:p.id).find(Boolean);if(!id)continue;
  const barrel=model==='barrel',large=id===220,r=barrel?.31:large?.43:.28,h=barrel?.7:large?.64:.38,cx=c.x+.5,cz=c.y+.55,base=scene.terrain.at(cx,cz),wood=patch(scene,id),top=base+h;
  const cylinder=(radius,y0,y1,mat)=>{for(let n=0;n<16;n++){const a=n*Math.PI/8,b=(n+1)*Math.PI/8,x0=cx+Math.cos(a)*radius,z0=cz+Math.sin(a)*radius,x1=cx+Math.cos(b)*radius,z1=cz+Math.sin(b)*radius;quad(geometry,mat,[[x1,y0,z1],[x0,y0,z0],[x0,y1,z0],[x1,y1,z1]],[.72,.72,.72,1]);}};
  if(barrel)cylinder(r,base,top-.025,wood);else{cylinder(r*.19,base,top-.07,wood);cylinder(r,top-.07,top-.025,wood);}
  const surface=crop(scene.tileAtlas.tile(id),0,0,1,barrel?.38:large?.69:.6);
  quad(geometry,surface,[[cx-r,top,cz+r],[cx+r,top,cz+r],[cx+r,top,cz-r],[cx-r,top,cz-r]]);
 }return true;
}
function tree(scene,geometry,g,phase=0){
 if(g.kind!=='plant')return false;
 // Keep the actual composited sprite outline, pixel colours and scale. Model
 // small textured volumes within it; never turn row widths into stacked balls.
 const W=g.width*32,H=g.height*32,sources=new Array(W*H),step=8,originZ=g.anchor?.z??g.y+g.bottom/32-.08,originY=scene.terrain.at(g.anchor?.x??g.x+g.width/2,originZ),key='tree:'+JSON.stringify([g.width,g.height,g.bottom,g.cells.map(c=>[c.x-g.x,c.y-g.y,c.parts.map(p=>phase?p.alternate:p.id)])]),cache=scene.templates;
 if(cache?.has(key)){const model=cache.get(key);cache.delete(key);cache.set(key,model);scene.diagnostics.templateHits++;for(const q of model.quads)scene.geometry.quad(geometry,q.tile,q.points.map(p=>[p[0]+g.x,p[1]+originY,p[2]+originZ]),q.color);return true;}
 const recorded=[],quad=(geometry,tile,points,color)=>{recorded.push({tile,points:points.map(p=>[p[0]-g.x,p[1]-originY,p[2]-originZ]),color});scene.geometry.quad(geometry,tile,points,color);};
 for(const c of g.cells)for(const part of c.parts){const id=phase?part.alternate:part.id;if(!id)continue;const art=scene.artAnalysis(id);for(let y=0;y<32;y++)for(let x=0;x<32;x++)if(art.alpha[y*32+x])sources[((c.y-g.y)*32+y)*W+(c.x-g.x)*32+x]={id,x,y};}
 const cz=g.anchor?.z??g.y+g.bottom/32-.08,base=scene.terrain.at(g.anchor?.x??g.x+g.width/2,cz),blocks=new Map();
 for(let y=0;y<g.bottom;y+=step){let lo=W,hi=-1,count=0;for(let x=0;x<W;x++)if(sources[y*W+x]){lo=Math.min(lo,x);hi=Math.max(hi,x);count++;}if(hi<0)continue;const middle=(lo+hi+1)/2,radius=(hi-lo+1)/2,dense=count/(hi-lo+1)>.45;
  for(let x=0;x<W;x+=step){let source=sources[y*W+x];if(!source)for(let yy=y;yy<Math.min(H,y+step)&&!source;yy++)for(let xx=x;xx<Math.min(W,x+step)&&!source;xx++)source=sources[yy*W+xx];if(!source)continue;
   // A clipped tile is sampled from its original location, so holes between
   // leaves and branches stay holes rather than being filled with a colour.
   const cell=g.cells.find(c=>c.x===g.x+Math.floor(x/32)&&c.y===g.y+Math.floor(y/32));if(!cell)continue;const id=source.id,tx=x%32,ty=y%32,tile=crop(scene.tileAtlas.tile(id),(tx+.05)/32,(ty+.05)/32,(Math.min(32,tx+step)-.05)/32,(Math.min(32,ty+step)-.05)/32),u=(x+step/2-middle)/Math.max(1,radius),depth=dense?Math.max(.035,Math.sqrt(Math.max(0,1-u*u))*Math.min(.28,radius/32*.36)):.035;
   blocks.set(x+':'+y,{x,y,tile,depth});
  }
 }
 for(const b of blocks.values()){const x0=g.x+b.x/32,x1=x0+step/32,top=base+(g.bottom-b.y)/32,bottom=top-step/32,front=cz+b.depth,back=cz-b.depth;
  quad(geometry,b.tile,[[x0,bottom,front],[x1,bottom,front],[x1,top,front],[x0,top,front]]);
  quad(geometry,b.tile,[[x1,bottom,back],[x0,bottom,back],[x0,top,back],[x1,top,back]],[.78,.82,.78,1]);
  const edge=(dx,dy)=>{const n=blocks.get((b.x+dx)+':'+(b.y+dy));return !n||Math.abs(n.depth-b.depth)>.025;};
  if(edge(0,-step))quad(geometry,b.tile,[[x0,top,front],[x1,top,front],[x1,top,back],[x0,top,back]],[.92,.95,.92,1]);
  if(edge(0,step))quad(geometry,b.tile,[[x0,bottom,back],[x1,bottom,back],[x1,bottom,front],[x0,bottom,front]],[.62,.68,.62,1]);
  if(edge(-step,0))quad(geometry,b.tile,[[x0,bottom,back],[x0,bottom,front],[x0,top,front],[x0,top,back]],[.72,.8,.72,1]);
  if(edge(step,0))quad(geometry,b.tile,[[x1,bottom,front],[x1,bottom,back],[x1,top,back],[x1,top,front]],[.85,.9,.85,1]);
 }
 if(cache){const model={quads:recorded,bytes:recorded.length*192};cache.set(key,model);scene.templateBytes.value+=model.bytes;scene.diagnostics.templateBuilds++;while(cache.size>256||scene.templateBytes.value>16*1024*1024){const oldest=cache.keys().next().value;scene.templateBytes.value-=cache.get(oldest).bytes;cache.delete(oldest);}}
 return true;
}
// Dense rock/masonry areas are volumes on the blocked footprint, not one
// upright sprite sheet per map row. Never infer their footprint from alpha.
function structuralFootprint(world,c,profile){
 if(profile.wallShape&&profile.wallShape!=='auto'||profile.opening)return null;
 const rock=profile.family==='structural-cave-rock';
 const stoneAt=(x,y)=>x>=0&&y>=0&&x<world.width&&y<world.height&&world.layers?.some(l=>[240,241,242].includes(l[y*world.width+x]));
 // Vegetation layered directly over ground-wall artwork describes exposed
 // ruin faces, not a filled building footprint. Preserve their narrow returns.
 const overgrown=world.layers?.some(l=>{const id=l[c.y*world.width+c.x];return id&&require('./scenery-profiles').profileAt(world,c.x,c.y,id).kind==='plant';});
 const masonry=c.profile?.family==='masonry-infill'||!overgrown&&c.parts.some(p=>[240,241,242].includes(p.id))&&(stoneAt(c.x,c.y-1)||stoneAt(c.x,c.y+1));
 if(!rock&&!masonry)return null;
 const blocked=world.blocked?world.blocked[c.y*world.width+c.x]:world.tiles?.[c.y*world.width+c.x]===2;
 if(!blocked)return null;
 return {x:0,z:0,w:1,d:1,h:rock?1.5:1,source:'solid blocked structural footprint'};
}
// Preserve Classic's visible stone silhouette where upper vegetation layers
// cover ground-wall tiles. Extruding the entire base tile invents solid beams.
function layeredRuinWall(scene,geometry,c,profile,phase){
 if(profile.wallShape&&profile.wallShape!=='auto')return false;
 const wall=c.parts.find(p=>p.layer===0&&[240,241,242].includes(phase?p.alternate:p.id));if(!wall)return false;
 const i=c.y*scene.world.width+c.x,id=phase?wall.alternate:wall.id,plants=[];
 for(const l of [1,phase&&scene.world.layers[3]?.[i]?3:2,phase&&scene.world.layers[5]?.[i]?5:4]){const t=scene.world.layers[l]?.[i];if(t&&require('./scenery-profiles').profileAt(scene.world,c.x,c.y,t).kind==='plant')plants.push(scene.artAnalysis(t));}
 if(!plants.length)return false;
 const visible=scene.artAnalysis(id).alpha.slice();for(let n=0;n<1024;n++)if(plants.some(a=>a.alpha[n]))visible[n]=0;
 const {quad}=scene.geometry,base=scene.terrain.at(c.x+.5,c.y+.5),front=c.y+1,back=front-.22,material=patch(scene,id);
 // Greedy rectangles preserve pixel-sized gaps without a quad per pixel.
 for(let y=0;y<32;y++)for(let x=0;x<32;x++){if(!visible[y*32+x])continue;let w=1;while(x+w<32&&visible[y*32+x+w])w++;let h=1;while(y+h<32&&Array.from({length:w},(_,k)=>visible[(y+h)*32+x+k]).every(Boolean))h++;
  for(let yy=y;yy<y+h;yy++)visible.fill(0,yy*32+x,yy*32+x+w);
  const a=c.x+x/32,b=a+w/32,top=base+(32-y)/32,bottom=top-h/32,tile=crop(scene.tileAtlas.tile(id),x/32,y/32,(x+w)/32,(y+h)/32);
  quad(geometry,tile,[[a,bottom,front],[b,bottom,front],[b,top,front],[a,top,front]]);
  quad(geometry,tile,[[b,bottom,back],[a,bottom,back],[a,top,back],[b,top,back]],[.7,.7,.7,1]);
  quad(geometry,material,[[a,top,front],[b,top,front],[b,top,back],[a,top,back]],[.9,.9,.9,1]);
  quad(geometry,material,[[a,bottom,back],[a,bottom,front],[a,top,front],[a,top,back]],[.75,.75,.75,1]);
  quad(geometry,material,[[b,bottom,front],[b,bottom,back],[b,top,back],[b,top,front]],[.85,.85,.85,1]);
 }
 return true;
}
function shapedWalls(scene,geometry,g,phase=0){
 const handled=new Set();if(g.kind!=='wall')return handled;const {wallFootprints,ruinReturns}=require('./wall-shapes'),{profileAt}=require('./scenery-profiles'),{quad}=scene.geometry;
 for(const c of g.cells){const id=c.parts.map(p=>phase?p.alternate:p.id).find(Boolean);if(!id)continue;const profile=profileAt(scene.world,c.x,c.y,id);const layered=layeredRuinWall(scene,geometry,c,profile,phase);if(layered)handled.add(c);const shapes=layered?ruinReturns(scene.world,c,profile):structuralFootprint(scene.world,c,profile)?[structuralFootprint(scene.world,c,profile)]:wallFootprints(c,profile),base=scene.terrain.at(c.x+.5,c.y+.5),tile=c.profile?.family==='masonry-infill'?scene.tileAtlas.tile(122):profile.family==='structural-cave-rock'?scene.tileAtlas.tile(717):patch(scene,id);for(const s of shapes){const x=c.x+s.x,z=c.y+s.z,w=s.w,d=s.d,h=base+(s.h||1);
 quad(geometry,tile,[[x,base,z+d],[x+w,base,z+d],[x+w,h,z+d],[x,h,z+d]]);
 quad(geometry,tile,[[x+w,base,z],[x,base,z],[x,h,z],[x+w,h,z]],[.7,.7,.7,1]);
 quad(geometry,tile,[[x,base,z],[x,base,z+d],[x,h,z+d],[x,h,z]],[.75,.75,.75,1]);
 quad(geometry,tile,[[x+w,base,z+d],[x+w,base,z],[x+w,h,z],[x+w,h,z+d]],[.9,.9,.9,1]);
 quad(geometry,tile,[[x,h,z+d],[x+w,h,z+d],[x+w,h,z],[x,h,z]],[.95,.95,.95,1]);
 // Preserve the full masonry face instead of stretching an eight-pixel patch.
 if([240,241,242].includes(id)&&w===1&&d<.3)quad(geometry,scene.tileAtlas.tile(id),[[x,base,z+d+.002],[x+w,base,z+d+.002],[x+w,h,z+d+.002],[x,h,z+d+.002]]);
 }if(shapes.length)handled.add(c);}return handled;
}
function solidWalls(scene,geometry,g,phase=0){
 const handled=new Set();if(g.kind!=='wall')return handled;const catalog=require('./scenery-catalog'),{quad}=scene.geometry;
 for(const c of g.cells){const ids=c.parts.map(p=>phase?p.alternate:p.id).filter(Boolean);if(!ids.length||ids.some(id=>require('./scenery-profiles').profileAt(scene.world,c.x,c.y,id)?.opening))continue;let filled=0;for(const v of c.pixels)filled+=!!v;if(filled<940&&!ids.some(id=>require('./scenery-profiles').profileAt(scene.world,c.x,c.y,id)?.closed))continue;
  const x=c.x,front=c.y+1,back=front-.22,base=scene.terrain.at(x+.5,c.y+.5),mat=patch(scene,ids[0]);
  // A structural backing closes colorkey mortar pinholes. Open arches and
  // fences stay with silhouette geometry; never fill a real doorway.
  const face=(points,light)=>quad(geometry,mat,points,[light,light,light,1]);
  face([[x,base,front],[x+1,base,front],[x+1,base+1,front],[x,base+1,front]],.95);
  face([[x+1,base,back],[x,base,back],[x,base+1,back],[x+1,base+1,back]],.72);
  face([[x,base,back],[x,base,front],[x,base+1,front],[x,base+1,back]],.72);
  face([[x+1,base,front],[x+1,base,back],[x+1,base+1,back],[x+1,base+1,front]],.86);
  face([[x,base+1,front],[x+1,base+1,front],[x+1,base+1,back],[x,base+1,back]],.95);
  ids.forEach((id,n)=>quad(geometry,scene.tileAtlas.tile(id),[[x,base,front+.001+n*.001],[x+1,base,front+.001+n*.001],[x+1,base+1,front+.001+n*.001],[x,base+1,front+.001+n*.001]]));handled.add(c);
 }return handled;
}
module.exports={layeredRuinWall,structuralFootprint,shapedWalls,gatehouse,house,wallStrips,solidWalls,furniture,tree,rearMaterial:patch};
