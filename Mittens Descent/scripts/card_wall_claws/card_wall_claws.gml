function card_wall_claws() : card_base() constructor {
	
	name = "Wall Claws"
	desc = "Cling to walls using [sp_player_control_keys, 2][sp_player_control_keys, 0]. Climb walls using [sp_player_control_keys, 1][sp_player_control_keys, 3]";
	cost = [0, 1];
	icon = sp_card_icon_agility;
	index = 2;
	func = function(){
		with ( Player ) component_add(Component.WallHang);
	}
	odds = function(){
		if ( component_exists(Component.WallHang, Player) ) return 0;
		return 30;
	}
	
}