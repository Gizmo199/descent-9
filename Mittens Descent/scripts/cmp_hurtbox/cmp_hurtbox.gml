function cmp_hurtbox(e) : cmp_base(e) constructor {
	
	hurtbox = undefined;
	sprite = sp_player_hurtbox_big;
	on_damage = function(){
		var e = entity;
		with ( Player ) if ( self == e )
		{
			hitstop(10);
			camera_shake(3, 10);
			shop_create();
		}
	};
	
	create = function(){
		var c = self;
		with ( entity )
		{
			var e = id;
			c.hurtbox ??= instance_create_layer(x, y, layer, Hurtbox, {
				sprite_index : c.sprite,
				entity : e,
				component_id : c
			});
		}
	}
	destroy = function(){
		with ( hurtbox ) instance_destroy();	
	}
	update = function(){
		
		var c = self;
		var e = entity;
		if ( !instance_exists(e) ) 
		{
			destroy();
			return;
		}
		with ( hurtbox )
		{
			image_xscale = e.image_xscale;
			x = e.x;
			y = e.bbox_top + e.sprite_height/2.5;
		}
	}
	draw = function(){
		if ( !global.settings.hurtbox ) return;	
		with ( hurtbox ) draw_self();
	}
	
	get = function(){
		return hurtbox;	
	}
	set_sprite = function(_sprite){
		///@func set_sprite(sprite)
		with ( get() )
		{
			sprite_index = _sprite;
		}	
	}
	collide = function(_instance, _damage_struct){
		///@func collide(instance)
		if ( _instance == entity ) return false;
		global.enemy_damager = _instance;
		component_add(Component.Damage, _damage_struct, entity);
		return true;
	}
	
}