alarm[0] = wave_rates[wave];
if ( instance_exists(Shop) ) exit;

var _wave_enemy = wave_enemy[wave];
var _wave_weight= wave_weight[wave];
instance_create_layer(0, 0, layer, array_get_weighted(_wave_enemy, _wave_weight));
