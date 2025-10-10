var _blink = false;
with ( component_get(Component.Shield) ) if ( !used ) _blink = true;
if ( _blink )
{
	if ( timer && !--timer ) 
	{
		timer = 2;
		blink = !blink;
	}
}
else
{
	blink = false;
	timer = 1;
}

if ( !blink )
{
	shader_set_red_replace(global.settings.hurtbox ? white : black, 0.99);
	draw_self();
	shader_reset();
}
component_draw_all();

if ( !instance_exists(Shop) )
{
	with ( Mezzanine ) 
	{
		image_index = 1;
		draw_self();
		image_index = 0;
	}
}
with ( component_get(Component.Naptime) ) automatic_draw = false;
component_draw(Component.Naptime);