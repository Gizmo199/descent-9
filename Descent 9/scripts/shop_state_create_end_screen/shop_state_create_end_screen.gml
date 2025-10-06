function shop_state_create_end_screen(){
	
	var _x = room_width/2;
	with ( Player )
	{
		var _float = dcos(current_time/10) * .1;
		lerp_to_location(id, _x, y + _float, 0.1);
	}
	
	if ( keyboard_check_pressed(vk_anykey) ) fadeout = true;
	if ( fade >= 1 ) room_goto(rm_menu);	
	
}