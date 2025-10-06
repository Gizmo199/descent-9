fade = approach(fade, fade_to_play, 0.01);
draw_set_color(C_BLACK);
var _count = 4;
var _alpha = (round((fade*100)/_count)*_count)/100;
draw_set_alpha(_alpha);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);