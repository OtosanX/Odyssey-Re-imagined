'use strict';
const {publicIP}=require('./temporary-port.cjs');
function encode({host,port},code){if(!publicIP(host)||!Number.isInteger(port)||port<1024||port>65535||!/^[A-Z2-9]{8}$/.test(code))throw Error('Invalid invitation.');const bytes=Buffer.alloc(14);host.split('.').forEach((v,i)=>bytes[i]=+v);bytes.writeUInt16BE(port,4);bytes.write(code,6,'ascii');return 'ODY1-'+bytes.toString('base64url');}
function decode(text){if(typeof text!=='string'||!/^ODY1-[A-Za-z0-9_-]{19}$/.test(text.trim()))throw Error('Paste the full ODY1 invitation from your friend.');const bytes=Buffer.from(text.trim().slice(5),'base64url');if(bytes.length!==14)throw Error('Invalid invitation.');const value={host:[...bytes.subarray(0,4)].join('.'),port:bytes.readUInt16BE(4),storyCode:bytes.subarray(6).toString('ascii')};if(encode(value,value.storyCode)!==text.trim())throw Error('Invalid invitation.');return value;}
module.exports={encode,decode};
