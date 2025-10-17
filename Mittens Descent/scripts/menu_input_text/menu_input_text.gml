function menu_input_text(_verb, _name){
	var _icon = InputIconGet(_verb);
	_icon = ( !is_string(_icon) ? $"[{sprite_get_name(_icon)},0]" : _icon );	
	return $"{_icon}" + " " + _name;
}