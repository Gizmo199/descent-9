var _isEnd = false;
with ( Shop ) if ( state == shop_state_complete ||
				   state == shop_state_create_end_screen ||
				   state == shop_state_init ) _isEnd = true;
if ( !_isEnd && InputPressed(INPUT_VERB.START) ) gamepause();
can_pause = !_isEnd;