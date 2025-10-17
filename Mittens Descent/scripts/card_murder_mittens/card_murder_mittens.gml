function card_murder_mittens() : card_base() constructor {
	
	name = "Murderer Mittens"
	desc = "Destroy nearby enemies while [c_red]mid-air[c_white] by pressing [sp_player_control_jump, 0]. Player will jump again (does not use up double jump)";
	cost = [2, 1];
	icon = sp_card_icon_agility;
	index = 4;
	func = function(){
		with ( Player ) component_add(Component.JumpDestroy);
	}
	odds = function(){
		if ( component_exists(Component.JumpDestroy, Player) ) return 0;
		return 12;
	}
	
}