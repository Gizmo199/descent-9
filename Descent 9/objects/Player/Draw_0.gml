shader_set_red_replace(global.settings.hurtbox ? white : black);
draw_self();
shader_reset();
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