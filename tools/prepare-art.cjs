const fs=require('fs'),path=require('path'),zlib=require('zlib');
function crc(b){let c=0xffffffff;for(const v of b){c^=v;for(let k=0;k<8;k++)c=(c>>>1)^((c&1)?0xedb88320:0);}return (c^0xffffffff)>>>0;}
function chunk(name,data){const t=Buffer.from(name),b=Buffer.alloc(data.length+12);b.writeUInt32BE(data.length);t.copy(b,4);data.copy(b,8);b.writeUInt32BE(crc(Buffer.concat([t,data])),8+data.length);return b;}
function png(w,h,p){const header=Buffer.alloc(13);header.writeUInt32BE(w);header.writeUInt32BE(h,4);header[8]=8;header[9]=6;const raw=Buffer.alloc((w*4+1)*h);for(let y=0;y<h;y++)p.copy(raw,y*(w*4+1)+1,y*w*4,(y+1)*w*4);return Buffer.concat([Buffer.from('89504e470d0a1a0a','hex'),chunk('IHDR',header),chunk('IDAT',zlib.deflateSync(raw)),chunk('IEND',Buffer.alloc(0))]);}
const source=path.join(__dirname,'../archive/codemallet_classic_client_A201_src/The Odyssey Online Classic');
for(const name of ['tiles','sprites','objects']){
 const b=fs.readFileSync(path.join(source,name+'.rsc.nodist')),w=b.readInt32LE(18),h=b.readInt32LE(22),off=b.readUInt32LE(10),stride=Math.ceil(w*3/4)*4;
 if(b.toString('ascii',0,2)!=='BM'||b.readUInt16LE(28)!==24||b.readUInt32LE(30)!==0)throw Error('Unsupported bitmap');
 const cols=w/32,count=cols*(h/32),outW=1024,outH=Math.ceil(count/32)*32,p=Buffer.alloc(outW*outH*4);
 for(let t=0;t<count;t++)for(let y=0;y<32;y++)for(let x=0;x<32;x++){
 const s=off+(h-1-(Math.floor(t/cols)*32+y))*stride+((t%cols)*32+x)*3,d=((Math.floor(t/32)*32+y)*outW+(t%32)*32+x)*4;
 p[d]=b[s+2];p[d+1]=b[s+1];p[d+2]=b[s];p[d+3]=(b[s]===0&&b[s+1]===0&&b[s+2]===0)?0:255;
 }
 fs.writeFileSync(path.join(__dirname,'../client/src/assets',name+'.png'),png(outW,outH,p));console.log(name,count,outW,outH);
 if(name==='tiles')fs.writeFileSync(path.join(__dirname,'../client/src/assets/tiles-preview.png'),png(outW,320,p.subarray(0,outW*320*4)));
}

