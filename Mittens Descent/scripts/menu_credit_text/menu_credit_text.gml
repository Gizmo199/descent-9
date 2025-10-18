function menu_credit_text(_about, _author, _url, _selected, _pressed){
	
	if ( _selected && _pressed )
	{
		sfx_play(snd_blip);
		url_open(_url);
	}
	var _col = "[c_red]"
	if ( _selected ) _col = "[c_white]";
	return menu_scribble($"[fnt_text]{_about} [fnt_title]{_col}{_author}", _selected);
	
}