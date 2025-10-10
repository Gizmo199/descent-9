function component_deactivate(_component, _entity=self){
	with ( component_get(_component, _entity) ) active = false;	
}