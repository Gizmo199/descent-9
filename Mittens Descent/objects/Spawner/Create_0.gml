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
];
wave_rates = [30, 60, 60, 60, 60, 60, 60, 60, 60];	// How often things spawn
wave_times = [10, 15, 20, 25, 30, 35, 40, 45, 50];	// How long each wave is
alarm[0] = wave_rates[wave];
redraw = true;