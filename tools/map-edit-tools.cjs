'use strict';
const {validateMap}=require('../map-format.cjs');
const clone=m=>JSON.parse(JSON.stringify(m));
function rect(a,b){return {x:Math.min(a.x,b.x),y:Math.min(a.y,b.y),w:Math.abs(a.x-b.x)+1,h:Math.abs(a.y-b.y)+1};}
function line(a,b){const points=[],dx=Math.abs(b.x-a.x),dy=-Math.abs(b.y-a.y),sx=a.x<b.x?1:-1,sy=a.y<b.y?1:-1;let x=a.x,y=a.y,err=dx+dy;while(true){points.push({x,y});if(x===b.x&&y===b.y)break;const e=err*2;if(e>=dy){err+=dy;x+=sx;}if(e<=dx){err+=dx;y+=sy;}}return points;}
function write(map,p,layer,value){if(p.x<0||p.y<0||p.x>=map.width||p.y>=map.height)throw Error('The edit extends outside this map.');const i=p.y*map.width+p.x;
 if(layer==='collision'){if(value&&map.anchors.some(a=>a.x===p.x&&a.y===p.y))throw Error('Move the anchor before blocking its tile.');map.blocked[i]=value?1:0;}
 else {if(!/^[0-5]$/.test(String(layer)))throw Error('This tool requires a graphical or collision layer.');if(!Number.isInteger(value)||value<0||value>6979)throw Error('Invalid tile ID.');map.layers[+layer][i]=value;}
}
function apply(source,tool,a,b,layer,value){const map=clone(source);let points;
 if(tool==='fill'){const data=layer==='collision'?map.blocked:map.layers[+layer];if(!data)throw Error('Fill requires a graphical or collision layer.');const old=data[a.y*map.width+a.x],seen=new Set(),queue=[a];points=[];for(let n=0;n<queue.length;n++){const p=queue[n],i=p.y*map.width+p.x;if(p.x<0||p.y<0||p.x>=map.width||p.y>=map.height||seen.has(i)||data[i]!==old)continue;seen.add(i);points.push(p);for(const [dx,dy]of [[0,1],[0,-1],[1,0],[-1,0]])queue.push({x:p.x+dx,y:p.y+dy});}}
 else if(tool==='rectangle'){const r=rect(a,b);points=[];for(let y=r.y;y<r.y+r.h;y++)for(let x=r.x;x<r.x+r.w;x++)points.push({x,y});}
 else points=line(a,b);
 for(const p of points)write(map,p,layer,tool==='erase'?0:value);return validateMap(map);
}
function copy(map,region){const cells=[];for(let y=0;y<region.h;y++)for(let x=0;x<region.w;x++){const sx=region.x+x,sy=region.y+y;if(sx<0||sy<0||sx>=map.width||sy>=map.height)throw Error('Selection extends outside map.');const i=sy*map.width+sx;cells.push({x,y,layers:map.layers.map(l=>l[i]),blocked:map.blocked[i]});}return {width:region.w,height:region.h,cells};}
function paste(source,clip,at,{collision=false,erase=null}={}){const map=clone(source);if(erase)for(const c of erase)for(const p of c.parts)write(map,c,p.layer,0);
 for(const c of clip.cells){const p={x:at.x+c.x,y:at.y+c.y};for(let l=0;l<6;l++)if(c.layers[l]!==null)write(map,p,l,c.layers[l]);if(collision)write(map,p,'collision',c.blocked);}return validateMap(map);
}
module.exports={rect,line,apply,copy,paste};
