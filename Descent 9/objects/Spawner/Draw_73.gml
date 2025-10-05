var _time = round((wave_timer/wave_times[wave])*100);
scribble($"[scale, 0.5][fnt_title_outline][c_red]{_time}%[c_white] circle {wave+1}")
	.align(fa_left, fa_top)
	.outline(C_BLACK)
	.draw(8, 8)