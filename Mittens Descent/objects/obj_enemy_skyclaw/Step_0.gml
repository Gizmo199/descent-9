if ( abs(angle_cur) > angle_max ) 
{
	score_add(x, y);
	instance_destroy();	
}
if ( intro )
{
	if ( y > sprite_height ) 
	{
		if ( --wait > 0 ) exit;
		intro = false;
	}
}

angle_cur += angle_spd;
x = curve_x + dcos(angle_pos + angle_cur) * distance;
y = curve_y - dsin(angle_pos + angle_cur) * distance;