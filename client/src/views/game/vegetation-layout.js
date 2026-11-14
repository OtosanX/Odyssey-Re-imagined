'use strict';
// A layer cell is not a tree. It can contain one tree's trunk and a different
// tree's canopy. Match each piece to its documented position in the source art.
function addVegetation(instances,catalog,art,x,y,part){
 const entry=catalog[part.id||part.alternate],piece=entry.pieces?.[part.id||part.alternate]||[0,0],ox=x-piece[0],oy=y-piece[1],key=(entry.pieces?entry.family:entry.family+':'+(part.id||part.alternate))+':'+ox+':'+oy;
 let tree=instances.get(key);if(!tree){tree={kind:'plant',profile:entry,origin:{x:ox,y:oy},cells:[]};instances.set(key,tree);}
 let cell=tree.cells.find(c=>c.x===x&&c.y===y);if(!cell){cell={x,y,kind:'plant',profile:entry,parts:[],pixels:new Uint8Array(1024)};tree.cells.push(cell);}
 // Duplicate drawing layers can repeat the same piece. Keep the upper copy.
 const duplicate=cell.parts.findIndex(p=>p.id===part.id&&p.alternate===part.alternate);if(duplicate>=0)cell.parts.splice(duplicate,1);cell.parts.push(part);
 for(const id of [part.id,part.alternate])if(id){const alpha=art(id).alpha;for(let n=0;n<1024;n++)cell.pixels[n]|=alpha[n];}
}
function finishVegetation(tree,world){
 const cells=tree.cells,x=Math.min(...cells.map(c=>c.x)),y=Math.min(...cells.map(c=>c.y)),width=Math.max(...cells.map(c=>c.x))+1-x,height=Math.max(...cells.map(c=>c.y))+1-y;let bottom=0;
 for(const c of cells)for(let n=0;n<1024;n++)if(c.pixels[n])bottom=Math.max(bottom,(c.y-y)*32+Math.floor(n/32)+1);
 const rootRow=Math.max(...cells.map(c=>c.y)),roots=cells.filter(c=>c.y===rootRow),blocked=c=>world.blocked?!!world.blocked[c.y*world.width+c.x]:world.tiles?.[c.y*world.width+c.x]===2,footprints=roots.filter(blocked),root=footprints[Math.floor(footprints.length/2)]||roots[Math.floor(roots.length/2)];
 // Collision determines the ground footprint, not how tall the artwork is.
 // Canopies may overhang walkable cells; never move them to an unrelated wall.
 const anchor={x:root.x+.5,z:root.y+.5,cellX:root.x,cellY:root.y,blocked:blocked(root),source:footprints.length?'blocked trunk cell':'original root cell'};
 return {...tree,x,y,width,height,bottom,depth:tree.profile.depth||.12,anchor};
}
module.exports={addVegetation,finishVegetation};
