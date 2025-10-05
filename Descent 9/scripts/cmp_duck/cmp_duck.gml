function cmp_duck(e) : cmp_base(e) constructor {
	
	ducking = false;
	xprev = undefined;
	yprev = undefined;
	using = false;
	update = function(){
		
		var c = self;
		var _id = 0;
		with ( component_get(Component.LocalInput, entity) )
		{
			_id = get(eBinding.Down);
		}
		
		with ( entity )
		{
			var _comp = component_get(Component.Platformer);
			c.xprev ??= x;
			c.yprev ??= y;
			c.ducking = false;
			if ( place_meeting(x, y+1, Collider) && _id )
			{
				c.using= true;
				with ( _comp )
				{
					vspeed = 0;
					hspeed = 0;
					entity.x = c.xprev;
					entity.y = c.yprev;
				}
				sprite_index = sp_player_duck;
				c.ducking = true;
			}
			else
			{
				if ( c.using ) 
				{
					c.using = false;
					with ( _comp ) 
					{
						// Awaken from naptime
						with ( component_get(Component.Naptime, Player) )
						{
							if ( using ) 
							{
								_comp.vspeed = -2;
								entity.y += _comp.vspeed;
							}
						}
					}
				}
			}
			c.xprev = x;
			c.yprev = y;
		}
		
	}
	
}