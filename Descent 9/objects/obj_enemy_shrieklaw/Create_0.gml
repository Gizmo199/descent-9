event_inherited();
if ( instance_number(object_index) > 3 )
{
	instance_destroy();
	exit;
}

dest_x = room_width/2;
dest_y = room_height/2;
spd = 1;
journey = 1;
shriek = undefined;

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
}
wait = wait_time;