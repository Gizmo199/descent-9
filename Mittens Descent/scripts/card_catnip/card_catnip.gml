function card_catnip() : card_base() constructor {
	
	name = "Catnip"
	desc = "Regain full [sp_player_hp_token, 0]";
	cost = [0, 2];
	icon = sp_card_icon_health;
	index = 2;
	collect = false;
	func = function(){
		with ( component_get(Component.Health, Player) ) add(100);
	}
	odds = function(){
		with ( component_get(Component.Health, Player) ) 
		{
			if ( get() >= get_max()-2 ) return 0;
			return ( 1 - ( get()/9 )) * 100;
		}
		return 0;
	}
	
}