if ( outside_room() ) exit;
if ( sprite_index != sp_hazard_rock_large ) exit;

// Check to drop hp token
var _this = id;
with ( component_get(Component.Luck, Player) )
{
	if ( random_chance(chance) ) 
	{
		var _index = 0;
		with ( component_get(Component.Health, entity) )
		{
			if ( get() == get_max() ) _index = 1;
		}
		instance_create_layer(_this.x, _this.y, _this.layer, HPToken, {
			image_index : _index	
		});
		
	}
}