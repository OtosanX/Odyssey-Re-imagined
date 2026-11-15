'use strict';
const fs=require('fs'),path=require('path'),{validateVisual}=require('../visual-format.cjs');
function loadProfiles(folder){const file=path.join(folder,'visual-world.json');if(!fs.existsSync(file))return {};const data=JSON.parse(fs.readFileSync(file,'utf8'));if(data.version!==1||!data.maps)throw Error('Invalid visual-world.json version.');return data.maps;}
function attachVisuals(maps,folder){const profiles=loadProfiles(folder);for(const [id,m]of Object.entries(maps)){const v=m.visual3d??profiles[id];validateVisual(v,m.width,m.height);if(v)m.visual3d=v;}}
function collectVisuals(maps,placements,offset=12){const out={version:1,segments:[]};for(const r of placements){const m=maps[r.id];if(m?.visual3d)out.segments.push({...m.visual3d,map:r.id,x:r.x+offset,y:r.y+offset,width:m.width,height:m.height});}return out.segments.length?out:undefined;}
module.exports={loadProfiles,attachVisuals,collectVisuals};
