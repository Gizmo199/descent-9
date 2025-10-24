vspeed = lerp(vspeed, 0, 0.08);
if ( time < 20 )
{
	visible = max(sign(dcos(current_time*4)), 0);
}
if ( time <= 0 ) instance_destroy();
time--;

if ( timer && !--timer ) 
{
	timer = 5;
	color = !color;
}