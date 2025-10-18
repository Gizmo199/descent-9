function music_play(_sound, _sync=false){
	
	static __fade = 500;
	static __music = undefined;
	static __track_position = {};
	
	var _fade = __fade;
	var _trackpos = 0;
	if ( __music != undefined )
	{
		if ( _sound != undefined )
		{
			if ( audio_get_name(_sound) == audio_get_name(__music) ) return;
			__track_position[$ __music] = audio_sound_get_track_position(__music);
			if ( _sync ) _trackpos = __track_position[$ __music];
		}
		
		audio_sound_gain(__music, 0, _fade);
		array_push(global.__music_fadelist, __music);
		__music = undefined;
	}
	else _fade = 0;
	if ( _sound == undefined ) return;
	
	__music = audio_play_sound_on(global.emitter_music, _sound, true, 1, 0);
	__track_position[$ __music] ??= 0;
	audio_sound_set_track_position(__music, _trackpos);
	audio_sound_gain(__music, 1, _fade);
	return __music;
}