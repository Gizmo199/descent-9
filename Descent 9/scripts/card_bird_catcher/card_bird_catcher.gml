function card_bird_catcher() : card_base() constructor {
	
	name = "Bird Catcher"
	desc = "Increase jump speed";
	cost = [0, 0];
	icon = sp_card_icon_agility;
	func = function(){
		with ( Player ) component_add(Component.JumpSpeed);
	}
	odds = function(){
		if ( component_exists(Component.JumpSpeed, Player) ) return 0;
		return 26;
	}
	
}