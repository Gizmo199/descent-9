#macro delta ( delta_time / 1000000 )
#macro PAUSE_SCREEN_FILENAME "pause_screen.png"
#macro FILENAME_SETTINGS "settings.txt"
#macro FILENAME_COMPLETE "complete.txt"

randomize();
gpu_set_tex_filter(false);
scribble_font_set_default("fnt_text");
scribble_font_bake_outline_and_shadow("fnt_text", "fnt_text_outline", 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR, 1, false);
scribble_font_bake_outline_and_shadow("fnt_title", "fnt_title_outline", 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR, 1, false);
scribble_anim_wave(0.33, 1, 0.1);
scribble_anim_shake(0.5, 1);
display_set_gui_size(640, 360);
window_set_cursor(cr_none);

global.new_highscore = false;
global.cards = [];
global.card_instance = [];
global.enemy_damager = undefined;
global.emitter_music = audio_emitter_create();
global.emitter_sfx = audio_emitter_create();
global.settings = { 
	wave : 6,
	fullscreen : ( os_get_config() == "HTML" ? false : true ),
	hurtbox : false,
	controls : 
	{
		keyboard : InputBindingsExport(false),
		gamepad  : InputBindingsExport(true)
	},
	volume : 
	{
		music : 0.5,
		sfx : 0.5
	},
	highscore : 0
}
gameload();
audio_emitter_gain(global.emitter_music, global.settings.volume.music);
audio_emitter_gain(global.emitter_sfx, global.settings.volume.sfx);

fadein = false;
if ( os_get_config() != "HTML" )
{
	gamewindow();
	gamefade(true);
}
else fadein = true;	
room_goto_next();


