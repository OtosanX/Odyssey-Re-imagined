'use strict';
// Content-addressed vertex buffers let edits replace changed geometry batches
// while retaining identical terrain/structure batches. Pixel/material ownership
// stays on each mesh; the cache contains vertices, never texture references.
class GeometryCache{
 constructor(gl,limit=64*1024*1024){this.gl=gl;this.limit=limit;this.bytes=0;this.entries=new Map();this.hits=0;this.misses=0;}
 acquire(values){const bits=new Uint32Array(values.buffer,values.byteOffset,values.length);let hash=2166136261;for(const word of bits)hash=Math.imul(hash^word,16777619);let key=values.length+':'+(hash>>>0),entry=this.entries.get(key);
  if(entry&&(entry.values.length!==values.length||!entry.values.every((v,i)=>Object.is(v,values[i])))){key+=':'+this.misses;entry=null;} // Verify hash matches, not just the hash.
  if(entry){this.entries.delete(key);this.entries.set(key,entry);entry.refs++;this.hits++;return entry;}
  const gl=this.gl,buffer=gl.createBuffer();gl.bindBuffer(gl.ARRAY_BUFFER,buffer);gl.bufferData(gl.ARRAY_BUFFER,values,gl.STATIC_DRAW);entry={buffer,values,refs:1,cached:true};this.entries.set(key,entry);this.bytes+=values.byteLength;this.misses++;
  while(this.bytes>this.limit&&this.entries.size){const oldest=this.entries.keys().next().value,old=this.entries.get(oldest);this.entries.delete(oldest);this.bytes-=old.values.byteLength;old.cached=false;old.values=null;if(!old.refs)gl.deleteBuffer(old.buffer);}return entry;
 }
 release(entry){if(--entry.refs===0&&!entry.cached)this.gl.deleteBuffer(entry.buffer);}
 clear(){for(const e of this.entries.values()){e.cached=false;e.values=null;if(!e.refs)this.gl.deleteBuffer(e.buffer);}this.entries.clear();this.bytes=0;}
}
module.exports={GeometryCache};
