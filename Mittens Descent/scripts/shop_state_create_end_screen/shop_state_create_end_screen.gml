function shop_state_create_end_screen(){
	
	with ( Spawner ) instance_destroy();
	
	var _x = room_width/2;
	with ( Player )
	{
		var _float = dcos(current_time/10) * .1;
		lerp_to_location(id, _x, y + _float, 0.1);
	}
	
	if ( keyboard_check_pressed(vk_anykey) )
	{
		if ( !fadeout ) sfx_play(snd_combat);
		fadeout = true;
	}
	if ( fade >= 1 ) room_goto(rm_menu);	
	
}