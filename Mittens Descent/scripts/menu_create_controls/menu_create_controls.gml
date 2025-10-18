function menu_create_controls(){
	
	InputVerbConsume(INPUT_VERB.PRIMARY);
	global.settings.controls.keyboard = InputBindingsExport(false);
	global.settings.controls.gamepad = InputBindingsExport(true);
	var _menu = 
	[
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				menu_create_remap(INPUT_VERB.JUMP, "Jump");
				instance_destroy();
				sfx_play(snd_blip);
			}
			return menu_scribble(menu_input_text(INPUT_VERB.JUMP, "Jump"), _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				menu_create_remap(INPUT_VERB.RIGHT, "Right");
				instance_destroy();
				sfx_play(snd_blip);
			}
			return menu_scribble(menu_input_text(INPUT_VERB.RIGHT, "Right"), _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				menu_create_remap(INPUT_VERB.LEFT, "Left");
				instance_destroy();
				sfx_play(snd_blip);
			}
			return menu_scribble(menu_input_text(INPUT_VERB.LEFT, "Left"), _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				menu_create_remap(INPUT_VERB.UP, "Up");
				instance_destroy();
				sfx_play(snd_blip);
			}
			return menu_scribble(menu_input_text(INPUT_VERB.UP, "Up"), _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				menu_create_remap(INPUT_VERB.DOWN, "Down");
				instance_destroy();
				sfx_play(snd_blip);
			}
			return menu_scribble(menu_input_text(INPUT_VERB.DOWN, "Down"), _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				var _device = InputPlayerGetDevice();
				InputBindingsReset(InputDeviceIsGamepad(_device));
				sfx_play(snd_blip);
				global.settings.controls.keyboard = InputBindingsExport(false);
				global.settings.controls.gamepad = InputBindingsExport(true);
			}
			return menu_scribble("Reset", _selected);
		},
		
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