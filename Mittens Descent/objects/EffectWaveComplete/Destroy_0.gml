if ( !win ) exit;
shop_create();
component_remove(Component.Shield, Player);
if ( had_shield )
{
	with ( Player ) component_add(Component.Shield);
	with ( component_get(Component.Shield, Player) )
	{
		used = true;
		time = time_max;
	}
}
