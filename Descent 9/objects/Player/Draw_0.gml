shader_set_red_replace(global.settings.hurtbox ? white : black);
draw_self();
shader_reset();
component_draw_all();