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

var _total = 1;
var _number = instance_number(object_index) - 1;
var _wave = 0;
with ( Spawner ) _wave = wave;
if ( _wave > 3 ) _total = 2;
if ( _wave > 6 ) _total = 3;
if ( _number >= _total ) 
{
	instance_destroy();
	with ( Spawner ) alarm[0] = 1;
}

super_on_collision = on_collision;
on_collision = function(_instance){
	with ( component_get(Component.Duck, Player) ) 	
	{
		if ( ducking ) return;
	}
	super_on_collision(_instance);
}