if ( time <= 0 )
{
	func();
	instance_destroy();
	exit;
}

if ( fadein )
{
	alpha = time/time_max;
}
else
{
	alpha = 1-(time/time_max);
}
time--;