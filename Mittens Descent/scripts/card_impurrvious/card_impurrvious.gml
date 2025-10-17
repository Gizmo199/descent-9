function card_impurrvious() : card_base() constructor {
	
	name = "Impurrvious"
	desc = "Damage protection for 2s when respawning. Wrap around room while protected";
	cost = [2, 0];
	icon = sp_card_icon_health;
	index = 4;
	func = function(){
		with ( Player ) component_add(Component.Shield);
	}
	odds = function(){
		if ( component_exists(Component.Shield, Player) ) return 0;
		return 43;
	}
	
}