function card_duck() : card_base() constructor {
	
	name = "Duck"
	desc = "Hold down to become invincible on platforms, but you can't move or jump";
	cost = [0, 0];
	icon = sp_card_icon_agility;
	func = function(){
		with ( Player ) component_add(Component.Duck);
	}
	odds = function(){
		if ( component_exists(Component.Duck, Player) ) return 0;
		return 12;
	}
	
}