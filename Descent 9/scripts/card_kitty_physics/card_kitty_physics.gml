function card_kitty_physics() : card_base() constructor {
	
	name = "Kitty Physics"
	desc = "Ability to double jump";
	cost = [1, 0];
	icon = sp_card_icon_agility;
	func = function(){
		with ( Player ) component_add(Component.DoubleJump);
	}
	odds = function(){
		if ( component_exists(Component.DoubleJump, Player) ) return 0;
		return 60;
	}
	
}