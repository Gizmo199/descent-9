function shop_state_complete(){
	
	var _x = room_width/2;
	var _y = 48;
	//with ( Platform ) 
	//{
	//	_x = x;
	//	_y = min(_y, y - 32);
	//	break;
	//}
	
	// Move player to location
	if ( !lerp_to_location(Player, _x, _y, 0.3) ) return;
	
	// Update card locations
	var i = 0;
	var _card = cards[selected];
	var complete = true;
	repeat(array_length(cards)){
		
		var c = cards[i++];
		with ( c )
		{
			if( c == _card )
			{
				if ( !lerp_to_location(id, room_width/2, room_height/2, 0.2) ) complete = false;
			}
			else
			{
				if ( !lerp_to_location(id, x, room_height + sprite_height * 1.5, 0.2) ) complete = false;	
			}
		}
		
	}

	// Complete
	if ( !complete ) return;

	// Destroy shop
	instance_destroy();
	
}	