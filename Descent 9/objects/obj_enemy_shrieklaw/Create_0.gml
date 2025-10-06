event_inherited();

dest_x = room_width/2;
dest_y = room_height/2;
spd = 1;
journey = 1;
shriek = undefined;

var _max = 3;
var _wave = 0;
with ( Spawner ) _wave = wave;
if ( _wave > 6 ) { _max = 4; journey = 2; }
if ( _wave > 8 ) { _max = 5; journey = 3; }
if ( instance_number(object_index) > _max )
{
	instance_destroy();
	exit;
}



x = ( room_width/2 ) + choose(-room_width/2, room_width/2);
y = ( room_height/2) + choose(-room_height/2, room_height/2);

with ( Player )
{
	other.dest_x = x;
	other.dest_y = y;
}

// reset collision function to do nothing
wait_time = 30;
with ( Spawner ) 
{
	if ( wave > 3 ) other.wait_time = 20;
	if ( wave > 6 ) other.wait_time = 5;
}
wait = wait_time;