function menu_create_main(_fade=1){
	var _menu = [
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				sfx_play(snd_combat);
				music_play(undefined);
				fade_to_play = true;	
			}
			return menu_scribble("Play", _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed ) 
			{
				sfx_play(snd_blip);
				menu_create_options();	
				instance_destroy();
			}
			return menu_scribble("Options", _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed ) game_end();	
			return menu_scribble("Quit", _selected);
		}
	];
	music_play(msc_menu);
	if ( os_browser != browser_not_a_browser || os_get_config() == "HTML" ) array_pop(_menu);
	return instance_create_layer(0, 0, layer, Menu, {
		
		is_main : true,
		title: "[scale, 1][sp_title, 0]",
		fade : _fade,
		menu : _menu,
		
	});
}