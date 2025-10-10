draw_sprite_tiled(sp_background_shop, 0, x, current_time/10);

var i = 0;
var _x = room_width/2.33;
var _y = ( room_height/2 ) - ((total-1)*10*.5);
var _k = keyboard_check_pressed(vk_space);
_y += 16;
if ( fade_to_play ) _k = false;
repeat(total)
{
	var _func = menu[i];
	var _scrb = _func((curr == i) * !fade_to_play, _k);
	_scrb.outline(C_BLACK).draw(_x - 8, _y);
	_y += 10;
	if ( !is_main && i == floor(total/2) )
	{
		draw_sprite(sp_player_shop, 0, _x - 24, ( _y - 4 ) + dcos(current_time/10)*2);
	}
	i++;
}

if ( is_main ) 
{
	var _y = 48;
	draw_sprite(sp_title, 0, room_width/2, _y + dcos((current_time+180)/10)*2);
	draw_sprite(sp_player_shop, 0, room_width/2, _y + 4 + dcos(current_time/10)*2); 
}
else
{
	scribble($"[fnt_title_outline][wave][c_red]{title}")
		.align(fa_center, fa_top)
		.outline(C_BLACK)
		.draw(room_width/2, 32);	
}