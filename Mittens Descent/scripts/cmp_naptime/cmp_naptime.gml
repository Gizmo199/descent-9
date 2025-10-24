function cmp_naptime(e) : cmp_base(e) constructor {
	
	timer = 0;
	seconds = 1.5;
	xprev = undefined;
	yprev = undefined;
	using = false;
	zpos = 0;
	update = function(){
		
		var c = self;
		
		// Cannot use with impurrvious
		with ( component_get(Component.Shield, entity) )
		{
			if ( !used ) 
			{
				c.zpos = 0;
				c.using = false;
				c.timer = 0;
				return;
			}
		}	
		
		with ( entity )
		{
			c.xprev ??= x;
			c.yprev ??= y;
			var _is_sliding = false;
			with ( component_get(Component.WallHang) ) _is_sliding = hanging;
			if ( point_distance(x, y, c.xprev, c.yprev) < 1 && !_is_sliding )
			{
				c.timer += delta;
			}
			else
			{
				c.timer = 0;
				c.using = false;
				c.zpos  = 0;
			}
			
			if ( c.timer > c.seconds/2 ) c.using = true; 
			if ( c.timer >= c.seconds )
			{
				c.timer = 0;
				with ( component_get(Component.Health) ) add(1);	
				sfx_play(snd_blip);
			}			
			c.xprev = x;
			c.yprev = y;
			
			if ( c.using ) sprite_index = sp_player_sleep;
		}
		
	}
	draw = function(){
		if ( !using ) return;
		zpos += 0.05;
		if ( floor(zpos) > 3 ) zpos = 0;
		
		var i = 0;
		repeat(floor(zpos))
		{
			var _wiggle = dcos((current_time+(i*180))/4)*2;
			draw_sprite(sp_player_snoozing_z, 0, entity.x + _wiggle, entity.bbox_top - ( i * 8 ));
			i++;
		}
	}
	
}