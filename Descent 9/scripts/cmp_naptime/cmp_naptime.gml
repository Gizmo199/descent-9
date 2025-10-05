function cmp_naptime(e) : cmp_base(e) constructor {
	
	timer = 0;
	seconds = 3;
	xprev = undefined;
	yprev = undefined;
	using = false;
	update = function(){
				
		var c = self;
		with ( entity )
		{
			c.xprev ??= x;
			c.yprev ??= y;
			
			if ( point_distance(x, y, c.xprev, c.yprev) < 1 )
			{
				c.timer += ( delta_time / 1000000 );
			}
			else
			{
				c.timer = 0;
				c.using = false;
			}
			
			if ( c.timer > c.seconds/2 ) c.using = true; 
			if ( c.timer >= c.seconds )
			{
				c.timer = 0;
				with ( component_get(Component.Health) ) add(1);					
			}			
			c.xprev = x;
			c.yprev = y;
			
			if ( c.using ) sprite_index = sp_player_sleep;
		}
		
	}
	
}