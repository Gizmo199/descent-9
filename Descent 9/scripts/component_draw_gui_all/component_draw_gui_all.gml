function component_draw_gui_all(_entity=self){
	if ( __entity_component_array == undefined ) return;
	with ( _entity ) 
	{
		array_foreach(__entity_component_array, function(_component){
			if ( _component == undefined ) return;
			if ( _component.automatic_draw_gui == false ) return;
			if ( _component.active == false ) return;
			_component.draw_gui();
		});
	}
}