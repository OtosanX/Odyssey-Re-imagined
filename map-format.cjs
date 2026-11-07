'use strict';
const {validateVisual}=require('./visual-format.cjs');
function validateMap(m){
 if(!m||m.version!==1||!Number.isInteger(m.width)||!Number.isInteger(m.height)||m.width<12||m.width>40||m.height<12||m.height>30)throw Error('Map dimensions must be 12–40 × 12–30.');
 if(typeof m.name!=='string'||!m.name.trim()||m.name.length>60)throw Error('Map needs a name (1–60 characters).');
 const count=m.width*m.height;
 validateVisual(m.visual3d,m.width,m.height);
 if(m.flags!==undefined&&(!Number.isInteger(m.flags)||m.flags<0||m.flags>255))throw Error('Invalid map flags.');
 if(m.chat!==undefined&&(!m.chat||typeof m.chat!=='object'||!['auto','isolated','silent',undefined].includes(m.chat.local)||(m.chat.group!==undefined&&(typeof m.chat.group!=='string'||m.chat.group.length>60))))throw Error('Invalid local-chat hearing settings.');
 if(m.attrs!==undefined&&(!Array.isArray(m.attrs)||m.attrs.length!==count||!m.attrs.every(a=>a&&Number.isInteger(a.type)&&a.type>=0&&a.type<=255&&Array.isArray(a.data)&&a.data.length===4&&a.data.every(n=>Number.isInteger(n)&&n>=0&&n<=255))))throw Error('Invalid tile attributes.');
 if(!Array.isArray(m.layers)||m.layers.length!==6||!m.layers.every(a=>Array.isArray(a)&&a.length===count&&a.every(n=>Number.isInteger(n)&&n>=0&&n<=6979)))throw Error('Map requires six tile layers with valid tile IDs.');
 if(!Array.isArray(m.blocked)||m.blocked.length!==count||!m.blocked.every(n=>n===0||n===1))throw Error('Invalid collision layer.');
 if(!Array.isArray(m.anchors)||!m.anchors.length||m.anchors.length>100)throw Error('Add at least one anchor (maximum 100).');
 const ids=new Set();for(const a of m.anchors){if(!a||typeof a.id!=='string'||!/^[a-zA-Z0-9_-]{1,40}$/.test(a.id)||ids.has(a.id)||typeof a.name!=='string'||a.name.length<1||a.name.length>60||!Number.isInteger(a.x)||!Number.isInteger(a.y)||a.x<0||a.y<0||a.x>=m.width||a.y>=m.height||m.blocked[a.y*m.width+a.x])throw Error('Anchors need unique IDs, names and walkable positions.');ids.add(a.id);}
 if(!ids.has(m.spawnAnchor))throw Error('Select a starting spawn anchor.');
 if(Buffer.byteLength(JSON.stringify(m))>58000)throw Error('Map is too detailed for the current network packet limit.');
 return m;
}
function newMap(width=36,height=24){return {version:1,name:'Odyssey meadow',width,height,layers:Array.from({length:6},(_,i)=>Array(width*height).fill(i===0?33:0)),blocked:Array(width*height).fill(0),anchors:[{id:'spawn',name:'Starting point',x:Math.floor(width/2),y:Math.floor(height/2)}],spawnAnchor:'spawn'};}
module.exports={validateMap,newMap};
