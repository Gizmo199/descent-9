fade = lerp(fade, 1, 0.1);
draw_sprite_stretched(sprite, 0, 0, 0, room_width, room_height);
draw_set_color(C_BLACK);
draw_set_alpha(fade * 0.75);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
