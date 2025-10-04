function component_activate(_component, _entity=self){
	with ( component_get(_component, _entity) ) active = true;	
}