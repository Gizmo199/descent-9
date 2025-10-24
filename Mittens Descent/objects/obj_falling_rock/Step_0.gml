// Inherit the parent event
event_inherited();

// Move into position
if ( intro && y < sprite_height/2 ) 
{
	y = lerp(y, sprite_height/2, 0.3);
	exit;
}
intro = false;
			
// Wait and shake
if ( --wait > 0 )
{
	wiggle *= -1;
	x += wiggle;
	y = ( sprite_height/2 ) + random_range(-1, 1);
	exit;
}

if ( place_meeting(x, y+1, Collider) ) 
{
	score_add(x, y);
	instance_destroy();
}
			
// Fall
vsp += grv;
hsp = lerp(hsp, 0, 0.05);
y += vsp;

if ( blink && life < 2 )
{
	if ( blink_time && !--blink_time )
	{
		blink_time = blink_time_reset;
		visible = !visible;
	}
}

var _wave = 0;
with ( Spawner ) _wave = wave;
if ( place_meeting(x, y+vsp, Collider) )
{
	if ( life > 0 ) 
	{
		while ( !place_meeting(x, y+1, Collider) ) y++;
		if ( place_meeting(x, y, Hurtbox) )
		{
			score_add(x, y);
			var _hb = instance_nearest(x, y, Hurtbox);
			on_collision(_hb);
		}
		
		blink = true;
		life--;
		vsp *= -res;
		y += vsp;
		if ( _wave > 2 && sprite_index = sp_hazard_rock_large ) blink = false;
		sfx_play(sprite_index == sp_hazard_rock_large ? snd_hit_01 : snd_hit_02);
	}
	else
	{
		if ( sprite_index == sp_hazard_rock_large )
		{
			// Spawn smaller rocks			
			var _numb = 2;
			var _left = false;
			if ( _wave < 2 ) 
			{
				_numb = 0;
			}
			if ( _wave > 1 && _wave < 5 ) {
				_numb = 1;
				with ( Player ) 
				{
					if ( x > other.x ) _left = choose(true, true, false);
					else _left = choose(false, false, true);
				}
			}
			
			repeat(_numb)
			{
				with ( instance_create_layer(x, y, layer, object_index, {
					sprite_index : sp_hazard_rock_small	
				}) )
				{
					life = 2;
					hsp = ( _left ? -2 : 2 );
					vsp = abs(other.vsp/2)*-1;
					res = 0.9;
					wait = 0;
					intro = true;
					x = other.x;
					y = other.y;
				}
				_left = !_left;
			}
		}
		instance_destroy();	
	}
}

x += hsp;
if ( y < room_height ) exit;
if ( outside_room() ) 
{
	score_add(x, y);
	instance_destroy();
}