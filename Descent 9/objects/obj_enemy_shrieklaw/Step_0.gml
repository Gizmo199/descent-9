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
	if ( --wait > 0 ) 
	{
		x = dest_x;
		y = dest_y + dcos(current_time*10);
		return;
	}
	y = dest_y;
	wait = wait_time;
	var _this = self;
	journey--;
	if ( journey > 0 )
	{
		with ( Player ) 
		{
			other.dest_x = x;
			other.dest_y = y;
		}	
	}
	else if ( journey == 0 )
	{
		dest_x = xstart;
		dest_y = ystart;
	}
	else if ( journey < 0 ) instance_destroy();
	else with ( instance_create_layer(x, y, layer, obj_enemy_shriek, {
		handler : _this	
	}) ) 
	{
		other.shriek = self;
		with ( Spawner ) other.radius += wave * 2;	
	}
}
