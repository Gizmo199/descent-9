function cmp_base(e) constructor {
	
	entity = e;
	active = true;
	debug  = false;
	automatic_update = true;
	automatic_draw = true;
	automatic_draw_gui = true;
	
	// Components can have components
	struct_set_from_hash(self, global.__component_hash, array_create(Component.Sizeof, undefined));
	
	///@func create()
	create = function(){};
	
	///@func update()
	update	= function(){};
	
	///@func draw()
	draw	= function(){};
	
	///@func draw_gui()
	draw_gui= function(){};
	
}