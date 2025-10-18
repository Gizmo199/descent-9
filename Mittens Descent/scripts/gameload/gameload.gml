function gameload(){
	
	if ( !file_exists(FILENAME_SETTINGS) ) gamesave();
	var buffer = buffer_load(FILENAME_SETTINGS);
	global.settings = json_parse(buffer_read(buffer, buffer_text));
	buffer_delete(buffer);
	
	InputBindingsImport(false, global.settings.controls.keyboard);
	InputBindingsImport(true, global.settings.controls.gamepad);
	
}