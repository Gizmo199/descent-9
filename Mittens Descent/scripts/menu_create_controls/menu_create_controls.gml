function menu_create_controls(){
	
	InputVerbConsume(INPUT_VERB.PRIMARY);
	var _menu = 
	[
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				menu_create_remap(INPUT_VERB.JUMP, "Jump");
				instance_destroy();
			}
			return menu_scribble(menu_input_text(INPUT_VERB.JUMP, "Jump"), _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				menu_create_remap(INPUT_VERB.RIGHT, "Right");
				instance_destroy();
			}
			return menu_scribble(menu_input_text(INPUT_VERB.RIGHT, "Right"), _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				menu_create_remap(INPUT_VERB.LEFT, "Left");
				instance_destroy();
			}
			return menu_scribble(menu_input_text(INPUT_VERB.LEFT, "Left"), _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				menu_create_remap(INPUT_VERB.UP, "Up");
				instance_destroy();
			}
			return menu_scribble(menu_input_text(INPUT_VERB.UP, "Up"), _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				menu_create_remap(INPUT_VERB.DOWN, "Down");
				instance_destroy();
			}
			return menu_scribble(menu_input_text(INPUT_VERB.DOWN, "Down"), _selected);
		}
	];
	return instance_create_layer(0, 0, "Menu", Menu, {
		
		special : 24,
		center : true,
		back : menu_create_main,
		fade : 0,
		menu : _menu,
		title : "Controls"
		
	});
	
}