function component_draw_all(_entity=self){
	if ( __entity_component_array == undefined ) return;
	with ( _entity ) 
	{
		array_foreach(__entity_component_array, function(_component){
			if ( _component == undefined ) return;
			if ( _component.automatic_draw == false ) return;
			if ( _component.active == false ) return;
			_component.draw();
		});
	}
}