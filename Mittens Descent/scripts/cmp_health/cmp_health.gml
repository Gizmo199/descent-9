function cmp_health(e) : cmp_base(e) constructor {
	
	hp = global.settings.wave;
	hp_max = hp;
	highlight = [];
	highlight_both = [];
	highlight_pos = [];
	effect = [undefined, undefined];
	
	draw_hp = hp;
	draw_max = hp_max;
	
	static get = function(){
		///@func get()
		return hp;	
	}
	static get_max = function(){
		///@func get_max()
		return hp_max;	
	}
	static set = function(_value){
		///@func set(value)
		var _hp = hp;
		hp = _value;
		if ( hp > _hp ) effect[0] ??= 1;
		if ( hp < _hp ) effect[0] ??= 0;
	}
	static set_max = function(_value){
		///@func set_max(value)
		var _max = hp_max;
		hp_max = _value;
		if ( hp_max > _max ) effect[1] ??= 1;
		if ( hp_max < _max ) effect[1] ??= 0;
	}
	static add = function(_value){
		///@func add(value)
		set(clamp(hp + _value, 0, hp_max));
	}
	static add_max = function(_value){
		///@func add_max(_value)
		set_max(max(hp_max + _value, 0));
	}
	static apply_cost = function(_hpcost, _maxcost){
		///@func apply_cost(hp_cost, hp_max_cost)
		add(_hpcost);
		add_max(_maxcost);
	}
	
	static highlight_update_array = function(){
		/// @func highlight_update_array()
		while ( array_length(highlight) < hp_max ) array_push(highlight, false);
		while ( array_length(highlight_both) < hp_max ) array_push(highlight_both, false);
		while ( array_length(highlight_pos) < hp_max ) array_push(highlight_pos, { x : undefined, y : undefined });
	}
	static highlight_set = function(_number, _value){
		///@func highlight_set(hp_number, value)
		if ( _number < 0 || _number > hp_max ) return;
		
		highlight_update_array();
		highlight[@ _number] = _value;
	}
	static highlight_get = function(_number){
		///@func highlight_get(hp_number)
		if ( _number < 0 || _number > hp_max ) return false;
		highlight_update_array();
		return highlight[@ _number];
	}
	static highlight_cost = function(_hpcost, _maxcost){
		///@func highlight_cost(hp_cost, maxhp_cost)
		var i = 0;
		repeat(_maxcost)
		{
			var _n = hp_max - i - 1;
			highlight_set(_n, true);
			i++;
		}
		
		i = 0;
		repeat(_hpcost)
		{
			var _n = hp-i-1;
			if ( highlight_get(_n) ) highlight_both[_n] = true;
			highlight_set(_n, true);	
			i++;
		}
	}
	static highlight_reset = function(){
		///@func highlight_reset()
		highlight_update_array();
		
		var i = 0;
		repeat(array_length(highlight)){
			highlight[i] = false;
			highlight_both[i] = false;
			i++;
		}
	}
	
	draw = function(){
		
		highlight_update_array();
	
		static _sprite_width = sprite_get_width(sp_player_hp);	
		static _sprite_height= sprite_get_height(sp_player_hp);
		var _x = ( room_width/2 ) - ( _sprite_width * 0.5 * draw_max ) + _sprite_width/2;
		var _y = 12;
		var i = 0;
		repeat(draw_max)
		{
			var _index = ( i >= draw_hp );
			var _drawboth = highlight_both[i];
			var _sprite = ( highlight[i] ? sp_player_hp_highlight : sp_player_hp );
						
			var xx = _x;
			var yy = _y;
			if ( _sprite = sp_player_hp_highlight )
			{
				xx += random_range(-0.25, 0.25);
				yy += random_range(-0.25, 0.25);
			}
			
			// Create hp effects
			var _min = draw_hp;
			var _max = _min + ( hp - draw_hp );
			if ( _min > _max )
			{
				var _swp = _max;
				_max = _min;
				_min = _swp;
			}
			if (( i >= _min && i < _max ) && effect[0] != undefined )
			{
				if ( effect[0] ) instance_create_layer(xx, yy, "Effects", Effect, { image_blend : C_WHITE });
				else instance_create_layer(xx, yy, "Effects", Effect, { bad : true, image_blend : C_WHITE });
			}
			
			// Create maxhp effects
			var _min = draw_max;
			var _max = _min + ( hp_max - draw_max );
			if ( _min > _max )
			{
				var _swp = _max;
				_max = _min;
				_min = _swp;
			}
			if (( i >= _min && i < _max ) && effect[1] != undefined )
			{
				if ( effect[1] ) instance_create_layer(xx, yy, "Effects", Effect, { image_blend : C_RED });
				else instance_create_layer(xx, yy, "Effects", Effect, { bad : true, image_blend : C_RED });
			}
			
			var _pos = highlight_pos[i];
			_pos.x ??= xx;
			_pos.y ??= -12;
			_pos.x = lerp(_pos.x, xx, 0.2);
			if ( abs(_pos.x - xx) < 1 ) _pos.x = xx;
			if ( _pos.x == xx ) _pos.y = lerp(_pos.y, yy, 0.2);
			
			draw_sprite(_sprite, _index, _pos.x, _pos.y);
			if ( _drawboth ) draw_sprite(_sprite, !_index, _pos.x, _pos.y + _sprite_height/2);
			_x += _sprite_width;
			i++;
		}
		
		// Reset effects
		effect[0] = undefined;
		effect[1] = undefined;
		
		if ( instance_exists(Effect) ) return;
		draw_max = hp_max;
		draw_hp = hp;
		
	}
}