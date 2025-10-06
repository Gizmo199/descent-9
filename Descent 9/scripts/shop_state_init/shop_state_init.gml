function shop_state_init(){
	
	if ( shake > 0 )
	{
		shake = approach(shake, 0, 0.1);
		camera_set_view_pos(view_camera[0], random_range(-shake, shake), random_range(-shake, shake));
		
		with ( Player )
		{
			if ( y > room_height - 16 ) y-=4;
			if ( y < 16 ) y+=4;
			if ( x > room_width - 16 ) x-=4;
			if ( x < 16 ) x+=4;
		}
		
		return;
	}
	camera_set_view_pos(view_camera[0], 0, 0);
	
	with ( Player ) sprite_index = sp_player_shop;
	var _x = room_width/2;
	var _y = room_height/2;	
	if ( !lerp_to_location(Player, _x, _y - 16, 0.1) ) return;
	
	// Lose?
	var _this = self;
	with ( component_get(Component.Health, Player) )
	{
		if ( get() <= 0 )
		{
			_this.win = false;
			_this.state = shop_state_create_end_screen;
			highlight_cost(0, get_max());
			return;
		}
	}
	
	// Win?
	with ( Spawner )
	{
		if ( wave >= wave_count-1 ) 
		{
			_this.win = true;
			_this.state = shop_state_create_end_screen;
			return;
		}
	}	
	
	// Normal shop
	state = shop_state_create_cards;
	
}