var _sign = sign(dest_x - x);
if( _sign != 0 ) image_xscale = _sign;

if ( point_distance(x, y, dest_x, dest_y) > 1 )
{
	if ( shriek != undefined ) 
	{
		if ( instance_exists(shriek) ) exit;
		shriek = undefined;
	}
	x = approach(x, dest_x, spd);
	y = approach(y, dest_y, spd);
}
else
{
	var _this = self;
	journey--;
	with ( Player ) 
	{
		other.dest_x = x;
		other.dest_y = y;
	}
	if ( journey == -1 )
	{
		dest_x = xstart;
		dest_y = ystart;
	}
	else if ( journey < -1 ) instance_destroy();
	else with ( instance_create_layer(x, y, layer, obj_enemy_shriek, {
		handler : _this	
	}) ) 
	{
		other.shriek = self;
		with ( Spawner ) other.radius += wave * 2;	
	}
}
