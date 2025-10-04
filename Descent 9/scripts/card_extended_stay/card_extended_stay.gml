function card_extended_stay() : card_base() constructor {
	
	name = "Extended Stay"
	desc = "Gain +1 [sp_player_hp, 1]";
	cost = [3, 0];
	icon = sp_card_icon_health;
	func = function(){
		with ( component_get(Component.Health, Player) ) add_max(1);	
	}
	odds = function(){
		var _cost = cost;
		with ( component_get(Component.Health, Player) )
		{
			if ( get() == _cost[0] ) return 0;
			if ( get_max() < 7 ) return 30;
		}
		return 15;
	}
	
}