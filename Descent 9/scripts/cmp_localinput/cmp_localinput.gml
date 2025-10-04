enum eBinding {
	
	// Base
	Left, Right, Up, Down, Primary, Secondary,
	
	// Sepcial
	Action0, Action1, Action2, Action3,
	
	// Ignore
	Sizeof
}

global.__input_mode_keyboard_hash = variable_get_hash("keyboard");
global.__input_mode_gamepad_hash = variable_get_hash("gamepad");
#macro input_mode_keyboard	global.__input_mode_keyboard_hash
#macro input_mode_gamepad	global.__input_mode_gamepad_hash

#macro gp_axislh_right	"lstick-right"
#macro gp_axislh_left	"lstick-left"
#macro gp_axislv_down	"lstick-down"
#macro gp_axislv_up		"lstick-up"
#macro gp_axisrh_right	"rstick-right"
#macro gp_axisrh_left	"rstick-left"
#macro gp_axisrv_down	"rstick-down"
#macro gp_axisrv_up		"rstick-up"
function cmp_localinput(e) : cmp_base(e) constructor {
	
	device  = 0;
	deadzone= 0.25;
	mode	= input_mode_keyboard;
	keyfunc = {
		keyboard : array_create(eBinding.Sizeof, undefined),
		gamepad : array_create(eBinding.Sizeof, undefined)
	}
	binding = {
		keyboard : array_create(eBinding.Sizeof, undefined),
		gamepad  : array_create(eBinding.Sizeof, undefined)
	}
	output = {
		keyboard : array_create(eBinding.Sizeof, false),
		gamepad  : array_create(eBinding.Sizeof, false)
	}
	
	static consume = function(_binding){
		///@func consume(binding)
		output.keyboard[@ _binding] = false;
		output.gamepad[@ _binding] = false;
	}
	static consume_all = function(){
		///@func consume_all()
		var i = 0;
		repeat(eBinding.Sizeof) consume(i++);
	}
	static set_mode = function(_mode){
		///@func set_mode(input_mode_*)
		mode = _mode;
	}
	static binding_add_key = function(_binding, _key, _keyfunc=keyboard_check){
		///@func binding_add_key(binding, keyboard_key, keyboard_function)
		binding.keyboard[@ _binding] = _key;
		keyfunc.keyboard[@ _binding] = _keyfunc;
	}
	static binding_add_gamepad = function(_binding, _gp, _buttonfunc){
		///@func binding_add_gamepad(binding, gamepad_button, gamepad_function)
		binding.gamepad[@ _binding] = _gp;
		keyfunc.gamepad[@ _binding] = _buttonfunc;
	}	
	static get = function(_binding){
		///@func get(binding)
		var _output = struct_get_from_hash(output, mode);
		return _output[@ _binding];
	}
	
	// Add keyboard bindings
	binding_add_key(eBinding.Left, vk_left);
	binding_add_key(eBinding.Right, vk_right);
	binding_add_key(eBinding.Down, vk_down);
	binding_add_key(eBinding.Up, vk_up);
	binding_add_key(eBinding.Primary, vk_space, keyboard_check_pressed);
	binding_add_key(eBinding.Secondary, vk_escape, keyboard_check_pressed);
	binding_add_key(eBinding.Action0, vk_space);
	binding_add_key(eBinding.Action1, ord("Z"));
	binding_add_key(eBinding.Action2, ord("X"));
	binding_add_key(eBinding.Action3, ord("C"));
	
	// Add gamepad bindings
	binding_add_gamepad(eBinding.Left, gp_axislh_left, gamepad_axis_value);
	binding_add_gamepad(eBinding.Right, gp_axislh_right, gamepad_axis_value);
	binding_add_gamepad(eBinding.Down, gp_axislv_down, gamepad_axis_value);
	binding_add_gamepad(eBinding.Up, gp_axislv_up, gamepad_axis_value);
	binding_add_gamepad(eBinding.Primary, gp_face1, gamepad_button_check_pressed);
	binding_add_gamepad(eBinding.Secondary, gp_start, gamepad_button_check_pressed);
	binding_add_gamepad(eBinding.Action0, gp_face1, gamepad_button_check);
	binding_add_gamepad(eBinding.Action1, gp_face2, gamepad_button_check);
	binding_add_gamepad(eBinding.Action2, gp_face3, gamepad_button_check);
	binding_add_gamepad(eBinding.Action3, gp_face4, gamepad_button_check);
	
	update = function(){
		///@func update()
		
		// Update keyboard inputs
		if ( mode == input_mode_keyboard ) return array_foreach(output.keyboard, function(v, i){
			
			if ( keyfunc.keyboard[i] == undefined ) return;
			if ( binding.keyboard[i] == undefined ) return;
			
			var _func = keyfunc.keyboard[i];
			var _key = binding.keyboard[i];
			output.keyboard[i] = _func(_key);
			
		});
		
		gamepad_set_axis_deadzone(device, deadzone);
		array_foreach(output.gamepad, function(v, i){
			
			if ( keyfunc.gamepad[i] == undefined ) return;
			if ( binding.gamepad[i] == undefined ) return;
			
			var _func = keyfunc.gamepad[i];
			var _button = binding.gamepad[i];
			if ( is_string(_button) ) 
			{
				var _v = 0;
				switch(_button)
				{
					case gp_axislh_left : _v = sign(_func(device, gp_axislh)); break;
					case gp_axislh_right: _v = sign(_func(device, gp_axislh)); break;
					case gp_axislv_up   : _v = sign(_func(device, gp_axislv)); break;
					case gp_axislv_down : _v = sign(_func(device, gp_axislv)); break;
					case gp_axisrh_left : _v = sign(_func(device, gp_axisrh)); break;
					case gp_axisrh_right: _v = sign(_func(device, gp_axisrh)); break;
					case gp_axisrv_up   : _v = sign(_func(device, gp_axisrv)); break;
					case gp_axisrv_down : _v = sign(_func(device, gp_axisrv)); break;
				}
				output.gamepad[i] = _v;
				return;
			}
			
			output.gamepad[i] = _func(_button);	
			
		});
		
	}
	
}