function cmp_platformer(e) : cmp_base(e) constructor {
	
	gravity = 0.2;
	hspeed = 0;
	vspeed = 0;
	move_speed = 2;
	jump_speed = 3.5;
	coyote_time = 0;
	coyote_time_reset = 5;
	
	static speed_reset = function(){
		///@func speed_reset()
		vspeed = 0;
		hspeed = 0;
	}
	static get_movespeed = function(){
		///@func get_movespeed()
		var c = self;
		with ( component_get(Component.MoveSpeed, entity) ) return c.move_speed * mult;
		return move_speed;
	}
	static get_jumpspeed = function(){
		///@func get_jumpspeed()
		var c = self;
		with ( component_get(Component.JumpSpeed, entity) ) return c.jump_speed * mult;
		return jump_speed;
	}
	static jump = function(){

		if ( coyote_time <= 0 )
		{
			var c = self;
			with ( component_get(Component.DoubleJump, entity) )
			{
				with ( component_get(Component.WallHang, entity) ) if ( hanging ) return;
				if ( count > 0 ) 
				{
					count  = 0;
					c.vspeed = -c.get_jumpspeed();	
					sfx_play(snd_jump_02);
				}
			}
			return;
		}
		sfx_play(snd_jump_01);
		vspeed = -get_jumpspeed();
		coyote_time = 0;
		
	}
	static land = function(){
		vspeed = 0;
		coyote_time = coyote_time_reset;
		with ( entity ) while ( place_meeting(x, y, Collider) ) y--;	
	}
	static apply_gravity = function(){
		vspeed += gravity;	
	}
	update = function(){
		
		// Decrement coyote time
		coyote_time--;
		
		static _ij_prev = 0;
		var c = self;
		
		// Inputs
		var _ix = 0;
		var _iy = 0;
		var _ij = false;
		with ( component_get(Component.LocalInput, entity) )
		{
			_ix = get(eBinding.Right) - get(eBinding.Left);
			_iy = get(eBinding.Down) - get(eBinding.Up);
			_ij = get(eBinding.Action0);
		}
		
		
		// Update
		with ( entity )
		{
			var _midair = false;
			var _airspr = sp_player_jump;
			
			// See if we are hanging
			var _hanging = false;
			with ( component_get(Component.WallHang) ) _hanging = hanging;
			
			// Update hspeed
			c.hspeed = _ix * c.get_movespeed();
			while ( place_meeting(x + c.hspeed, y, Collider) )
			{
				c.hspeed = approach(c.hspeed, 0, 1);
				if ( c.hspeed == 0 ) break;
			}

			// Update vspeed
			if ( !place_meeting(x, y + 1, Collider) )
			{
				c.apply_gravity();
				_midair = true;
				if ( c.vspeed > 0 ) _airspr = sp_player_fall;
								
				while ( place_meeting(x, y + c.vspeed, Collider) && c.vspeed > 0 ) c.vspeed--;
	
			}
			else c.land();
			
			// Update jumping
			if ( _ij && !_ij_prev ) c.jump();
			if ( !_hanging && !_ij && c.vspeed < 0 ) c.vspeed = 0;
			while ( c.vspeed < 0 && place_meeting(x, y+c.vspeed, Collider) )
			{
				c.vspeed = approach(c.vspeed, 1, 1);
				if ( c.vspeed = 1 ) break;
			}
			
			// Update entity position
			x += c.hspeed;
			y += c.vspeed;
			_ij_prev = _ij;
			
			// Update entity sprite
			if ( c.hspeed != 0 ) 
			{
				sprite_index = sp_player_run;
				image_xscale = sign(c.hspeed);
			}
			else
			{
				sprite_index = sp_player_idle;	
			}
			
			if ( _midair )sprite_index = _airspr;
			if ( _hanging && sign(_ix) != 0 ) image_xscale = -sign(_ix);
			
			// Fell out of room? Damage us
			if ( outside_room() ) 
			{
				component_add(Component.Damage);
				var _shield = false;
				with ( component_get(Component.Shield) ) _shield = !used;
				
				// Wrap
				if( _shield )
				{
					if ( x > room_width ) x -= room_width;
					if ( x < 0 ) x += room_width;
					if ( y > room_height) y -= room_height;
					if ( y < 0 ) y += room_height;
				}
			}
		}
		
		// Clamp speeds
		vspeed = clamp(vspeed, -jump_speed, jump_speed);
		hspeed = clamp(hspeed, -move_speed, move_speed);
		
	}
	draw = function(){
		if ( !debug ) return;	
		draw_set_color(c_red);
		draw_set_alpha(1);
		with ( entity ) draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	}
	
}