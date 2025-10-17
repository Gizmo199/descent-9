var _fade = 1;
with ( Fade ) _fade = 1-alpha;

// Draw navigation text
var _up = InputIconGet(INPUT_VERB.UP);
var _down = InputIconGet(INPUT_VERB.DOWN);
var _left = InputIconGet(INPUT_VERB.LEFT);
var _right= InputIconGet(INPUT_VERB.RIGHT);
var _prim = InputIconGet(INPUT_VERB.PRIMARY);
_up		= ( !is_string(_up) ? $"[{sprite_get_name(_up)}, 0]" : _up );
_down	= ( !is_string(_down) ? $"[{sprite_get_name(_down)}, 0]" : _down );
_left	= ( !is_string(_left) ? $"[{sprite_get_name(_left)}, 0]" : _left );
_right	= ( !is_string(_right) ? $"[{sprite_get_name(_right)}, 0]" : _right );
_prim	= ( !is_string(_prim) ? $"[{sprite_get_name(_prim)}, 0]" : _prim );
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
		
	// Run back script
	if ( input_get(eBinding.Secondary) && !fade_to_play && !instance_exists(Fade) )
	{
		back(0);
		sfx_play(snd_blip);
		instance_destroy();
		InputVerbConsume(INPUT_VERB.SECONDARY);
	}
	
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