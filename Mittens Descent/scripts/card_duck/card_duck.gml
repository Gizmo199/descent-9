function card_duck() : card_base() constructor {
	
	name = "Duck"
	desc = "Invincible from [c_red]falling hazard[c_white] damage while holding [sp_player_control_keys, 3] on platforms. Halts wave progress";
	cost = [0, 0];
	icon = sp_card_icon_agility;
	index = 3;
	func = function(){
		with ( Player ) component_add(Component.Duck);
	}
	odds = function(){
		if ( component_exists(Component.Duck, Player) ) return 0;
		if ( component_exists(Component.Naptime, Player) ) return 5;
		return 29;
	}
	
}