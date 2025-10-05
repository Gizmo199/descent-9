function component_remove(_component, _entity=self){
	if ( !component_exists(_component, _entity) ) return;
	with ( _entity )
	{
		var _removed = __entity_component_array[@ _component];
		__entity_component_array[@ _component] = undefined;
		
		with ( _removed ) destroy();
		return _removed;
	}
	return undefined;
}