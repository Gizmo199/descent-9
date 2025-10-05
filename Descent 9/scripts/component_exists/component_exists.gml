function component_exists(_component, _entity=self){
	return ( component_get(_component, _entity) != undefined );
}