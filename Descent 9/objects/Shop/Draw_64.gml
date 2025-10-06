// Inherit the parent event
event_inherited();

if ( !fadeout ) exit;
fade = approach(fade, 1, 0.01);
var _fade_count = 4;
draw_set_color(C_BLACK);
draw_set_alpha((round((fade*100)/_fade_count)*_fade_count)/100);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);