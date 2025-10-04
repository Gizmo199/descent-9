function component_activate_all(_entity=self){
	if ( __entity_component_array == undefined ) return;
	array_foreach(__entity_component_array, function(_component){
		if ( _component == undefined ) return;
		_component.active = true;
	});
}