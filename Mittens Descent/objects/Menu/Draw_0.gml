if ( room == rm_menu ) draw_sprite_tiled(sp_background_shop, 0, x, current_time/10);

// Run back script
if ( input_get(eBinding.Secondary) && !fade_to_play && !instance_exists(Fade) )
{
	back(0);
	sfx_play(snd_blip);
	instance_destroy();
	InputVerbConsume(INPUT_VERB.SECONDARY);
	var _device = InputPlayerGetDevice();
	InputDeviceSetRebinding(_device, false);
	exit;
}

var s = 12;
var i = 0;
var _x = room_width-16;//.33;
var _y = ( room_height/2 ) - ((total-1)*s*.5);
var _k = input_get(eBinding.Primary);

if ( fade_to_play ) _k = false;
if ( instance_exists(Fade) ) _k = false;
var _align = [fa_right, fa_center];
if ( center ) 
{
	_x = room_width/2;
	_align[0] = fa_center;
	_align[1] = fa_center;
}
if ( special > 0 )
{
	_x = ( room_width/2 ) - special;
	_align[0] = fa_left;
	_align[1] = fa_center;
}

repeat(total)
{
	var _func = menu[i];
	var _scrb = _func((curr == i) * !fade_to_play * !instance_exists(Fade), _k);
	if ( _k ) InputVerbConsume(INPUT_VERB.PRIMARY);	
	_scrb.outline(C_BLACK).align(_align[0], _align[0]).draw(_x, _y);
	_y += s;
	i++;
}

if ( is_main ) 
{
	var _sep = 12;
	var _y = ( room_height/2 ) - _sep;
	draw_sprite(sp_title, 0, room_width/2, _y + dcos((current_time+180)/10)*2);
	draw_sprite(sp_player_shop, 0, room_width/2, _y + _sep + dcos(current_time/10)*2); 
}
else
{
	scribble($"[fnt_title_outline][wave][c_red]{title}")
		.align(_align[0], _align[1])
		.outline(C_BLACK)
		.draw(_x, 32);//room_width/2, 32);	
}