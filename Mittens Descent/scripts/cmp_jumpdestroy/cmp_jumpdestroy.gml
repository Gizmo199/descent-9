function cmp_jumpdestroy(e) : cmp_base(e) constructor {
	
	radius = 24;
	enemy  = undefined;
	update = function(){
		
		var c = self;
		enemy = undefined;
		with ( entity )
		{
			with ( instance_nearest(x, y, Minion) )
			{
				if ( point_in_circle(other.x, other.y, x, y, c.radius) )
				{
					c.enemy = id;
				}
			}			
		}
		
	}
	get = function(){
		if ( enemy != undefined && !instance_exists(enemy) ) enemy = undefined;
		return enemy;
	}
	
}