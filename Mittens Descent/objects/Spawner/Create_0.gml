wave_wait = false;
wave = 0;
wave_timer = 0;
wave_count = global.settings.wave;
wave_enemy = 
[
	[obj_falling_rock],
	[obj_falling_rock, obj_enemy_skyclaw],
	[obj_falling_rock, obj_enemy_skyclaw],
	[obj_enemy_skyclaw, obj_enemy_shrieklaw],
	[obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw],
	[obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw, obj_enemy_death],
	[obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw, obj_enemy_death],
	[obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw, obj_enemy_death],
	[obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw, obj_enemy_death],
	[obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw, obj_enemy_death]
];
wave_weight = 
[
	[100],
	[80, 20],
	[60, 40],
	[60, 40],
	[30, 50, 20],
	[20, 30, 50, 15],
	[40, 40, 10, 25],
	[20, 10, 25, 30],
	[25, 25, 25, 25],
	[10, 20, 30, 40],
	[25, 25, 25, 25]
];
wave_rates = [30, 60, 65, 65, 65, 65, 60, 55, 50, 60];	// How often things spawn
wave_times = [8, 12, 15, 20, 25, 28, 30, 33, 36, 1];	// How long each wave is
if ( global.endless_mode )
{
	wave = wave_count;
	wave_timer = 1;
	instance_create_layer(0, 0, "Complete", EffectWaveComplete, {
		wave : wave+1,
		text : $"ENDLESS MODE"
	});
}
alarm[0] = wave_rates[wave];
redraw = true;
//wave = wave_count-1;
//wave_timer = 100;

