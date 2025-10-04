function card_wall_claws() : card_base() constructor {
	
	limit= true;
	name = "Wall Claws"
	desc = "Climb and Cling to walls by using arrow keys";
	cost = [0, 1];
	icon = sp_card_icon_agility;
	func = function(){
		with ( Player ) component_add(Component.WallHang);
	}
	odds = function(){
		if ( component_exists(Component.WallHang, Player) ) return 0;
		return 30;
	}
	
}