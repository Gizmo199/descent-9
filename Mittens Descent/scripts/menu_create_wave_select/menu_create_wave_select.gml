function menu_create_wave_select(){
	
	var _menu = 
	[
		function(_selected, _pressed){
			static _timer = 1;
			if ( _selected ) 
			{
				var _ix = ( input_get(eBinding.Right) - input_get(eBinding.Left) );
				if ( sign(_ix) != 0 )
				{
					if ( _timer && !--_timer ) 
					{
						_timer = 12;
						var _wave = global.settings.wave;
						global.settings.wave += _ix;
						global.settings.wave = clamp(global.settings.wave, 3, 9);
						if ( global.settings.wave != _wave ) sfx_play(snd_blip);
					}
				} else _timer = 1;				
			}
			if ( _pressed )
			{
				sfx_play(snd_combat);
				music_play(undefined);
				fade_to_play = true;		
			}
			
			var i = 0;
			var _text = "";
			repeat(9)
			{
				if ( i < global.settings.wave ) _text += "[sp_player_hp_token, 0]";
				else _text += "[sp_player_hp_token, 1]";
				i++;
			}
			title = $"Waves : {global.settings.wave}";
			
			if ( global.settings.wave == 9 )
			{
				scribble("[wave][fnt_text_outline][scale, 0.5]Optional [c_red]endless mode[c_white] when completing all 9 waves")
					.align(fa_center, fa_center)
					.outline(C_BLACK)
					.wrap(room_width/1.5)
					.draw(room_width/2, ( room_height/2 ) - 16);
			}
			
			return menu_scribble($"[c_white]{_text}", _selected);
		}		
	];
	return instance_create_layer(0, 0, "Menu", Menu, {
		
		center : true,
		back : menu_create_main,
		fade : 0,
		menu : _menu,
		title : "Waves"
		
	});
	
}