time = 120;
alpha = 0;
x = 0;
y = room_height/4;
typist = scribble_typist();
thickness = 16;
in = 1;
typist.in(0.5, 0);

win = false;
had_shield = false;
if ( wave == global.settings.wave )
{
	win = true;
	text = "WAVES COMPLETE";
	had_shield = component_exists(Component.Shield, Player);
	component_remove(Component.Shield, Player);
	component_add(Component.Shield, {
		used : false,
		time : 0,
		time_max : 100000000
	}, Player);
}