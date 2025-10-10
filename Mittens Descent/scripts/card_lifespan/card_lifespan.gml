function card_lifespan() : card_base() constructor {
	
	name = "Lifespan"
	desc = "Gain +2 [sp_player_hp_token, 1]";
	cost = [1, 0];
	icon = sp_card_icon_health;
	func = function(){
		with ( component_get(Component.Health, Player) ) add_max(2);	
	}
	odds = function(){
		var _cost = cost;
		with ( component_get(Component.Health, Player) )
		{
			if ( get() == _cost[0] ) return 0;
			if ( get_max() < 7 ) return 30;
		}
		return 10;
	}
	
}