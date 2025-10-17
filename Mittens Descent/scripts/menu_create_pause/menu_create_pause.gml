function menu_create_pause(){
	
	var _menu = [
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				sfx_play(snd_blip);
				instance_destroy(Pause);
			}	
			return menu_scribble("Resume", _selected);
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
			if ( _selected && _pressed ) 
			{
				sfx_play(snd_blip);
				gamefade(false, function(){
					room_goto(rm_menu);
				});	
			}
			return menu_scribble("Exit", _selected);
		}
	];
	music_play(msc_menu, true);
	return instance_create_layer(0, 0, "Menu", Menu, {
		
		is_main : false,
		title: "Paused",
		fade : 0,
		menu : _menu,
		
	});
}