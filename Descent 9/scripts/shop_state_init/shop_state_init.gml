function shop_state_init(){
	
	with ( Player ) sprite_index = sp_player_shop;
	var _x = room_width/2;
	var _y = room_height/2;
	if ( !lerp_to_location(Player, _x, _y - 16, 0.1) ) return;
	state = shop_state_create_cards;
	
}