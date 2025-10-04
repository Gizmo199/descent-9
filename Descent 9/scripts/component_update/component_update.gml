function component_update(_component, _entity=self){
	with ( component_get(_component, _entity) ) 
	{
		if ( !active ) return;
		update();
	}
}