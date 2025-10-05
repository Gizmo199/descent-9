// Inherit the parent event
event_inherited();
hsp = 0;
vsp = 0;
grv = 0.3;
res = 0.5;
wait = 10;
life = 1;
wiggle = 1;
intro = true;
blink = false;
blink_time_reset = 3;
blink_time = blink_time_reset;


var _this = id;
with ( Player ) 
{
	_this.x = x;
	_this.y = -_this.sprite_height;
}

if ( sprite_index != sp_hazard_rock_large ) exit;
var _this = id;
with ( HazardRock ) 
{
	if ( id == _this ) continue;
	if ( sprite_index == sp_hazard_rock_large ) instance_destroy(other);
}