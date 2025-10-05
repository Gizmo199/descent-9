if ( !surface_exists(surface) ) surface = surface_create(room_width, room_height);
surface_set_target(surface);
draw_clear_alpha(0, 0);
draw_set_color(C_RED);
draw_circle(x, y, radius, true);
surface_reset_target();
draw_surface(surface, 0, 0);