'use strict';
const Camera=require('../../models/camera-settings');
const {GeometryCache}=require('./geometry-cache');
const {readArt,buildScenerySteps}=require('./scenery-mesh');
// Small WebGL scene renderer. Simulation coordinates and all game rules stay on
// the existing server; heights/structures here are explicitly visual metadata.
const VERT=`attribute vec3 aPosition;attribute vec2 aUV;attribute vec4 aColor;
 uniform vec2 uYaw;uniform vec3 uCamera;uniform vec2 uViewport;uniform vec2 uAngle;uniform float uDistance;uniform float uFocal;varying vec2 vUV;varying vec4 vColor;varying vec3 vPosition;
 void main(){vec3 p=aPosition-uCamera;p.xz=vec2(p.x*uYaw.x-p.z*uYaw.y,p.x*uYaw.y+p.z*uYaw.x);float depth=uDistance-p.y*uAngle.x-p.z*uAngle.y;
 float vertical=p.y*uAngle.y-p.z*uAngle.x;
 gl_Position=vec4(p.x*uFocal/(uViewport.x*.5),vertical*uFocal/(uViewport.y*.5)-.16*depth,1.001668*depth-.200167,depth);vUV=aUV;vColor=aColor;vPosition=aPosition;}`;
const FRAG=`
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
uniform sampler2D uTexture;uniform float uShadow;uniform float uScenery;uniform float uCutaway;uniform vec3 uPlayer;varying vec2 vUV;varying vec4 vColor;varying vec3 vPosition;
 void main(){if(uShadow>.5){float r=length(vUV*2.-1.);if(r>1.)discard;gl_FragColor=vec4(0.,0.,0.,.3*(1.-r*r));return;}
 vec4 c=texture2D(uTexture,vUV)*vColor;if(c.a<.025)discard;bool fade=uCutaway>.5&&vPosition.z>uPlayer.z+.03&&vPosition.y>uPlayer.y+.18&&distance(vPosition.xz,uPlayer.xz)<1.5;if(uScenery>.5&&uScenery<1.5&&fade)discard;if(uScenery>1.5){if(!fade)discard;c.a*=.22;}gl_FragColor=c;}`;
