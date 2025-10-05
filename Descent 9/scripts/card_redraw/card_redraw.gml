function card_redraw() : card_base() constructor {
	
	name = "Redraw"
	desc = "Redraw shop cards";
	cost = [0, 0];
	icon = sp_card_icon_environment;
	func = function(){
		with ( Shop ) 
		{
			state = shop_state_create_cards;
			array_foreach(cards, instance_destroy);
			cards = [];
		}
	}
	odds = function(){
		/// TODO :: Make only available once per wave
		show_debug_message("TODO :: 'card_redraw' make available once per wave!");
		return 100;
	}
	
}