function shop_state_create_cards(){
	
	// Create cards
	if ( array_length(cards) <= 0 )
	{
		var _n = 3;
		var _w = sprite_get_width(sp_card_back);
		var _x = ( room_width/2 ) - ( _n * _w * 0.5 ) + _w * 0.5;
							
		// Create cards
		var _stored = [];
		repeat(_n)
		{
			// Pull card
			var _new_card = array_get_weighted(global.__card_pool, global.__card_weights, true);
			while ( global.__card_limits[@ _new_card] && array_contains(_stored, _new_card) )
			{
				_new_card = array_get_weighted(global.__card_pool, global.__card_weights, true);
			}			
			show_debug_message(_new_card);
			array_push(_stored, _new_card);
			
			// Create card
			array_push(cards, card_create(_x, _new_card));
			_x += _w;
		}
	}
	
	// Update card positions and proceed
	var _proceed = true;
	var i = 0;
	repeat(array_length(cards)){
		var _card = cards[i++];
		with ( _card )
		{
			if ( --wait > 0 )
			{
				_proceed = false;
				continue;
			}
			if ( !lerp_to_location(id, x, dest_y, 0.3) ) _proceed = false;	
		}
	}

	
	// Continue?
	if ( !_proceed ) return;
	state = shop_state_idle;
	
	// Highlight card
	var _card = cards[selected];
	with ( component_get(Component.Health, Player) ) 
	{
		highlight_reset();
		highlight_cost(_card.cost[0], _card.cost[1]);
	}
	
}