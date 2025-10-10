// Inherit the parent event
event_inherited();

wait = 20;
dest_y = 0;
dest_x = 32;
timer = 1;
intro = true;
with ( Player ) 
{
	other.dest_y = y - 32;
}
if ( dest_y < room_height - sprite_height/1.8 ) dest_y = room_height - sprite_height/1.8;
x = choose(-64, room_width + 64);
y = dest_y;

if ( x > room_width/2 )
{
	image_xscale = -1;
	dest_x = room_width - 32;
}

alpha = 0;
image_speed = 0;
image_index = 0;
if ( instance_number(obj_enemy_death) > 1 ) instance_destroy();