function shader(gl,type,source){const s=gl.createShader(type);gl.shaderSource(s,source);gl.compileShader(s);if(!gl.getShaderParameter(s,gl.COMPILE_STATUS)){const error=gl.getShaderInfoLog(s);gl.deleteShader(s);throw Error(error);}return s;}
function projection(cx,cy,cz,width,height,zoom,tilt=55,yaw=0){const yawR=yaw*Math.PI/180,ys=Math.sin(yawR),yc=Math.cos(yawR);const angle=tilt*Math.PI/180,sin=Math.sin(angle),cos=Math.cos(angle),distance=26,focal=distance*zoom;
 const project=(x,z,y=0)=>{const px=(x-cx)*yc-(z-cz)*ys,pz=(x-cx)*ys+(z-cz)*yc,depth=distance-(y-cy)*sin-pz*cos;if(depth<=.1)return null;const scale=focal/depth;return {x:width/2+px*scale,y:height*.58-((y-cy)*cos-pz*sin)*scale,scale,depth};};
 const ray=(sx,sy)=>{const px=(sx-width/2)/focal,vertical=(height*.58-sy)/focal,py=vertical*cos-sin,pz=-vertical*sin-cos;return {origin:[cx+distance*cos*ys,cy+distance*sin,cz+distance*cos*yc],direction:[px*yc+pz*ys,py,-px*ys+pz*yc]};};
 return {cx,cy,cz,width,height,zoom,sin,cos,yc,ys,distance,focal,project,ray};
}
class Atlas{
 constructor(gl,image){this.gl=gl;this.cols=Math.floor(image.width/32);this.rows=Math.floor(image.height/32);this.span=Math.max(1,Math.floor(Math.min(gl.getParameter(gl.MAX_TEXTURE_SIZE),gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER,gl.HIGH_FLOAT).precision?16384:512)/32));this.pages=new Map();
  for(let row=0;row<this.rows;row+=this.span)for(let col=0;col<this.cols;col+=this.span){const canvas=document.createElement('canvas');canvas.width=Math.min(this.span,this.cols-col)*32;canvas.height=Math.min(this.span,this.rows-row)*32;canvas.getContext('2d').drawImage(image,col*32,row*32,canvas.width,canvas.height,0,0,canvas.width,canvas.height);const texture=gl.createTexture();gl.bindTexture(gl.TEXTURE_2D,texture);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MIN_FILTER,gl.NEAREST);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MAG_FILTER,gl.NEAREST);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_WRAP_S,gl.CLAMP_TO_EDGE);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_WRAP_T,gl.CLAMP_TO_EDGE);gl.texImage2D(gl.TEXTURE_2D,0,gl.RGBA,gl.RGBA,gl.UNSIGNED_BYTE,canvas);this.pages.set(Math.floor(col/this.span)+':'+Math.floor(row/this.span),{texture,width:canvas.width,height:canvas.height});}
 }
 tile(id){if(!Number.isInteger(id)||id<1||id>this.cols*this.rows)return null;const x=(id-1)%this.cols,y=Math.floor((id-1)/this.cols),page=this.pages.get(Math.floor(x/this.span)+':'+Math.floor(y/this.span)),px=x%this.span*32,py=y%this.span*32;
  // Half-texel inset prevents neighboring atlas cells bleeding at perspective edges.
  return {page,uv:[(px+.3)/page.width,(py+.3)/page.height,(px+31.7)/page.width,(py+31.7)/page.height]};
 }
 dispose(){for(const p of this.pages.values())this.gl.deleteTexture(p.texture);this.pages.clear();}
}
function quad(groups,tile,points,color=[1,1,1,1]){if(!tile)return;let data=groups.get(tile.page);if(!data){data=[];groups.set(tile.page,data);}const [u0,v0,u1,v1]=tile.uv,uv=[[u0,v1],[u1,v1],[u1,v0],[u0,v0]];for(const index of [0,1,2,0,2,3])data.push(...points[index],...uv[index],...color);}
// Legacy roofs contain transparent triangular silhouettes. Use their actual
// palette to build opaque repeating surfaces, rather than stretching a cutout
// across a new roof plane. The original door/front artwork is retained below.
function buildingMaterials(gl,image,structures,analyze){
 const keys=[...new Set(structures.flatMap(s=>[...s.roofTiles.map(id=>'roof:'+id),...s.wallTiles.map(id=>'wall:'+id)]))];if(!keys.length)return null;
 let src;if(!analyze){const source=document.createElement('canvas');source.width=image.width;source.height=image.height;src=source.getContext('2d',{willReadFrequently:true});src.drawImage(image,0,0);}
 const canvas=document.createElement('canvas');canvas.width=Math.min(32,keys.length)*32;canvas.height=Math.ceil(keys.length/32)*32;const ctx=canvas.getContext('2d'),ids=new Map(),output=ctx.createImageData(canvas.width,canvas.height);
 keys.forEach((key,n)=>{const [kind,idText]=key.split(':'),id=+idText,pixels=analyze?analyze(id).rgba:src.getImageData((id-1)%32*32,Math.floor((id-1)/32)*32,32,32).data,colors=[];
  for(let y=12;y<30;y++)for(let x=3;x<29;x++){const i=(y*32+x)*4;if(pixels[i+3]>220&&pixels[i]+pixels[i+1]+pixels[i+2]>65)colors.push([pixels[i],pixels[i+1],pixels[i+2]]);}
  colors.sort((a,b)=>a[0]+a[1]+a[2]-b[0]-b[1]-b[2]);const base=colors[Math.floor(colors.length*.55)]||[110,88,62],ox=n%32*32,oy=Math.floor(n/32)*32;
  for(let y=0;y<32;y++)for(let x=0;x<32;x++){const row=Math.floor(y/(kind==='roof'?5:8)),seam=y%(kind==='roof'?5:8)===0||(x+(row%2)*8)%16===0,f=seam?.6:1+(((x*13+y*7+id)%9)-4)*.018,at=((oy+y)*canvas.width+ox+x)*4;for(let c=0;c<3;c++)output.data[at+c]=Math.max(0,Math.min(255,Math.round(base[c]*f)));output.data[at+3]=255;}ids.set(key,n+1);
 });ctx.putImageData(output,0,0);return {atlas:new Atlas(gl,canvas),ids};
}
function makeTerrain(world){const count=world.width*world.height,heights=Array(count).fill(0),walls=Array(count).fill(0),wallTiles=Array(count).fill(0),structures=[];
 const segments=world.scene3d?.segments||(world.visual3d?[{...world.visual3d,x:0,y:0,width:world.width,height:world.height}]:[]);
 for(const s of segments){for(let y=0;y<s.height;y++)for(let x=0;x<s.width;x++){const xx=s.x+x,yy=s.y+y;if(xx<0||yy<0||xx>=world.width||yy>=world.height)continue;const a=y*s.width+x,b=yy*world.width+xx;heights[b]=s.heights?.[a]||0;walls[b]=s.walls?.[a]||0;wallTiles[b]=s.wallTiles?.[a]||0;}for(const house of s.structures||[])structures.push({...house,x:house.x+s.x,y:house.y+s.y});}
 const vertex=(x,y)=>{let sum=0,n=0;for(const yy of [y-1,y])for(const xx of [x-1,x])if(xx>=0&&yy>=0&&xx<world.width&&yy<world.height){sum+=heights[yy*world.width+xx];n++;}return n?sum/n:0;};
 const at=(x,z)=>{const xx=Math.floor(x),zz=Math.floor(z),u=x-xx,v=z-zz;if(xx<0||zz<0||xx>=world.width||zz>=world.height)return 0;const a=vertex(xx,zz),b=vertex(xx+1,zz),c=vertex(xx+1,zz+1),d=vertex(xx,zz+1);return u>=v?a+(b-a)*u+(c-b)*v:a+(c-d)*u+(d-a)*v;};
 return {heights,walls,wallTiles,structures,vertex,at};
}
class Scene3D{
 constructor(){this.appearances=require('./appearances');this.canvas=document.createElement('canvas');const gl=this.canvas.getContext('webgl',{alpha:false,antialias:false,depth:true,preserveDrawingBuffer:true});if(!gl)throw Error('WebGL is unavailable on this device.');this.gl=gl;this.bufferCache=new GeometryCache(gl);this.lost=false;this.onLost=e=>{e.preventDefault();this.lost=true;};this.canvas.addEventListener('webglcontextlost',this.onLost);
  const vs=shader(gl,gl.VERTEX_SHADER,VERT),fs=shader(gl,gl.FRAGMENT_SHADER,FRAG),p=gl.createProgram();gl.attachShader(p,vs);gl.attachShader(p,fs);gl.linkProgram(p);gl.deleteShader(vs);gl.deleteShader(fs);if(!gl.getProgramParameter(p,gl.LINK_STATUS))throw Error(gl.getProgramInfoLog(p));this.program=p;this.attrs=['aPosition','aUV','aColor'].map(n=>gl.getAttribLocation(p,n));this.uniforms=Object.fromEntries(['uYaw','uCamera','uViewport','uAngle','uDistance','uFocal','uTexture','uShadow','uScenery','uCutaway','uPlayer'].map(n=>[n,gl.getUniformLocation(p,n)]));this.dynamic=gl.createBuffer();this.meshes=[];this.atlases=[];this.world=null;this.frames=[];this.anchors=new Map();this.stats={triangles:0,drawCalls:0};
  this.white=gl.createTexture();gl.bindTexture(gl.TEXTURE_2D,this.white);gl.texImage2D(gl.TEXTURE_2D,0,gl.RGBA,1,1,0,gl.RGBA,gl.UNSIGNED_BYTE,new Uint8Array([255,255,255,255]));gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MIN_FILTER,gl.NEAREST);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MAG_FILTER,gl.NEAREST);this.whitePage={texture:this.white,width:1,height:1};this.sharedMaterials={roofs:new Map(),texture:null};this.cache=new Map();this.templates=new Map();this.templateBytes={value:0};this.pending=null;this.offset={x:0,y:0};this.diagnostics={cacheHits:0,builds:0,cancelled:0,templateHits:0,templateBuilds:0};
 }
 release(stage){if(!stage)return;for(const mesh of stage.meshes||[]){if(mesh.entry)this.bufferCache.release(mesh.entry);else this.gl.deleteBuffer(mesh.buffer);}stage.meshes=[];stage.materials?.atlas.dispose();stage.materials=null;}
 clearWorld(){if(this.pending){this.pending.steps.return();this.release(this.pending.stage);this.pending=null;}for(const stage of this.cache.values())this.release(stage);this.cache.clear();this.world=null;this.requestWorld=null;this.frames=[];this.meshes=[];this.offset={x:0,y:0};}
 replaceAssets(){this.clearWorld();this.bufferCache.clear();for(const atlas of this.atlases)atlas.dispose();this.atlases=[];this.tileAtlas=this.spriteAtlas=this.objectAtlas=null;this.artAnalysis=null;this.templates.clear();this.templateBytes.value=0;if(this.sharedMaterials.texture)this.gl.deleteTexture(this.sharedMaterials.texture);this.sharedMaterials={roofs:new Map(),texture:null};}
 *uploadSteps(groups){const gl=this.gl,list=[];for(const [page,data]of groups)for(let at=0;at<data.length;at+=16380*9){const values=new Float32Array(data.slice(at,at+16380*9)),entry=this.bufferCache.acquire(values),buffer=entry.buffer;const mesh={page,buffer,entry,count:values.length/9};list.push(mesh);this.meshes.push(mesh);yield;}return list;}
 upload(groups){const steps=this.uploadSteps(groups);let r;do{r=steps.next();}while(!r.done);return r.value;}
 *buildWorld(world,assets){
  this.terrain=makeTerrain(world);yield;this.materials=buildingMaterials(this.gl,assets.tiles,this.terrain.structures,this.artAnalysis);yield;const masked=new Set();for(const s of this.terrain.structures)for(let y=s.y;y<s.y+s.d;y++)for(let x=s.x;x<s.x+s.w;x++)masked.add(y*world.width+x);for(let i=0;i<this.terrain.walls.length;i++)if(this.terrain.walls[i]>0)masked.add(i);
  this.scenery=yield*buildScenerySteps(this,world,assets.tiles,masked);
  const animated=world.layers&&[3,5].some(l=>world.layers[l].some((id,i)=>id&&id!==world.layers[l-1][i]));
  for(let phase=0;phase<(animated?2:1);phase++){const groups=new Map();
   for(let y=0;y<world.height;y++){for(let x=0;x<world.width;x++){const i=y*world.width+x;if(world.layers&&!world.layers.some(l=>l[i]))continue;let layers=world.layers?[0,1,...(masked.has(i)?[]:[phase&&world.layers[3][i]?3:2,phase&&world.layers[5][i]?5:4])].filter(l=>!this.scenery.removed.has((l===3?2:l===5?4:l)+':'+i)):[];
    const ids=layers.map(l=>world.layers[l][i]);if(world.layers){const ground=require('./floor-underlay').floorUnderlay(world,x,y,this.scenery.removed,this.artAnalysis);if(ground)ids.unshift(ground);}
    if(!world.layers){const color=world.tiles[i]===2?[.208,.4,.494,1]:world.tiles[i]===1?[.675,.584,.404,1]:(x+y)%2?[.259,.388,.235,1]:[.275,.408,.251,1];quad(groups,{page:this.whitePage,uv:[0,0,1,1]},[[x,0,y+1],[x+1,0,y+1],[x+1,0,y],[x,0,y]],color);}
    for(let n=0;n<ids.length;n++){const id=ids[n];if(!id)continue;const p=require('./scenery-profiles').profileAt(world,x,y,id),e=n*.001+(p.kind==='ceiling'?(p.offsetY??2.5):0);quad(groups,this.tileAtlas.tile(id),[[x,this.terrain.vertex(x,y+1)+e,y+1],[x+1,this.terrain.vertex(x+1,y+1)+e,y+1],[x+1,this.terrain.vertex(x+1,y)+e,y],[x,this.terrain.vertex(x,y)+e,y]]);}
   }yield;}this.frames.push(yield*this.uploadSteps(groups));
  }if(!animated)this.frames.push(this.frames[0]);
  const solid=new Map();for(let y=0;y<world.height;y++){for(let x=0;x<world.width;x++){const i=y*world.width+x,h=this.terrain.walls[i];if(!h)continue;const base=this.terrain.at(x+.5,y+.5),tile=this.tileAtlas.tile(this.terrain.wallTiles[i]||world.layers?.[2]?.[i]||world.layers?.[0]?.[i]||33);this.box(solid,x,y,1,1,base,h,tile);}yield;}this.wallMeshes=yield*this.uploadSteps(solid);return this;
 }
 activate(stage,key){this.cache.delete(key);this.cache.set(key,stage);for(const name of ['world','terrain','frames','wallMeshes','scenery','materials','meshes','inspectionObjects'])this[name]=stage[name];this.offset={x:0,y:0};this.hideOld=false;while(this.cache.size>3){const oldest=this.cache.keys().next().value;this.release(this.cache.get(oldest));this.cache.delete(oldest);}}
 prepare(world,assets,settings={}){
  if(!Object.values(assets).every(i=>i.complete&&i.naturalWidth))return false;
  if(!this.tileAtlas){this.tileAtlas=new Atlas(this.gl,assets.tiles);this.spriteAtlas=new Atlas(this.gl,assets.sprites);this.objectAtlas=new Atlas(this.gl,assets.objects);this.atlases=[this.tileAtlas,this.spriteAtlas,this.objectAtlas];this.artAnalysis=readArt(assets.tiles);}
  if(world!==this.requestWorld||!!settings.inspection!==this.inspectGeometry){this.inspectGeometry=!!settings.inspection;
   if(this.pending){this.pending.steps.return();this.release(this.pending.stage);this.pending=null;this.diagnostics.cancelled++;}
   this.requestWorld=world;const coordinateRevision=world.viewRevision??world;if(coordinateRevision!==this.coordinateRevision){this.offset.x+=world.shiftX||0;this.offset.y+=world.shiftY||0;this.coordinateRevision=coordinateRevision;}
   const key=JSON.stringify([world.width,world.height,world.layers||world.tiles,world.scene3d||null,world.visual3d||null,world.blocked||world.tiles,this.inspectGeometry]);
   if(this.cache.has(key)){this.diagnostics.cacheHits++;this.activate(this.cache.get(key),key);return true;}
   const stage=Object.assign(Object.create(Scene3D.prototype),{gl:this.gl,bufferCache:this.bufferCache,sharedMaterials:this.sharedMaterials,world,meshes:[],frames:[],tileAtlas:this.tileAtlas,whitePage:this.whitePage,artAnalysis:this.artAnalysis,inspectGeometry:this.inspectGeometry,inspectionObjects:[],geometry:{Atlas,quad},templates:this.templates,templateBytes:this.templateBytes,diagnostics:this.diagnostics});this.pending={stage,key,steps:stage.buildWorld(world,assets)};this.hideOld=!!world.teleport;this.diagnostics.builds++;
  }
  if(this.pending){const budget=settings.progressive&&this.world?4:Infinity,deadline=performance.now()+budget;let r;do{r=this.pending.steps.next();if(r.done){const {stage,key}=this.pending;this.pending=null;this.activate(stage,key);break;}}while(performance.now()<deadline);}
  return !!this.world&&!this.hideOld;
 }
 box(groups,x,z,w,d,base,height,tile,alpha=1){const top=base+height;
  quad(groups,tile,[[x,base,z+d],[x+w,base,z+d],[x+w,top,z+d],[x,top,z+d]],[.8,.82,.88,alpha]);
  quad(groups,tile,[[x+w,base,z],[x,base,z],[x,top,z],[x+w,top,z]],[.67,.7,.76,alpha]);
  quad(groups,tile,[[x,base,z],[x,base,z+d],[x,top,z+d],[x,top,z]],[.63,.67,.75,alpha]);
  quad(groups,tile,[[x+w,base,z+d],[x+w,base,z],[x+w,top,z],[x+w,top,z+d]],[.9,.91,.94,alpha]);
  quad(groups,tile,[[x,top,z+d],[x+w,top,z+d],[x+w,top,z],[x,top,z]],[1,1,1,alpha]);
 }
 house(groups,s,opacity){const x=s.x,z=s.y,base=this.terrain.at(x+s.w/2,z+s.d/2),h=base+s.height,mid=z+s.d/2,peak=h+s.roofHeight;
  const material=(kind,id)=>this.materials.atlas.tile(this.materials.ids.get(kind+':'+(kind==='roof'?s.roofTiles[0]:id)));
  for(let col=0;col<s.w;col++){const wall=material('wall',s.wallTiles[col]),roof=material('roof',s.roofTiles[col]);quad(groups,wall,[[x+col,base,z+s.d],[x+col+1,base,z+s.d],[x+col+1,h,z+s.d],[x+col,h,z+s.d]],[.92,.92,.96,opacity]);quad(groups,this.tileAtlas.tile(s.wallTiles[col]),[[x+col,base,z+s.d+.005],[x+col+1,base,z+s.d+.005],[x+col+1,h,z+s.d+.005],[x+col,h,z+s.d+.005]],[.92,.92,.96,opacity]);quad(groups,wall,[[x+col+1,base,z],[x+col,base,z],[x+col,h,z],[x+col+1,h,z]],[.62,.66,.74,opacity]);quad(groups,roof,[[x+col,h,z+s.d],[x+col+1,h,z+s.d],[x+col+1,peak,mid],[x+col,peak,mid]],[1,1,1,opacity]);quad(groups,roof,[[x+col,peak,mid],[x+col+1,peak,mid],[x+col+1,h,z],[x+col,h,z]],[.77,.8,.89,opacity]);}
  for(const [xx,light]of [[x,.7],[x+s.w,.85]]){const tile=material('wall',s.wallTiles[xx===x?0:s.w-1]);quad(groups,tile,[[xx,base,z],[xx,base,z+s.d],[xx,h,z+s.d],[xx,h,z]],[light,light,light,opacity]);quad(groups,tile,[[xx,h,z+s.d],[xx,h,z],[xx,peak,mid],[xx,peak,mid]],[light,light,light,opacity]);}
 }
 bind(buffer){const gl=this.gl;gl.bindBuffer(gl.ARRAY_BUFFER,buffer);for(let i=0;i<3;i++)gl.enableVertexAttribArray(this.attrs[i]);gl.vertexAttribPointer(this.attrs[0],3,gl.FLOAT,false,36,0);gl.vertexAttribPointer(this.attrs[1],2,gl.FLOAT,false,36,12);gl.vertexAttribPointer(this.attrs[2],4,gl.FLOAT,false,36,20);}
 drawMeshes(meshes){const gl=this.gl;for(const mesh of meshes){gl.bindTexture(gl.TEXTURE_2D,mesh.page.texture);this.bind(mesh.buffer);gl.drawArrays(gl.TRIANGLES,0,mesh.count);this.stats.drawCalls++;this.stats.triangles+=mesh.count/3;}}
 drawGroups(groups,shadow=false){const gl=this.gl;gl.uniform1f(this.uniforms.uShadow,shadow?1:0);for(const [page,data]of groups){gl.bindBuffer(gl.ARRAY_BUFFER,this.dynamic);gl.bufferData(gl.ARRAY_BUFFER,new Float32Array(data),gl.DYNAMIC_DRAW);this.drawMeshes([{page,buffer:this.dynamic,count:data.length/9}]);}gl.uniform1f(this.uniforms.uShadow,0);}
 render(world,actors,drops,assets,camera,width,height,zoom,now,settings={}){
  if(this.lost)throw Error('The 3D graphics context was lost.');if(!this.prepare(world,assets,settings))return null;
  const gl=this.gl,quality=Math.max(.5,Math.min(1,settings.sceneQuality||1)),dpr=Math.min(2,window.devicePixelRatio||1)*quality,rw=Math.max(1,Math.round(width*dpr)),rh=Math.max(1,Math.round(height*dpr));if(this.canvas.width!==rw||this.canvas.height!==rh){this.canvas.width=rw;this.canvas.height=rh;}
  const ox=this.offset.x,oz=this.offset.y,cx=camera.x-ox+.5,cz=camera.y-oz+.5,cy=this.terrain.at(cx,cz),pose=projection(cx,cy,cz,width,height,zoom*1.35,settings.inspection?Math.max(5,Math.min(90,settings.cameraTilt||55)):Camera.tilt(settings.cameraTilt),settings.inspection?settings.cameraYaw||0:0);this.pose=pose;gl.viewport(0,0,rw,rh);gl.clearColor(.07,.14,.18,1);gl.clear(gl.COLOR_BUFFER_BIT|gl.DEPTH_BUFFER_BIT);gl.useProgram(this.program);gl.enable(gl.DEPTH_TEST);gl.depthFunc(gl.LEQUAL);gl.enable(gl.BLEND);gl.blendFunc(gl.SRC_ALPHA,gl.ONE_MINUS_SRC_ALPHA);settings.inspection&&settings.cullFaces?gl.enable(gl.CULL_FACE):gl.disable(gl.CULL_FACE);gl.depthMask(true);
  const phase=Math.floor(now/400)%2;gl.uniform2f(this.uniforms.uYaw,pose.yc,pose.ys);gl.uniform3f(this.uniforms.uCamera,cx,cy,cz);gl.uniform2f(this.uniforms.uViewport,width,height);gl.uniform2f(this.uniforms.uAngle,pose.sin,pose.cos);gl.uniform1f(this.uniforms.uDistance,pose.distance);gl.uniform1f(this.uniforms.uFocal,pose.focal);gl.uniform1i(this.uniforms.uTexture,0);gl.uniform1f(this.uniforms.uShadow,0);gl.uniform1f(this.uniforms.uScenery,0);gl.uniform1f(this.uniforms.uCutaway,settings.cutaway!==false?1:0);gl.uniform3f(this.uniforms.uPlayer,cx,cy,cz);this.stats={drawCalls:0,triangles:0,scenery:this.scenery.groups.length};this.drawMeshes(this.frames[phase]);this.drawMeshes(this.wallMeshes);gl.uniform1f(this.uniforms.uScenery,1);if(settings.inspection&&(settings.hideRoofs||settings.hideWalls))this.drawGroups(require('./scene-inspector').filteredGeometry(this.inspectionObjects||[],settings));else this.drawMeshes(this.scenery.frames[phase]);gl.uniform1f(this.uniforms.uScenery,0);
  const buildings=new Map(),faded=new Map();for(const s of this.terrain.structures){const conceal=settings.cutaway!==false&&cx>=s.x&&cx<=s.x+s.w&&cz>=s.y&&cz<s.y+s.d-.1;this.house(conceal?faded:buildings,s,conceal?.25:1);}this.drawGroups(buildings);
  const items=new Map();for(const d of drops){const tile=this.objectAtlas.tile(d.picture);if(!tile)continue;const x=d.x-ox+.5,z=d.y-oz+.5;quad(items,tile,[[x-.35,this.terrain.at(x-.35,z+.3)+.025,z+.3],[x+.35,this.terrain.at(x+.35,z+.3)+.025,z+.3],[x+.35,this.terrain.at(x+.35,z-.3)+.025,z-.3],[x-.35,this.terrain.at(x-.35,z-.3)+.025,z-.3]]);}this.drawGroups(items);
  const shadows=new Map(),characters=new Map();this.anchors.clear();for(const p of actors){const x=p.rx-ox+.5,z=p.ry-oz+.5,y=this.terrain.at(x,z)+(p.monster&&[0,1,2,4].some(l=>world.layers?.[l]?.[Math.floor(p.ry)*world.width+Math.floor(p.rx)]===148)?.31:0),point=pose.project(x,z,y);if(!point||point.x< -100||point.x>width+100||point.y< -100||point.y>height+100)continue;quad(shadows,{page:this.whitePage,uv:[0,0,1,1]},[[x-.3,this.terrain.at(x-.3,z+.18)+.02,z+.18],[x+.3,this.terrain.at(x+.3,z+.18)+.02,z+.18],[x+.3,this.terrain.at(x+.3,z-.18)+.02,z-.18],[x-.3,this.terrain.at(x-.3,z-.18)+.02,z-.18]]);
   const walking=now-p.time<world.stepMs&&(p.x!==p.fx||p.y!==p.fy),tile=this.spriteAtlas.tile(this.appearances.frameId(p.sprite||1,p.dir*3+(walking?Math.floor(now/120)%2:0))),size=1.05,upY=pose.cos*size,upZ=-pose.sin*size;quad(characters,tile,[[x-size/2*pose.yc,y,z+size/2*pose.ys],[x+size/2*pose.yc,y,z-size/2*pose.ys],[x+size/2*pose.yc+upZ*pose.ys,y+upY,z-size/2*pose.ys+upZ*pose.yc],[x-size/2*pose.yc+upZ*pose.ys,y+upY,z+size/2*pose.ys+upZ*pose.yc]],[1,1,1,p.hp===0?.4:1]);this.anchors.set(p.id,{...point,size:point.scale*size});
  }
  gl.depthMask(false);this.drawGroups(shadows,true);gl.depthMask(true);this.drawGroups(characters);gl.depthMask(false);this.drawGroups(faded);if(settings.cutaway!==false){gl.uniform1f(this.uniforms.uScenery,2);this.drawMeshes(this.scenery.frames[phase]);gl.uniform1f(this.uniforms.uScenery,0);}gl.depthMask(true);gl.flush();
  const project=(x,z)=>pose.project(x-ox,z-oz,this.terrain.at(x-ox,z-oz));project.origin=pose.project(cx,cz,cy);return {canvas:this.canvas,project,anchors:this.anchors,stats:{...this.stats},heightAt:(x,z)=>this.terrain.at(x-ox,z-oz)};
 }
 dispose(){this.clearWorld();this.bufferCache.clear();if(this.sharedMaterials.texture)this.gl.deleteTexture(this.sharedMaterials.texture);this.sharedMaterials.roofs.clear();this.templates.clear();this.templateBytes.value=0;for(const a of this.atlases)a.dispose();const gl=this.gl;gl.deleteTexture(this.white);gl.deleteBuffer(this.dynamic);gl.deleteProgram(this.program);this.canvas.removeEventListener('webglcontextlost',this.onLost);gl.getExtension('WEBGL_lose_context')?.loseContext();this.world=null;}
}
module.exports={Scene3D,projection,makeTerrain};
