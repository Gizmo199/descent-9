// Draw win screen
if ( state == shop_state_create_end_screen )
{
	var _t0 = $"[fnt_title_outline][c_red][wave]YOU WIN";
	var _t1 = $"[fnt_text_outline]Thanks for playing!";
	if ( !win )
	{
		var _t0 = $"[fnt_title_outline][c_red][wave]YOU LOSE";
		var _t1 = $"[fnt_text_outline][scale, 0.5]Sorry it didn't work out! :(\n Death is unfair. That said...\n\nThanks for playing!";
	}
	var _scb = scribble(_t0)
				.align(fa_center, fa_center)
				.outline(C_BLACK);
	var _box = _scb.get_bbox(room_width/2, room_height/2);
	_scb.draw(room_width/2, room_height/2);
		
	scribble(_t1 + "\n[scale, 0.33][wave][c_red]press any key to continue...")
		.align(fa_center, fa_top)
		.outline(C_BLACK)
		.draw(room_width/2, _box.bottom);		
	exit;
}

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
	var _scb = scribble($"[scale, 0.75][wave][fnt_title_outline][c_red]{name}[c_white]")
		.align(fa_center, fa_center)
		.outline(C_BLACK)
	_scb.draw(room_width/2, _y);
	var _y = _scb.get_bbox(room_width/2, _y).bottom;

	scribble($"[scale, 0.5][wave][fnt_text_outline][c_white]{desc}")
		.align(fa_center, fa_top)
		.wrap(room_width/2)
		.outline(C_BLACK)
		.draw(room_width/2, _y);
}