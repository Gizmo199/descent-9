with ( Entity )
{
	with ( component_get(Component.Platformer) ) speed_reset();
	with ( component_get(Component.Health) ) highlight_reset();	
	with ( component_get(Component.Shield) ) reset();
	component_activate_all();
}
array_foreach(cards, instance_destroy);
if ( !fadeout ) music_play(msc_main, true);
with ( Spawner ) 
{
	alarm[0] = 30;
	if ( !other.endless_check ) exit;
	instance_create_layer(0, 0, "Complete", EffectWaveComplete, {
		wave : wave+1,
		text : $"ENDLESS MODE"
	});
	
	// Restore player HP and MAX HP
	with ( component_get(Component.Health, Player) )
	{
		while ( get_max() < 9 ) add_max(1);
		while ( get() < 9 ) add(1);
	}
}

