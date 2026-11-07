'use strict';
const policy=require('./camera-policy');
function clamp(value,min,max,fallback){return Math.max(min,Math.min(max,Number.isFinite(value)?value:fallback));}
function tilt(value){return clamp(value,policy.minTilt,policy.maxTilt,policy.defaultTilt);}
function zoom(value){return clamp(value,policy.minZoom,policy.maxZoom,policy.defaultZoom);}
function validate(p){if(!['defaultTilt','minTilt','maxTilt','defaultZoom','minZoom','maxZoom'].every(k=>Number.isFinite(p[k])))throw Error('Camera limits must be numbers.');if(p.minTilt<5||p.maxTilt>85||p.minTilt>p.defaultTilt||p.defaultTilt>p.maxTilt||p.minZoom<8||p.maxZoom>96||p.minZoom>p.defaultZoom||p.defaultZoom>p.maxZoom)throw Error('Default must be inside the limits; supported tilt is 5–85°, zoom 8–96.');return p;}
module.exports={policy,tilt,zoom,validate};
