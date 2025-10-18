function card_murder_mittens() : card_base() constructor {
	
	name = "Murderer Mittens"
	desc = function(){
		var _icon = input_icon_text(INPUT_VERB.JUMP);
		return $"Destroy nearby enemies while [c_red]mid-air[c_white] by pressing {_icon}. Player will jump again (does not use up double jump)";
	}
	cost = [2, 1];
	icon = sp_card_icon_agility;
	index = 4;
	func = function(){
		with ( Player ) component_add(Component.JumpDestroy);
	}
	odds = function(){
		if ( component_exists(Component.JumpDestroy, Player) ) return 0;
		return 24;
	}
	
}