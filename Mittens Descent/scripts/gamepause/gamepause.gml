function gamepause(){
	if ( instance_exists(Pause) ) return;
	instance_create_layer(0, 0, "Pause", Pause, { fade : 0 });
}