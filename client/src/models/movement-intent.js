// Shared intent filter for keyboard, controller and touch directions.
class MovementIntent{
 constructor(delay=110){this.delay=delay;this.active=-1;this.since=0;this.walking=false;}
 update(direction,now){if(direction<0){this.active=-1;this.walking=false;return {turn:-1,ready:false};}let turn=-1;if(direction!==this.active){turn=direction;this.active=direction;this.since=now;}return {turn,ready:this.walking||now-this.since>=this.delay};}
 moved(){this.walking=true;}
 reset(){this.active=-1;this.walking=false;}
}
module.exports={MovementIntent};
