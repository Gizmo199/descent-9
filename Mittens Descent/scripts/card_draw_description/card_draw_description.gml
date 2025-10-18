function card_draw_description(_card, _x, _y, _wrap=room_width/1.5){
	
	with ( _card )
	{
		var _scb = scribble($"[scale, 0.75][wave][fnt_title_outline][c_red]{name}[c_white]")
			.align(fa_center, fa_center)
			.outline(C_BLACK)
		_scb.draw(_x, _y);
		_y = _scb.get_bbox(_x, _y).bottom;
	
		var _desc = desc;
		if ( is_method(desc) ) _desc = desc();
		scribble($"[scale, 0.5][wave][fnt_text_outline][c_white]{_desc}")
			.align(fa_center, fa_top)
			.wrap(_wrap)
			.outline(C_BLACK)
			.draw(_x, _y);
	}
	
}