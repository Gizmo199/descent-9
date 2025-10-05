if ( !component_exists(Component.Health, other) ) exit;
with ( component_get(Component.Health, other) ) 
{
	if ( other.image_index == 0 ) add(1);	
	else add_max(1);
}
instance_destroy();