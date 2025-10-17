instance_define(id, "fade", 0);

if ( file_exists(PAUSE_SCREEN_FILENAME) ) file_delete(PAUSE_SCREEN_FILENAME);
var _surface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
surface_set_target(_surface)
draw_clear_alpha(0, 0);
draw_surface(application_surface, 0, 0);
surface_reset_target();
	
surface_save(_surface, PAUSE_SCREEN_FILENAME);
surface_free(_surface);

sprite = sprite_add(PAUSE_SCREEN_FILENAME, 0, 0, 0, 0, 0);

instance_deactivate_all(true);
instance_activate_object(Main);
instance_activate_object(__InputUpdateController);

menu_create_main();
music = msc_main;
if ( instance_exists(Shop) ) music = msc_menu;
InputVerbConsume(INPUT_VERB.START);