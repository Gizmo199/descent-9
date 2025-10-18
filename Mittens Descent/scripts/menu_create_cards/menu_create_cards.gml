function menu_create_cards(){
	
	// Create cards
	global.card_instance = [];
	array_foreach(global.cards, function(_card){
		var _inst = instance_create_layer(room_width/2, room_height + sprite_get_height(sp_card_back), layer, Card, _card);
		array_push(global.card_instance, _inst);
		_inst.wait /= 2;
	});
	var _menu = 
	[
		function(_selected, _pressed){
			
			static _scrib = scribble("");
			static _sel = 0;
			static _timer = 1;
			var _number = array_length(global.card_instance);
			var _selprev = _sel;
			
			var _ix = ( input_get(eBinding.Right) - input_get(eBinding.Left) );
			if ( sign(_ix) != 0 )
			{
				if ( _timer && !--_timer ) 
				{
					_timer = 10;
					_sel += _ix;						
				}
			} else _timer = 1;
			
			_sel = clamp(_sel, 0, _number-1);
			if ( _selprev != _sel ) sfx_play(snd_flick);
			
			var _of = (room_width/2) / _number;
			var _yy = room_height/2;
			
			// Draw other cards
			var i = 0;
			repeat(_number)
			{
				var _card = global.card_instance[i];
				_card.selected = false;
				var _xx = ( room_width/2 ) - ( _of * (_number-1) * .5 ) + ( _of * i );
				if ( --_card.wait <= 0 ) 
				{
					_card.x = lerp(_card.x, _xx, 0.2);
					if ( i != _sel )
					{
						_card.y = lerp(_card.y, _yy + dcos((current_time/10)+(i*15)) * 2, 0.3);
						with( _card ) event_user(0);
					}
				}
				i++;
			}

			// Draw focused card
			var _card = global.card_instance[@ _sel];
			with ( _card )
			{
				selected = true;
				if ( wait <= 0 )
				{
					y = lerp(y, _yy - 16, 0.3);
					card_draw_description(id, room_width/2, room_height - 48);
				}
				event_user(0);
			}
			return _scrib;
		}
	];
	return instance_create_layer(0, 0, "Menu", Menu, {
		
		card : true,
		back : menu_create_main,
		center : true,
		fade : 0,
		menu : _menu,
		title : "Cards"
		
	});
	
}