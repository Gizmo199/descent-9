function component_set(_component, _name, _value, _entity=self){
	with ( component_get(_component, _entity) ) self[$ _name] = _value;	
}