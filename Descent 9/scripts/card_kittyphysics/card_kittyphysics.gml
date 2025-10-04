function card_kittyphysics() : card_base() constructor {
	
	limit= true;
	name = "Kitty Physics"
	desc = "Ability to double jump";
	cost = [2, 0];
	icon = sp_card_icon_doublejump;
	func = function(){
		with ( Player ) component_add(Component.DoubleJump);
	}
	odds = function(){
		if ( component_exists(Component.DoubleJump, Player) ) return 0;
		return 60;
	}
	
}