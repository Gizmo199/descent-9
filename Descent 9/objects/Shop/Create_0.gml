event_inherited();
with ( Player )
{
	component_deactivate_all();
	component_activate(Component.Health);
}

music_play(msc_menu, true);

cards = [];
state = shop_state_init;
timer = 1;
selected = 1;
skull_x = room_width/2;
skull_y = -sprite_get_height(sp_background_skull);
eye_x = skull_x + 28;
eye_y = skull_y;
handl_x = 0;
handl_y = skull_y;
handr_x = room_width;
handr_y = skull_y;

// Add components
component_add(Component.LocalInput);

// Destroy enemies
with ( Enemy ) instance_destroy();