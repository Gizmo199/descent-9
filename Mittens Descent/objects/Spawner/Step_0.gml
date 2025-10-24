if ( instance_exists(Shop) ) exit;
if ( wave > wave_count-1 ) 
{
	wave_wait = false;
	exit;
}
if ( instance_exists(EffectWaveComplete) ) exit;

wave_timer += delta;
if ( wave_timer >= wave_times[wave] )
{
	wave_wait = true;
	with ( Enemy ) if ( outside_room() ) instance_destroy();
	if ( instance_exists(Enemy) ) exit;
	
	with ( Enemy )
	{
		instance_destroy();
		instance_create_depth(x, y, depth, EffectOneshot, {
			sprite_index : explosion,
			image_index  : 0
		});
	}
	instance_create_layer(0, 0, "Complete", EffectWaveComplete, {
		wave : wave+1,
		text : $"WAVE {wave+1}/{global.settings.wave} COMPLETE"
	});
	sfx_play(snd_explode_all);
	redraw = true;
	wave_timer = 0;
	wave_wait = false;
	wave++;	
	if ( wave > wave_count-1 ) alarm[0] = 0;
}
