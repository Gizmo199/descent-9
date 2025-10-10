if ( fade_to_play && fade >= 1 ) 
{
	if ( --wait <= 0 ) room_goto(rm_play);
	exit;
}
var _iy = ( keyboard_check(vk_down) - keyboard_check(vk_up) );
if ( fade_to_play ) _iy = 0;
if ( sign(_iy) != 0 )
{
	var _curr = curr;
	if ( timer && !--timer )
	{
		timer = 12;
		curr = clamp(curr + _iy, 0, total-1);
	}
	if ( _curr != curr ) sfx_play(snd_flick);
}
else timer = 1;