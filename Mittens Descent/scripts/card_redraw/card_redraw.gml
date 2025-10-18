function card_redraw() : card_base() constructor {
	
	name = "Redraw"
	desc = "Redraw shop cards";
	cost = [0, 0];
	icon = sp_card_icon_environment;	
	index = 4;
	collect = false;
	func = function(){
		with ( Spawner ) redraw = false;
		with ( Shop ) 
		{
			state = shop_state_create_cards;
			array_foreach(cards, instance_destroy);
			cards = [];
		}
	}
	odds = function(){
		with ( Spawner ) if ( !redraw ) return 0;
		return 100;
	}
	
}