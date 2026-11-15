'use strict';
class MapChunks{
 constructor(){this.revision=0;this.parts=[];this.count=0;}
 add(p){
  if(!Number.isSafeInteger(p.revision)||p.revision<this.revision||!Number.isInteger(p.count)||p.count<1||p.count>128||!Number.isInteger(p.index)||p.index<0||p.index>=p.count||typeof p.chunk!=='string'||p.chunk.length>16000)return null;
  if(p.revision>this.revision){this.revision=p.revision;this.parts=[];this.count=p.count;}
  if(this.count!==p.count)return null;this.parts[p.index]=p.chunk;
  if(this.parts.filter(v=>typeof v==='string').length!==this.count)return null;
  const result=Buffer.from(this.parts.join(''),'base64');this.parts=[];return result;
 }
}
module.exports={MapChunks};
