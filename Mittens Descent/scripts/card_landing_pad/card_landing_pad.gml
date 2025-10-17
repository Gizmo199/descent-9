function card_landing_pad() : card_base() constructor {
	
	incr = 1.75;
	name = "Landing Pad"
	desc = "Increase size of platforms";
	cost = [0, 0];
	icon = sp_card_icon_environment;
	index = 2;
	func = function(){
		var _incr = incr;
		with ( Platform ) image_xscale = _incr;
	}
	odds = function(){
		var _added = 0;
		var _extended = 0;
		var _num = instance_number(Platform);
		var _incr = incr;
		
		// Check if platforms have been extended and give better odds if not
		with ( Platform )
		{
			if ( image_xscale < _incr ) _added += 5;
			else _extended++;
		}
		// All platforms extended? No odds
		if ( _extended == _num ) return 0;
		
		// Return odds based on additional requirements
		if ( _num < 2 ) return 10 + _added;
		return 15 + _added;
		
	}
	
}