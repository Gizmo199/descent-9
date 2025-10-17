component_add(Component.LocalInput);
component_add(Component.Platformer);
component_add(Component.Health, { hp : global.settings.wave, hp_max : global.settings.wave });
component_add(Component.Hurtbox, { sprite : sp_player_hurtbox_big });
music_play(msc_main);

white = [
	color_get_red(C_WHITE)/255,
	color_get_green(C_WHITE)/255,
	color_get_blue(C_WHITE)/255
];
black = [
	color_get_red(C_BLACK)/255,
	color_get_green(C_BLACK)/255,
	color_get_blue(C_BLACK)/255
];

timer = 1;
blink = false;
