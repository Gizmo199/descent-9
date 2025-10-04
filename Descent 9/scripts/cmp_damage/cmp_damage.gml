function cmp_damage(e) : cmp_base(e) constructor {
	
	amount = 1;
	create = function(){
		
		var c = self;
		with ( component_get(Component.Health, entity) ) add(-c.amount);
		component_remove(Component.Damage, entity);
		
	}
	
}