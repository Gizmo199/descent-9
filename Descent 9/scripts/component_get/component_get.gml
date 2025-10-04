function component_get(_component, _entity=self){
	
	with ( _entity )
	{
		if ( __entity_component_array == undefined ) return undefined;
		return __entity_component_array[@ _component];
	}
	return undefined;
	
}