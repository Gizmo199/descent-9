function card_zoomies() : card_base() constructor {
	
	name = "Zoomies"
	desc = "Increase move speed";
	cost = [0, 1];
	icon = sp_card_icon_agility;
	func = function(){
		with ( Player ) component_add(Component.MoveSpeed);
	}
	odds = function(){
		if ( component_exists(Component.MoveSpeed, Player) ) return 0;
		return 43;
	}
	
}