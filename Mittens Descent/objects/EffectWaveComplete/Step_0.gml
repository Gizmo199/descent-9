if ( time <= 0 )
{
	instance_destroy();
	exit;
}

time--;
var _alpha = alpha;
alpha = approach(alpha, in, 0.08);
if ( _alpha != alpha && alpha == 1 )
{
	sfx_play(snd_success);
	camera_shake(2, 5);	
}
if ( time < 15 ) in = 0;
x = room_width * alpha;
y = room_height/2;