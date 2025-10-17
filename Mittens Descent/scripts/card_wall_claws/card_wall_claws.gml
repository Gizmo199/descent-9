function card_wall_claws() : card_base() constructor {
	
	name = "Wall Claws"
	desc = function(){
		var _left_right = input_icon_text(INPUT_VERB.LEFT) + " " + input_icon_text(INPUT_VERB.RIGHT);
		var _up_down = input_icon_text(INPUT_VERB.UP) + " " + input_icon_text(INPUT_VERB.DOWN);
		return $"[c_red]Cling[c_white] to walls using {_left_right} and [c_red]Climb[c_white] walls using {_up_down}";
	}
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