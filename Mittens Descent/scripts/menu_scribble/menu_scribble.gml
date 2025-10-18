function menu_scribble(_text, _selected){
	
	var _pretext = ( _selected ? "[c_red][wave]" : "" );
	return scribble($"[scale, 0.75][fnt_title_outline]{_pretext}{_text}");
	
}