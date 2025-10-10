if ( instance_exists(Shop) ) exit;
if ( wave == wave_count-1 ) exit;
with ( component_get(Component.Duck, Player) ) if ( ducking ) exit;

wave_timer += DELTA;
if ( wave_timer >= wave_times[wave] )
{
	redraw = true;
	wave_timer = 0;
	wave++;	
}
