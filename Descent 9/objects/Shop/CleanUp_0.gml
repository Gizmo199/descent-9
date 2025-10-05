with ( Entity )
{
	with ( component_get(Component.Platformer) ) speed_reset();
	with ( component_get(Component.Health) ) highlight_reset();	
	component_activate_all();
}
array_foreach(cards, instance_destroy);
music_play(msc_main, true);
with ( Spawner ) alarm[0] = 30;
