function component_draw_gui(_component, _entity=self){
	with ( component_get(_component, _entity) ) 
	{
		if ( !active ) return;
		draw_gui();
	}
}