var _canPause = true;
with ( Player ) _canPause = can_pause;
if ( _canPause && !instance_exists(Menu) )
{
	var _icon = input_icon_text(INPUT_VERB.START);
	scribble($"[fnt_text_outline]{_icon} Pause")
		.align(fa_right, fa_bottom)
		.outline(C_BLACK)
		.draw(display_get_gui_width()-16, display_get_gui_height()-16);
}