randomize();
gpu_set_tex_filter(false);
scribble_font_set_default("fnt_text");
scribble_font_bake_outline_and_shadow("fnt_text", "fnt_text_outline", 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR, 1, false);
scribble_font_bake_outline_and_shadow("fnt_title", "fnt_title_outline", 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR, 1, false);
scribble_anim_wave(0.5, 1, 0.1);
room_goto_next();

//window_set_showborder(false);
//window_set_size(display_get_width(), display_get_height());
//window_center();
