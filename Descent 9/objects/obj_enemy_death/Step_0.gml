if ( intro && !lerp_to_location(id, dest_x, dest_y, 0.2 ) ) return;
intro = false;

if ( alpha < 1 ) 
{
	x = dest_x + random_range(-1, 1);
	y = dest_y + random_range(-1, 1);
	alpha = approach(alpha, 1, 0.05);
}
if ( --wait > 0 ) wait = 0;
x = dest_x;
y = dest_y;
dest_y+=2;

if ( timer && !--timer )
{
	var _offset = -32;
	if ( x > room_width/2 ) _offset = 32;
	var _inst = instance_create_layer(x + _offset, y, layer, obj_enemy_arrow);
	_inst.hspeed = image_xscale * 4;
	_inst.image_xscale = sign(_inst.hspeed);
	timer = 15;
}

if ( y > room_height ) 
{
	if ( outside_room() ) instance_destroy();	
}