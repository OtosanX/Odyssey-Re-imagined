'use strict';
const catalog=require('./scenery-catalog'),overrides=require('./scenery-profile-overrides');
function regions(world){return world.scene3d?.segments||(world.visual3d?[{...world.visual3d,x:0,y:0,width:world.width,height:world.height}]:[]);}
function profileAt(world,x,y,id){let p={...catalog[id],...overrides[id]};for(const r of regions(world))if(x>=r.x&&y>=r.y&&x<r.x+r.width&&y<r.y+r.height)p={...p,...r.assetProfiles?.[id]};return p;}
function applyInstance(world,group){for(const r of regions(world))for(const instance of r.instances||[])if(group.cells.some(c=>c.x===r.x+instance.x&&c.y===r.y+instance.y&&c.parts.some(p=>p.id===instance.tile))){group.profile={...group.profile,...instance.profile};return group;}return group;}
function transform(group,geometry,starts){const p=group.profile||{},scale=p.heightScale??1,offset=p.offsetY||0,angle=(p.rotation||0)*Math.PI/180;if(scale===1&&!offset&&!angle)return;const cx=group.anchor?.x??group.x+group.width/2,cz=group.anchor?.z??group.y+group.bottom/32,cos=Math.cos(angle),sin=Math.sin(angle);let base=Infinity;for(const [page,data]of geometry)for(let n=starts.get(page)||0;n<data.length;n+=9)base=Math.min(base,data[n+1]);if(!Number.isFinite(base))return;
 for(const [page,data]of geometry)for(let n=starts.get(page)||0;n<data.length;n+=9){const x=data[n]-cx,z=data[n+2]-cz;data[n]=cx+x*cos-z*sin;data[n+2]=cz+x*sin+z*cos;data[n+1]=base+(data[n+1]-base)*scale+offset;}
}
module.exports={profileAt,applyInstance,transform,overrides};
