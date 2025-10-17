function card_double_jump() : card_base() constructor {
	
	name = "Double Jump"
	desc = function(){
		var _icon = input_icon_text(INPUT_VERB.JUMP);
		return $"Perform a jump [c_red]mid-air[c_white] using {_icon}";
	}
	cost = [1, 0];
	icon = sp_card_icon_agility;
	index= 0;
	func = function(){
		with ( Player ) component_add(Component.DoubleJump);
	}
	odds = function(){
		if ( component_exists(Component.DoubleJump, Player) ) return 0;
		return 75;
	}
	
}