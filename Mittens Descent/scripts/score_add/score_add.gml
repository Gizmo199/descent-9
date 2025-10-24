function score_add(_x, _y, _value=100){
	
	// No score if component doesn't exist
	if ( !component_exists(Component.Score, Player) ) return;
	
	_x = clamp(_x, 16, room_width-16);
	_y = clamp(_y, 8, room_height-6);
	return instance_create_layer(_x, _y, "Effects", EffectReminder, {
		value : _value
	});
}