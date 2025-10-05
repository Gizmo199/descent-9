function card_naptime() : card_base() constructor {
	
	name = "Naptime"
	desc = "Do not move for 3s to gain +1 [sp_player_hp, 0]";
	cost = [0, 1];
	icon = sp_card_icon_health;
	func = function(){
		with ( Player ) component_add(Component.Naptime);
	}
	odds = function(){
		if ( component_exists(Component.Naptime, Player) ) return 0;
		return 35;
	}
	
}