const fs=require('fs'),path=require('path'),zlib=require('zlib');
const root=path.resolve(__dirname,'..'),source=path.join(root,'archive/classic-export'),out=path.join(root,'server/data');
const load=n=>JSON.parse(fs.readFileSync(path.join(source,n+'.json'),'utf8').replace(/^\uFEFF/,''));
const maps={},warnings=[];for(const file of fs.readdirSync(path.join(source,'maps'))){const id=+file.split('.')[0],raw=fs.readFileSync(path.join(source,'maps',file)),b=zlib.inflateSync(raw.subarray(4));if(b.length!==2677)throw Error('Unexpected map size '+id);
 const m={id,version:1,name:b.subarray(0,30).toString('latin1').replace(/\0/g,'').trim()||'Map '+id,width:12,height:12,layers:Array.from({length:6},()=>[]),blocked:[],attrs:[],exits:[b.readUInt16BE(37),b.readUInt16BE(43),b.readUInt16BE(39),b.readUInt16BE(41)],flags:b[53],flags2:b[54],death:{map:b.readUInt16BE(49),x:b[51],y:b[52]},anchors:[],spawnAnchor:'spawn'};
 for(let i=0;i<144;i++){const o=85+i*18;for(let l=0;l<6;l++){const tile=b.readUInt16BE(o+l*2);if(tile>6979){warnings.push({map:id,layer:l,cell:i,tile});m.layers[l].push(0);}else m.layers[l].push(tile);}const a={type:b[o+12],data:Array.from(b.subarray(o+13,o+17)),type2:b[o+17]};m.attrs.push(a);m.blocked.push([1,3,13,14,15,16].includes(a.type)?1:0);}
 const i=m.blocked.findIndex(v=>!v);m.anchors.push({id:'spawn',name:'Map entry',x:i%12,y:Math.floor(i/12)});maps[id]=m;
}
const data=load('Data'),items=load('Objects').map(o=>({id:o.Number,name:o.Name,picture:o.Picture,type:o.Type,data:[o.Data1,o.Data2,o.Data3,o.Data4],level:o.LevelReq,class:o.ClassReq,flags:o.Flags,description:o.Description||''}));
const drops=[];const b=fs.readFileSync(path.join(source,'item-spawns.bin'));for(let o=0;o+13<=b.length;o+=13){const map=b.readUInt16BE(o),item=b.readUInt16BE(o+5);if(maps[map]&&items.some(i=>i.id===item))drops.push({id:'classic-'+o,map,x:b[o+3],y:b[o+4],item,quantity:1,value:b.readUInt32BE(o+7)});}
const starts=Array.from({length:5},(_,i)=>({map:data['StartLocationMap'+i],x:data['StartLocationX'+i],y:data['StartLocationY'+i]}));
const world={version:1,maps,items,drops,start:starts[0],starts};
const target=path.join(out,'classic-world.json');fs.writeFileSync(target+'.tmp',JSON.stringify(world));fs.renameSync(target+'.tmp',target);fs.writeFileSync(path.join(out,'world-mode.json'),JSON.stringify({mode:'classic'}));
fs.writeFileSync(path.join(out,'classic-import-warnings.json'),JSON.stringify(warnings,null,2));console.log(warnings.length+' out-of-range tile references preserved in import report; rendered as empty.');console.log('Recovered '+Object.keys(maps).length+' maps, '+items.length+' items, '+drops.length+' item spawns. Start: '+JSON.stringify(world.start));

