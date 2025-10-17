function card_double_jump() : card_base() constructor {
	
	name = "Double Jump"
	desc = "Perform a jump [c_red]mid-air[c_white] using [sp_player_control_jump, 0]";
	cost = [1, 0];
	icon = sp_card_icon_agility;
	index= 0;
	func = function(){
		with ( Player ) component_add(Component.DoubleJump);
	}
	odds = function(){
		if ( component_exists(Component.DoubleJump, Player) ) return 0;
		return 75;
	}
	
}