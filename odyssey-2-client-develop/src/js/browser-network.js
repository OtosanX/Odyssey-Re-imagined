// Minimal byte and event helpers shared by the browser UI; no desktop APIs.
class Bytes extends Uint8Array{static from(value,encoding){if(typeof value==='string'){if(encoding==='base64')return new Bytes(Uint8Array.from(atob(value),c=>c.charCodeAt(0)));return new Bytes(new TextEncoder().encode(value));}return new Bytes(value);}static alloc(n){return new Bytes(n);}static byteLength(text){return new TextEncoder().encode(text).length;}toString(encoding){if(encoding==='base64'){let s='';for(const b of this)s+=String.fromCharCode(b);return btoa(s);}return new TextDecoder().decode(this);}readUInt8(i){return this[i];}}
window.Buffer=Bytes;
class BrowserNetwork{
 constructor(url){this.url=url;this.listeners=new Map();}
 on(name,fn){const list=this.listeners.get(name)||[];list.push(fn);this.listeners.set(name,list);return this;}
 once(name,fn){const once=(...args)=>{this.removeListener(name,once);fn(...args);};return this.on(name,once);}
 removeListener(name,fn){this.listeners.set(name,(this.listeners.get(name)||[]).filter(f=>f!==fn));return this;}
 emit(name,...args){for(const fn of [...(this.listeners.get(name)||[])])fn(...args);}
 connect(){return new Promise((resolve,reject)=>{this.socket=new WebSocket(this.url);this.socket.onopen=resolve;this.socket.onerror=()=>reject(Error('Server unavailable'));this.socket.onclose=()=>{this.worldError='Disconnected. Reload to reconnect.';this.emit('status',this.worldError);};this.socket.onmessage=e=>{try{const msg=JSON.parse(e.data);msg.data=Bytes.from(msg.data,'base64');this.emit('message',msg);}catch(error){console.error(error);}};});}
 send(system,id,data){if(this.socket.readyState!==WebSocket.OPEN)return;this.socket.send(JSON.stringify({system,id,data:Bytes.from(data).toString('base64')}));}
}
