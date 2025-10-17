function gamesave(){
	static _filename = "complete.txt";
	if ( !file_exists(_filename) )
	{
		var buffer = buffer_create(1, buffer_grow, 1);
		buffer_save(buffer, _filename);
		buffer_delete(buffer);
		return;
	}
	if ( file_exists(_filename) ) file_delete(_filename);
	gamesave();
}