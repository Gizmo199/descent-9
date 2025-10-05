function cmp_health(e) : cmp_base(e) constructor {
	
	hp = 1;
	hp_max = 1;
	highlight = [];
	highlight_both = [];
	
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
		hp = _value;
	}
	static set_max = function(_value){
		///@func set_max(value)
		hp_max = _value;
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
		var _x = ( room_width/2 ) - ( _sprite_width * 0.5 * hp_max ) + _sprite_width/2;
		var _y = 12;
		var i = 0;
		repeat(hp_max)
		{
			var _index = ( i >= hp );
			var _drawboth = highlight_both[i];
			var _sprite = ( highlight[i] ? sp_player_hp_highlight : sp_player_hp );
			
			var xx = _x;
			var yy = _y;
			if ( _sprite = sp_player_hp_highlight )
			{
				xx += random_range(-0.25, 0.25);
				yy += random_range(-0.25, 0.25);
			}
			
			draw_sprite(_sprite, _index, xx, yy);
			if ( _drawboth ) draw_sprite(_sprite, !_index, xx, yy + _sprite_height/2);
			_x += _sprite_width;
			i++;
		}
		
	}
}