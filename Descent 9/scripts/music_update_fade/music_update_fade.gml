global.__music_fadelist = [];
function music_update_fade(){
	global.__music_fadelist = array_filter(global.__music_fadelist, function(_track){
		if ( audio_sound_get_gain(_track) <= 0 )
		{
			audio_stop_sound(_track);
			return false;
		}
		return true;
	});
}