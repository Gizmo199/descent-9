draw_set_color(C_GRAY);
draw_rectangle(0, y - thickness, x, y + thickness, false);
if ( alpha < 1 ) exit;

scribble($"[fnt_title_outline][c_white][wave]{text}")
	.align(fa_center, fa_center)
	.outline(C_BLACK)
	.draw(room_width/2, y + 4, typist);