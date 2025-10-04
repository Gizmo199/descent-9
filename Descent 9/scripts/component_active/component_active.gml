function component_active(_component, _entity=self){
	with ( component_get(_component, _entity) ) return active;
	return false;
}