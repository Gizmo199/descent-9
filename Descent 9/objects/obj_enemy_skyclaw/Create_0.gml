event_inherited();
x = choose(room_width + sprite_width, -sprite_width);

image_xscale = -1;
distance = 0;
curve_x = 0;
curve_y = 0;
angle_spd = -0.5;
angle_pos = 0;
angle_max = 180;
angle_cur = 0;
intro = true;
wait = 30;

var _wave = 0;
with ( Spawner ) _wave = wave;
switch(_wave)
{
	case 0 : break;
	case 1 :
	case 2 : wait = 20; break;
	case 3 : 
	case 4 : wait = 10; break;
	case 5 : 
		wait = 10;
		angle_spd *= 1.5;
		break;
	case 6 : 
	default:
		wait = 0;
		angle_spd *= 2;
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