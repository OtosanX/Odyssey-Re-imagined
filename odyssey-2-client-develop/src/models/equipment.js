'use strict';
const slots=[{id:1,name:'Weapon',types:[1]},{id:2,name:'Shield',types:[2]},{id:3,name:'Armor',types:[3]},{id:4,name:'Helmet',types:[4]},{id:5,name:'Ring',types:[8]},{id:6,name:'Ranged weapon',types:[10]}];
function slotFor(type){return slots.find(s=>s.types.includes(type))?.id||0;}
function normalize(player,items){const next={};for(const index of Object.values(player.equipment||{})){if(!Number.isInteger(index)||index<0||index>=20)continue;const slot=slotFor(items[player.inventory?.[index]?.item]?.type);if(slot){if(slot===1)delete next[6];if(slot===6)delete next[1];next[slot]=index;}}player.equipment=next;return next;}
module.exports={slots,slotFor,normalize};
