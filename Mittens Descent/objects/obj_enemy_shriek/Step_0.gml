with ( handler )
{
	other.sprite_index = sprite_index;
	other.image_index = image_index;
	other.image_xscale = image_xscale;
	other.x = x;
	other.y = y;
}

var _timer = 2;
if ( radius < radius_max ) 
{
	if ( timer && !--timer )
	{
		timer = _timer;
		radius++;
	}
}
else
{
	if ( timer <= 0 ) timer = _timer * 3;
	if ( timer && !--timer )
	{
		score_add(x, y);
		instance_destroy();
	}
}

if ( radius > 12 )
{
	with ( Hurtbox )
	{
		if ( point_in_circle(x, y, other.x, other.y, other.radius) )
		{
			other.on_collision(self);	
		}
	}
}
