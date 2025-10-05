event_inherited();
if ( instance_number(object_index) > 3 )
{
	instance_destroy();
	exit;
}

dest_x = room_width/2;
dest_y = room_height/2;
spd = 0.5;
journey = 3;
shriek = undefined;

x = ( room_width/2 ) + choose(-room_width/2, room_width/2);
y = ( room_height/2) + choose(-room_height/2, room_height/2);

with ( Player )
{
	other.dest_x = x;
	other.dest_y = y;
}

var _wave = 0;
with ( Spawner ) _wave = wave;
switch(_wave)
{
	case 0 : 
	case 1 :
	case 2 : 
	case 3 : 
	case 4 : spd = 0.5; break;
	case 5 : 
	case 6 : spd = 0.75; break;
	default: spd = 1; break;
}

// reset collision function to do nothing
on_collision = function(){};