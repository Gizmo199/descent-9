function card_double_jump() : card_base() constructor {
	
	name = "Double Jump"
	desc = "Perform a jump mid-air";
	cost = [1, 0];
	icon = sp_card_icon_agility;
	func = function(){
		with ( Player ) component_add(Component.DoubleJump);
	}
	odds = function(){
		if ( component_exists(Component.DoubleJump, Player) ) return 0;
		return 75;
	}
	
}