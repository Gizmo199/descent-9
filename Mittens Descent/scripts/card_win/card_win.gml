function card_win() : card_base() constructor {
	
	name = "Win"
	desc = "Proceed to win screen";
	cost = [0, 0];
	icon = sp_card_icon_environment;
	index = 6;
	func = function(){
		var _this = Shop;
		with ( Shop ) _this = id;
		
		gamesave(true);
		music_play(undefined);
		_this.win = true;
		_this.state = shop_state_create_end_screen;
		InputVerbConsumeAll();
	}
	odds = function(){
		return 0;
	}
	
}