// Inherit the parent event
event_inherited();

wait = 20;
dest_x = 32;
x = choose(-64, room_width + 64);
if ( x > room_width/2 )
{
	image_xscale = -1;
	dest_x = room_width - 32;
}
x = dest_x;
y = room_height + sprite_height;

timer = 1;
intro = true;

dest_y = 0;
with ( Player ) 
{
	other.dest_y = y - 32;
}
if ( dest_y < room_height - sprite_height/1.8 ) dest_y = room_height - sprite_height/1.8;
alpha = 0;
image_speed = 0;
image_index = 0;
if ( instance_number(obj_enemy_death) > 1 ) instance_destroy();