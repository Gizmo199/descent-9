var _time = round((wave_timer/wave_times[wave])*100);
var _text = $"[scale, 0.5][fnt_title_outline]Wave {wave+1} [c_red]{_time}%";
if ( wave >= wave_count-1 )
{
	_text = $"[scale, 0.5][fnt_title_outline][rainbow][wave]DIE TO WIN";
	with ( component_get(Component.Health, Player) )
	{
		if ( get() == 1 )
		{
			_text = $"[scale, 0.5][fnt_title_outline]Need 1 [sp_player_hp_token, 0] to win!";
		}
	}
}
scribble(_text)
	.align(fa_left, fa_top)
	.outline(C_BLACK)
	.draw(8, 8)