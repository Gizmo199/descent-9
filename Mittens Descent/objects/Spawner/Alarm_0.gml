var _rate = wave_rates[wave];

if ( global.endless_mode ) 
{
	if ( array_length(global.cards) > 6 ) _rate = ceil(_rate/2);
	if ( array_length(global.cards) > 12) _rate = ceil(_rate/3);
}
alarm[0] = _rate;
if ( instance_exists(EffectWaveComplete) || wave_wait || instance_exists(Shop) ) 
{
	alarm[0] = 2;
	exit;
}	

var _wave_enemy = wave_enemy[wave];
var _wave_weight= wave_weight[wave];
var _wave_inst = instance_create_layer(0, 0, layer, array_get_weighted(_wave_enemy, _wave_weight));
if ( !instance_exists(_wave_inst) ) alarm[0] = 5;
