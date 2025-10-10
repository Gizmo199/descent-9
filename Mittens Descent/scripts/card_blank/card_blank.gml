function card_blank() : card_base() constructor {
	
	limit = false;
	name = "Blank";
	desc = "Does nothing";
	cost = [0, 0];
	func = function(){};
	icon = undefined;
	odds = function(){ return 10; }
	
}
