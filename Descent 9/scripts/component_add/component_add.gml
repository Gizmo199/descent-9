function component_add(_component, _init_struct={}, _entity=self){
	
	with ( _entity )
	{
		// Component not valid? Ignore but let us know.
		if ( global.__component[@ _component] == undefined )
		{
			show_debug_message($"[!] COMPONENT :: Component {_component} not defined in 'cmp_config'. Make sure component is defined!");
			return;
		}
		
		// Create component array
		if ( __entity_component_array == undefined ) struct_set_from_hash(self, global.__component_hash, array_create(Component.Sizeof, undefined));
		
		// Create new component
		__entity_component_array[@ _component] = new global.__component[@ _component](self);
		
		// Initialize component with struct data
		struct_foreach(_init_struct, method(__entity_component_array[@ _component], function(k, v){
				
			if ( is_method(v) ) return;
			self[$ k] = v;
				
		}));
		
		// Run create event for component
		__entity_component_array[@ _component].create();
		
		// Return new component
		return __entity_component_array[@ _component];
	}
	return undefined;
	
}