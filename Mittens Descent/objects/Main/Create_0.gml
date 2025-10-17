#macro delta ( delta_time / 1000000 )
#macro PAUSE_SCREEN_FILENAME "pause_screen.png"

randomize();
gpu_set_tex_filter(false);
scribble_font_set_default("fnt_text");
scribble_font_bake_outline_and_shadow("fnt_text", "fnt_text_outline", 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR, 1, false);
scribble_font_bake_outline_and_shadow("fnt_title", "fnt_title_outline", 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR, 1, false);
scribble_anim_wave(0.25, 1, 0.1);
scribble_anim_shake(0.5, 1);
display_set_gui_size(640, 360);

global.enemy_damager = undefined;
global.emitter_music = audio_emitter_create();
global.emitter_sfx = audio_emitter_create();
global.settings = { 
	wave : 6,
	fullscreen : ( os_get_config() == "HTML" ? false : true ),
	hurtbox : false	
}
audio_emitter_gain(global.emitter_music, 0.5);
audio_emitter_gain(global.emitter_sfx, 0.5);

fadein = false;
if ( os_get_config() != "HTML" )
{
	gamewindow();
	gamefade(true);
}
else fadein = true;	
room_goto_next();


