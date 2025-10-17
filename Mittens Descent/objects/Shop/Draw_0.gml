event_inherited();
draw_sprite_tiled(sp_background_shop, 0, 0, current_time/60);

// Draw enemy
if ( draw_enemy != undefined )
{
	try 
	{
		var _remove = draw_enemy.update();
		var _color = [
			color_get_red(draw_enemy.color)/255,
			color_get_green(draw_enemy.color)/255,
			color_get_blue(draw_enemy.color)/255
		];
		shader_set_red_replace(_color, 0.5);
		draw_sprite_ext(draw_enemy.sprite, draw_enemy.index, draw_enemy.x, draw_enemy.y, draw_enemy.xscale, 1, 0, c_white, 1);	
		shader_reset();
	
		if ( _remove ) draw_enemy = undefined;
	}
	catch(e)
	{
		draw_enemy = undefined;	
	}
}

// Wait for shake to stop
if ( instance_exists(CameraShake) ) exit;

// Base coordinates
var _x = room_width/2;
var _y = -abs(dcos(current_time/50))*6;
skull_x = lerp(skull_x, _x, 0.15);
skull_y = lerp(skull_y, _y - 8, 0.15);

// Draw behind eye
draw_sprite(sp_background_skull, 1, skull_x, skull_y);

// Draw eye
var _card = undefined;
if ( array_length(cards) > 0 ) 
{
	_card = cards[selected];
	var _ex = skull_x + 28;
	var _ey = skull_y + 34;
	var _dis = 4;
	var _dir = point_direction(eye_x, eye_y, _card.x, _card.y);

	eye_x = lerp(eye_x, _ex + dcos(_dir) * _dis, 0.15);
	eye_y = lerp(eye_y, _ey - dsin(_dir) * _dis, 0.15);
	draw_sprite(sp_background_skull_eye, 0, eye_x, eye_y);
}

// Draw skull
draw_sprite(sp_background_skull, 0, skull_x, skull_y);

// Draw Hands
var _loff = dcos(current_time/20)*8;
var _roff = dcos((current_time/20)+90)*8;
handl_y = lerp(handl_y, room_height + _loff, 0.1);
handr_y = lerp(handr_y, room_height + _roff, 0.1);
draw_sprite_ext(sp_background_skull_hands, 0, handl_x, handl_y, 1, 1, 0, c_white, 1);
draw_sprite_ext(sp_background_skull_hands, 0, handr_x, handr_y,-1, 1, 0, c_white, 1);