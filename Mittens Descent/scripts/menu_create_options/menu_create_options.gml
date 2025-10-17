function menu_create_options(){
	
	var _menu = [
		function(_selected, _pressed){
			if ( _selected && _pressed )
			{
				sfx_play(snd_blip);
				global.settings.fullscreen = !global.settings.fullscreen;
				gamewindow();
			}
			return menu_scribble("Fullscreen", _selected);
		},
		function(_selected, _pressed){
			if ( _selected && _pressed ) 
			{
				sfx_play(snd_blip);
				global.settings.hurtbox = !global.settings.hurtbox;	
			}
			return menu_scribble($"Show Hurtbox : {global.settings.hurtbox ? "On" : "Off"}", _selected);
		},
		function(_selected, _pressed){
			static _timer = 1;
			if ( _selected ) 
			{
				var _gain = audio_emitter_get_gain(global.emitter_music);
				var _ix = ( input_get(eBinding.Right) - input_get(eBinding.Left) ) * 0.1;
				
				if ( sign(_ix) != 0 )
				{
					if ( _timer && !--_timer ) 
					{
						_timer = 12;
						_gain += _ix;
						_gain = clamp(_gain, 0, 1);
					}
				} else _timer = 1;
				if ( _pressed ) 
				{
					sfx_play(snd_blip);
					if ( _gain > 0 ) _gain = 0;	
					else _gain = 1;
				}
				
				audio_emitter_gain(global.emitter_music, _gain);
			}
			var _gain = audio_emitter_get_gain(global.emitter_music);
			return menu_scribble($"Music : {round(_gain*100)}%", _selected);
		},
		function(_selected, _pressed){
			static _timer = 1;
			if ( _selected ) 
			{
				var _gain = audio_emitter_get_gain(global.emitter_sfx);
				var _ix = ( input_get(eBinding.Right) - input_get(eBinding.Left) ) * 0.1;
				
				if ( sign(_ix) != 0 )
				{
					if ( _timer && !--_timer ) 
					{
						_timer = 12;
						_gain += _ix;
						_gain = clamp(_gain, 0, 1);
						sfx_play(snd_blip);
					}
				} else _timer = 1;
				if ( _pressed ) 
				{
					sfx_play(snd_blip);
					if ( _gain > 0 ) _gain = 0;	
					else _gain = 1;
				}
				
				audio_emitter_gain(global.emitter_sfx, _gain);
			}
			var _gain = audio_emitter_get_gain(global.emitter_sfx);
			return menu_scribble($"Sfx : {round(_gain*100)}%", _selected);
		}
	];
	music_play(msc_menu);
	if ( os_browser != browser_not_a_browser || os_get_config() == "HTML" ) array_shift(_menu);
	return instance_create_layer(0, 0, "Menu", Menu, {
		
		back : menu_create_main,
		fade : 0,
		menu : _menu,
		title : "Options"
		
	});
	
}