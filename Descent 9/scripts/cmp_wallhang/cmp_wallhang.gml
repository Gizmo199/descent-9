function cmp_wallhang(e) : cmp_base(e) constructor {
	
	hanging = false;
	
	update = function(){
		
		hanging = false;
		var _ix = 0;
		var _iy = 0;
		with ( component_get(Component.LocalInput, entity) )
		{
			_ix = get(eBinding.Right) - get(eBinding.Left);
			_iy = get(eBinding.Down) - get(eBinding.Up);
		}
		
		var c = self;
		with ( entity )
		{
			if ( place_meeting(x + _ix*2, y, Collider) ) 
			{
				c.hanging = true;
				with ( component_get(Component.Platformer) )
				{					
					hspeed = 0;
					vspeed = _iy * get_movespeed();
				}	
				
			}
		}
		
	}
	
}