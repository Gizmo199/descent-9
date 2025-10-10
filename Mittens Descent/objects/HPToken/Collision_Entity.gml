if ( !component_exists(Component.Health, other) ) exit;
with ( component_get(Component.Health, other) ) 
{
	if ( other.image_index == 0 ) add(1);	
	else add_max(1);
	
	sfx_play(snd_blip);
	var _is_bad = other.image_index;
	instance_create_layer(other.x, other.y, "Effects", Effect, { image_blend : ( _is_bad ? C_RED : C_WHITE )} );
}
instance_destroy();