function input_icon_text(_verb){
	var _icon = InputIconGet(_verb);
		_icon = ( !is_string(_icon) ? $"[{sprite_get_name(_icon)}, 0]" : _icon );
	return _icon;
}