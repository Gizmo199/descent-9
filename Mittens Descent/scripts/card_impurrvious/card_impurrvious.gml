function card_impurrvious() : card_base() constructor {
	
	name = "Impurrvious"
	desc = "Damage protection for [c_red]3s[c_white] when respawning. Wrap around room while protected";
	cost = [2, 0];
	icon = sp_card_icon_health;
	index = 4;
	func = function(){
		with ( Player ) component_add(Component.Shield);
	}
	odds = function(){
		if ( component_exists(Component.Shield, Player) ) return 0;
		return 25;
	}
	
}