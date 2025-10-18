var _fade = 1;
with ( Fade ) _fade = 1-alpha;

// Draw navigation text
var _up = input_icon_text(INPUT_VERB.UP);
var _down = input_icon_text(INPUT_VERB.DOWN);
var _left = input_icon_text(INPUT_VERB.LEFT);
var _right = input_icon_text(INPUT_VERB.RIGHT);
var _prim = input_icon_text(INPUT_VERB.PRIMARY);
var _text = $"{_prim} Accept\n{_right}{_up}{_left}{_down} Navigate";

// Draw nav text
scribble(_text)
	.align(fa_right, fa_bottom)
	.outline(C_BLACK)
	.blend(c_white, _fade)
	.draw(display_get_gui_width() - 16, display_get_gui_height() - 16);

// Draw back text
if ( back != undefined )
{
	var _back = InputIconGet(INPUT_VERB.SECONDARY);
	_back = ( !is_string(_back) ? $"[{sprite_get_name(_back)}, 0]" : _back );
	_text = $"{_back} Back";	

	scribble(_text)
		.align(fa_right, fa_top)
		.outline(C_BLACK)
		.blend(c_white, _fade)
		.draw(display_get_gui_width() - 16, 16);
}



// Draw fade
fade = approach(fade, fade_to_play, 0.01);
draw_set_color(C_BLACK);
var _count = 4;
var _alpha = (round((fade*100)/_count)*_count)/100;
draw_set_alpha(_alpha);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);