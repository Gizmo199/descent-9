function card_helevator() : card_base() constructor {
	
	name = "Hellevator"
	desc = "Adds another hellevator platform";
	cost = [0, 1];
	icon = sp_card_icon_environment;
	func = function(){
		var _offset = room_width/3;
		with ( Platform )
		{
			x = _offset;
			instance_create_layer(room_width - _offset, y, layer, Platform);
		}
	}
	odds = function(){
		if ( instance_number(Platform) > 1 ) return 0;
		return 20;
	}
	
}