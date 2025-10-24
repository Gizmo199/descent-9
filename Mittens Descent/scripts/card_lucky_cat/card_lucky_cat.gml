function card_lucky_cat() : card_base() constructor {
	
	name = "Lucky Cat"
	desc = "Falling hazards have a 12% chance to drop +1 [sp_player_hp_token, 0] or [sp_player_hp_token, 1] token";
	cost = [1, 2];
	icon = sp_card_icon_health;
	index = 3;
	func = function(){
		with ( Player ) component_add(Component.Luck);
	}
	odds = function(){
		if ( component_exists(Component.Luck, Player) ) return 0;
		return 25;
	}
	
}