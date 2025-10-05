function cmp_damage(e) : cmp_base(e) constructor {
	
	amount = 1;
	create = function(){
		
		// Ducking? 
		with ( component_get(Component.Duck, entity) ) 
		{
			if ( ducking ) return component_remove(Component.Damage, entity);	
		}
		
		
		// Block damage?
		with ( component_get(Component.Shield, entity) ) 
		{
			if ( !used ) return component_remove(Component.Damage, entity);	
		}
		
		var c = self;
		with ( component_get(Component.Hurtbox, entity) ) on_damage();		
		with ( component_get(Component.Health, entity) ) 
		{
			var h = self;
			add(-c.amount);
			with ( entity ) 
			{
				// Died completely? Just restart the game
				if ( h.get() <= 0 )
				{
					instance_destroy();
					return;
				}
			}
		}
		component_remove(Component.Damage, entity);		
		
	}
	
}