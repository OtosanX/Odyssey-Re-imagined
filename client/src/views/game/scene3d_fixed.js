'use strict';
const GeometryCache=require('./geometry-cache');
const {shader,VERT,FRAG}=require('./shaders');
const {load:loadAtlas} = require('./atlas');
const {load:loadAppearances} = require('./appearances');

class Scene3D{
  constructor(){
    // Load appearances data early to ensure it's available for rendering
    this.appearances = require('./appearances');
    if (this.appearances.load) {
      // Start loading appearances data, but don't block constructor
      this.appearances.load().catch(err => {
        console.warn('Failed to load appearances for 3D mode:', err);
      });
    }
    this.canvas=document.createElement('canvas');
    const gl=this.canvas.getContext('webgl',{alpha:false,antialias:false,depth:true,preserveDrawingBuffer:true});
    if(!gl)throw Error('WebGL is unavailable on this device.');
    this.gl=gl;
    this.bufferCache=new GeometryCache(gl);
    this.lost=false;
    this.onLost=e=>{e.preventDefault();this.lost=true;};
    this.canvas.addEventListener('webglcontextlost',this.onLost);
    const vs=shader(gl,gl.VERTEX_SHADER,VERT),fs=shader(gl,gl.FRAGMENT_SHADER,FRAG),p=gl.createProgram();
    gl.attachShader(p,vs);gl.attachShader(p,fs);gl.linkProgram(p);gl.deleteShader(vs);gl.deleteShader(fs);
    if(!gl.getProgramParameter(p,gl.LINK_STATUS))throw Error(gl.getProgramInfoLog(p));
    this.program=p;
    this.attrs=['aPosition','aUV','aColor'].map(n=>gl.getAttribLocation(p,n));
    this.uniforms=Object.fromEntries(['uYaw','uCamera','uViewport','uAngle','uDistance','uFocal','uTexture','uShadow','uScenery','uCutaway','uPlayer'].map(n=>[n,gl.getUniformLocation(p,n)]));
    this.dynamic=gl.createBuffer();
    this.meshes=[];
    this.atlases=[];
    this.world=null;
    this.frames=[];
    this.anchors=new Map();
  }
  
  // ... rest of the Scene3D class implementation would go here
}

module.exports=Scene3D;