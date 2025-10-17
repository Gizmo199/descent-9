if ( instance_exists(Shop) ) exit;
if ( wave == wave_count-1 ) exit;
with ( component_get(Component.Duck, Player) ) if ( ducking ) exit;
if ( instance_exists(EffectWaveComplete) ) exit;
wave_timer += delta;
if ( wave_timer >= wave_times[wave] )
{
	with ( Enemy )
	{
		instance_destroy();
		instance_create_depth(x, y, depth, EffectOneshot, {
			sprite_index : explosion,
			image_index  : 0
		});
	}
	instance_create_layer(0, 0, "Complete", EffectWaveComplete, {
		wave : wave+1
	});
	sfx_play(snd_explode_all);
	redraw = true;
	wave_timer = 0;
	wave++;	
}
