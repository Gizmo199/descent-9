wave = 3;
wave_timer = 0;
wave_count = 9;
wave_enemy = 
[
	/*wave 1*/ [obj_falling_rock, obj_enemy_skyclaw],
	/*wave 2*/ [obj_falling_rock, obj_enemy_skyclaw],
	/*wave 3*/ [obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw],
	/*wave 4*/ [obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw],
	/*wave 5*/ [obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw],
	/*wave 6*/ [obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw],
	/*wave 7*/ [obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw],
	/*wave 8*/ [obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw],
	/*wave 9*/ [obj_falling_rock, obj_enemy_skyclaw, obj_enemy_shrieklaw]
];
wave_weight = 
[
	[80, 20],
	[60, 40],
	[40, 33, 60],
	[33, 33, 33],
	[33, 33, 33],
	[33, 33, 33],
	[33, 33, 33],
	[33, 33, 33],
	[33, 33, 33]
];
wave_rates = [30, 45, 45, 45, 30, 30, 30, 30, 30];	
wave_times = [10, 15, 30, 30, 45, 60, 60, 60, 90];
alarm[0] = wave_rates[wave];
redraw = true;