vsp += grv;
if ( place_meeting(x, y+vsp, Collider) )
{
	if ( vsp > 0 ) while ( place_meeting(x, y, Collider) ) y--;
	vsp *= -0.75;
	if ( abs(vsp) < 0.1 ) vsp = 0;
}
y += vsp;

if ( --wait <= 0 )
{
	if ( timer && !--timer )
	{
		timer = 5;
		visible = !visible;
	}
	if ( destroy_time && !--destroy_time ) instance_destroy();
}
