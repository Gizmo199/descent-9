function card_high_ground() : card_base() constructor {
	
	incr = 1.5;
	name = "High Ground"
	desc = "Increase height of mezzanines";
	cost = [0, 0];
	icon = sp_card_icon_environment;
	index = 3;
	func = function(){
		var _incr = incr;
		with ( Mezzanine ) image_yscale = _incr;
	}
	odds = function(){		
		var _added = 0;
		var _extended = 0;
		var _num = instance_number(Mezzanine);
		var _incr = incr;
		
		// Check if platforms have been extended and give better odds if not
		with ( Mezzanine )
		{
			if ( image_yscale < _incr ) _added += 5;
			else _extended++;
		}
		// All platforms extended? No odds
		if ( _extended == _num ) return 0;
		
		// Return odds based on additional requirements
		if ( _num < 2 ) return 10 + _added;
		return 15 + _added;
		
	}
	
}