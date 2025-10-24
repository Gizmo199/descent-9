// Draw win screen
if ( state == shop_state_create_end_screen )
{
	var _t0 = $"[fnt_title_outline][c_red][wave]YOU WIN";
	var _t1 = $"[fnt_text_outline]Thanks for playing!";
	if ( !win )
	{
		var _t0 = $"[fnt_title_outline][c_red][wave]YOU LOSE";
		var _t1 = $"[fnt_text_outline][scale, 0.5]Sorry it didn't work out! :(\n Death is unfair. That said...\n\nThanks for playing!";
		
		with ( component_get(Component.Score, Player) )
		{
			_t1 = "[fnt_text_outline][wave]";
			if ( global.new_highscore )
			{
				_t1 += "[/wave][shake][c_red]New Highscore[/shake][c_white][wave]\n";
			}
			_t1 += $"[scale, 1]{get()}[scale, 0.5]";
			if ( !global.new_highscore ) _t1 += $"\nHighscore [c_red]{global.settings.highscore}[c_white]";
			_t1 += "\n\nThanks for playing!";
		}
		component_deactivate(Component.Score, Player);
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
	
	if ( win ) 
	{
		with ( Player )
		{
			other.crown_y = lerp(other.crown_y, y-16, 0.1);
			draw_sprite(sp_player_crown, current_time/60, x, other.crown_y);
		}	
	}
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
	var _x = room_width/2;
	var _y = room_height - 32;
	card_draw_description(id, _x, _y);
}