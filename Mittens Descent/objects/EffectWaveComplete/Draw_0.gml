draw_set_color(C_RED);
draw_set_alpha(alpha);
draw_rectangle(0, y - thickness, x, y + thickness, false);
draw_set_alpha(1);
if ( alpha < 1 ) exit;

scribble($"[fnt_title_outline][c_white][wave]Wave {wave}/{global.settings.wave} Complete!")
	.align(fa_center, fa_center)
	.outline(C_BLACK)
	.draw(room_width/2, y + 2, typist);