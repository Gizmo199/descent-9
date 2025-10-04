var i = current_time/10;
draw_sprite_stretched(sp_platform_chain, i, x-4, 0, 8, y);
draw_sprite_stretched(sp_platform_chain, i, x-4, y + sprite_height, 8, abs(room_height-bbox_bottom));
draw_self();