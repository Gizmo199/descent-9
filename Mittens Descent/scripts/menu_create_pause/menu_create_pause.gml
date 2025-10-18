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
			if ( array_length(global.cards) > 0 && _selected && _pressed ) 
			{
				sfx_play(snd_blip);
				menu_create_cards();	
				instance_destroy();
			}
			var _text = "Cards";
			if ( array_length(global.cards) <= 0 ) _text = "[c_dkgray]Cards";
			return menu_scribble(_text, _selected);
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
				menu_create_controls();	
				instance_destroy();
			}
			return menu_scribble("Controls", _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed ) 
			{
				sfx_play(snd_blip);
				gamefade(false, function(){
					room_goto(rm_menu);
				});	
			}
			return menu_scribble("Quit", _selected);
		}
	];
	
	// Add cards if we have any
	//if ( array_length(global.cards) > 0 ) 
	//{
	//	array_insert(_menu, 1, function(_selected, _pressed){
	//		if ( _selected && _pressed ) 
	//		{
	//			sfx_play(snd_blip);
	//			menu_create_cards();	
	//			instance_destroy();
	//		}
	//		return menu_scribble("Cards", _selected);
	//	});	
	//}
	
	music_play(msc_menu, true);
	return instance_create_layer(0, 0, "Menu", Menu, {
		
		is_main : false,
		title: "Paused",
		fade : 0,
		menu : _menu,
		
	});
}