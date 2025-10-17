event_inherited();
with ( Player )
{
	component_deactivate_all();
	component_activate(Component.Health);
	sprite_index = sp_player_die;
}
music_play(msc_menu, true);

var _sfx = snd_die;
with ( component_get(Component.Health, Player) )
{
	if ( get() <= 1 )
	{
		_sfx = snd_game_lose;
		music_play(undefined);
	}
}
sfx_play(_sfx);

win = true;
cards = [];
state = shop_state_init;
timer = 1;
selected = 1;
skull_x = room_width/2;
skull_y = -sprite_get_height(sp_background_skull);
eye_x = skull_x + 28;
eye_y = skull_y;
handl_x = 0;
handl_y = skull_y;
handr_x = room_width;
handr_y = skull_y;
fadeout = false;
fade = 0;
platform = Platform;

// Add components
component_add(Component.LocalInput);

// Destroy enemies
draw_enemy = undefined;
with ( Enemy )
{
	if ( global.enemy_damager == self ) 
	{
		other.draw_enemy = {
			x : x,
			y : y,
			index : image_index,
			sprite : sprite_index,
			xscale : image_xscale,
			timer : 30,
			color : C_WHITE,
			update : function(){
				if ( timer && !--timer )
				{
					timer = 10;
					if ( color == C_BLACK ) return true;
					switch(color){
						case C_WHITE : color = C_LTGRAY; break;
						case C_LTGRAY: color = C_GRAY; break;
						case C_GRAY : color = C_DKGRAY; break;
						case C_DKGRAY : color = C_BLACK; break;
					}
					return false;
				}
			}
		}
	}
	instance_destroy();
}
with ( HPToken ) instance_destroy();
global.enemy_damager = undefined;