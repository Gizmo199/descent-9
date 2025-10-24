var _color = ( color ? "[c_red]" : "[c_white]" );
scribble(_color + $"[wave][scale, 0.5][fnt_text_outline]{value}")
	.align(fa_center, fa_center)
	.outline(C_BLACK)
	.draw(x, y);