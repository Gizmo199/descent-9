event_inherited();
x = choose(room_width + sprite_width, -sprite_width);

image_xscale = -1;
distance = 0;
curve_x = 0;
curve_y = 0;
angle_spd = -0.5;
angle_pos = 0;
angle_max = 95;
angle_cur = 0;
intro = true;
wait = 30;
explosion = sp_explosion_medium;

var _total = instance_number(object_index);
var _max = 2;
var _wave = 0;
with ( Spawner ) _wave = wave;
if ( _wave > 4 ) _max = 3;
if ( _wave > 6 ) _max = 4;
if ( _wave > 8 ) _max = 6;
if( _total > _max ) 
{
	instance_destroy();
	exit;
}

var _wave = 0;
with ( Spawner ) _wave = wave;
switch(_wave)
{
	case 0 : break;
	case 1 :
	case 2 : wait = 20; break;
	case 3 : 
	case 4 : wait = 15; break;
	case 5 : 
		wait = 15;
		angle_spd *= 1.25;
		break;
	default:
	case 6 : 
		wait = 10;
		angle_spd *= 1.25;
		break;
}

if ( x > room_width/2 )
{
	image_xscale = 1;
	curve_x = room_width;
	angle_pos = 180;
	angle_spd *= -1;
}
with ( Player )
{
	other.distance = point_distance(other.curve_x, other.curve_y, x ,y);
}