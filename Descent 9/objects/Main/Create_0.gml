#macro DELTA ( delta_time / 1000000 )

randomize();
gpu_set_tex_filter(false);
scribble_font_set_default("fnt_text");
scribble_font_bake_outline_and_shadow("fnt_text", "fnt_text_outline", 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR, 1, false);
scribble_font_bake_outline_and_shadow("fnt_title", "fnt_title_outline", 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR, 1, false);
scribble_anim_wave(0.25, 1, 0.1);

global.enemy_damager = undefined;
global.emitter_music = audio_emitter_create();
global.emitter_sfx = audio_emitter_create();
//audio_emitter_gain(global.emitter_music, 0);
//audio_emitter_gain(global.emitter_sfx, 0);

global.settings = {
	hurtbox : false	
}

room_goto_next();



//window_set_showborder(false);
//window_set_size(display_get_width(), display_get_height());
//window_set_position(1920, 0);
//window_center();
