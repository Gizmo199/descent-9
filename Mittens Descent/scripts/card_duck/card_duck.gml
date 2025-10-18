function card_duck() : card_base() constructor {
	
	name = "Duck"
	desc = function(){
		var _icon = input_icon_text(INPUT_VERB.DOWN);
		return $"Invincible from [c_red]falling hazard[c_white] damage while holding {_icon} on platforms";
	}
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