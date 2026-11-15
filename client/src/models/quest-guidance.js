'use strict';
// Hardcore guidance is opt-in and never inherits Normal-mode preferences.
function key(stats,feature){return stats.difficulty==='hardcore'?'hardcore'+feature[0].toUpperCase()+feature.slice(1):feature;}
function enabled(settings,stats,feature){const value=settings[key(stats,feature)];return value==null?stats.difficulty!=='hardcore'&&stats.mode==='story':value===true;}
module.exports={key,enabled};
