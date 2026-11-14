'use strict';
const fs=require('fs'),path=require('path');
// Keep existing offline/community saves at their original location. Newly
// created worlds use the cleaned layout; no automatic save migration occurs.
function worldData(workspace){
 const current=path.join(workspace,'server','data');
 const legacy=path.join(workspace,'odyssey-2-server-develop','data');
 return fs.existsSync(current)?current:fs.existsSync(legacy)?legacy:current;
}
module.exports={worldData};
