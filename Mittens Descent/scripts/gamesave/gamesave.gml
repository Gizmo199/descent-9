function gamesave(_complete=false){
		
	var buffer = buffer_create(1, buffer_grow, 1);
	var json = json_stringify(global.settings);
	buffer_write(buffer, buffer_text, json);
	buffer_save(buffer, FILENAME_SETTINGS);
	buffer_delete(buffer);
	
	if ( _complete )
	{
		if ( !file_exists(FILENAME_COMPLETE) )
		{
			var buffer = buffer_create(1, buffer_grow, 1);
			buffer_save(buffer, FILENAME_COMPLETE);
			buffer_delete(buffer);
		}
	}
}