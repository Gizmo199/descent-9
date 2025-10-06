#macro DELTA ( delta_time / 1000000 )

randomize();
gpu_set_tex_filter(false);
scribble_font_set_default("fnt_text");
scribble_font_bake_outline_and_shadow("fnt_text", "fnt_text_outline", 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR, 1, false);
scribble_font_bake_outline_and_shadow("fnt_title", "fnt_title_outline", 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR, 1, false);
scribble_anim_wave(0.25, 1, 0.1);
scribble_anim_shake(0.5, 1);

global.enemy_damager = undefined;
global.emitter_music = audio_emitter_create();
global.emitter_sfx = audio_emitter_create();
global.settings = { 
	fullscreen : false,
	hurtbox : false	
}

room_goto_next();
