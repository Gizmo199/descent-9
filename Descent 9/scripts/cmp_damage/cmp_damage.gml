function cmp_damage(e) : cmp_base(e) constructor {
	
	amount = 1;
	create = function(){
		
		var c = self;
		with ( component_get(Component.Health, entity) ) 
		{
			var h = self;
			add(-c.amount);
			with ( Player ) 
			{
				// Died completely? Just restart the game
				if ( c.entity == self && h.get() <= 0 )
				{
					room_goto(rm_menu);
					return;
				}
			}
		}
		component_remove(Component.Damage, entity);		
		
	}
	
}