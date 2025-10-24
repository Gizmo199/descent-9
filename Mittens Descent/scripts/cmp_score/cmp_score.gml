function cmp_score(e) : cmp_base(e) constructor {
	
	value = 0;
	value_to = value;
	static add = function(_amount){
		value += _amount;
		if ( value > global.settings.highscore )
		{
			global.new_highscore = true;
			global.settings.highscore = value;	
			gamesave();
		}
	}	
	static get = function(){
		return value;	
	}
	draw = function(){
		value_to = approach(value_to, get(), 10);
		var _prefix = "";
		if ( value_to != get() ) _prefix = "[shake]";
		scribble(_prefix + $"[scale, 0.5][fnt_text_outline]SCORE {value_to}")
			.align(fa_left, fa_top)
			.outline(C_BLACK)
			.draw(8, 8)
	}
}