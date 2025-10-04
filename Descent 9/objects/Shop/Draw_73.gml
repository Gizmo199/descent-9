if ( array_length(cards) <= 0 ) exit;

// Draw cards
array_foreach(cards, function(_card){
	with ( _card ) event_user(0);
});

// Draw text
if ( state == shop_state_complete ) exit;
with ( cards[selected] )
{
	var _y = room_height - 32;
	var _scb = scribble($"[wave][fnt_title_outline][c_red]{name}[c_white]")
		.align(fa_center, fa_center)
		.outline(C_BLACK)
	_scb.draw(room_width/2, _y);
	var _y = _scb.get_bbox(room_width/2, _y).bottom - 3;

	scribble($"[wave][fnt_text_outline][c_white]{desc}")
		.align(fa_center, fa_top)
		.wrap(room_width/1.3)
		.outline(C_BLACK)
		.draw(room_width/2, _y);
}