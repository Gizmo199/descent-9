function menu_scribble(_text, _selected){
	
	//var _pretext = ( _selected ? 
	//	"[shake][sp_player_hp_highlight, 1][c_red] " :
	//	"[sp_player_hp_highlight, 0]" 
	//);
	var _pretext = ( _selected ? "[c_red][shake]" : "" );
	return scribble($"[scale, 0.75][fnt_title_outline]{_pretext}{_text}").align(fa_left, fa_center)
	
}