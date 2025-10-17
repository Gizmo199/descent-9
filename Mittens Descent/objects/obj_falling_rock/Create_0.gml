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
explosion = sp_explosion_small;
if ( sprite_index != sp_hazard_rock_large ) exit;

explosion = sp_explosion_large;
var _total = 1;
var _number = instance_number(object_index) - 1;
var _wave = 0;
with ( Spawner ) _wave = wave;
if ( _wave > 1 ) _total = 2;
if ( _wave > 3 ) _total = 3;
if ( _wave == global.settings.wave-1 ) _total = 10;
if ( _number >= _total ) 
{
	instance_destroy();
	exit;
}

super_on_collision = on_collision;
on_collision = function(_instance){
	with ( component_get(Component.Duck, Player) ) 	
	{
		if ( ducking ) return;
	}
	super_on_collision(_instance);
}

// Make sure rocks cannot spawn on top of one another
while ( place_meeting(x, y, object_index) )
{
	x++;
	if ( x > room_width ) x = 0;
}