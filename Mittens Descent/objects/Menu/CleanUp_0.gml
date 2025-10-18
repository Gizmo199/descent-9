if ( !card ) exit;
if ( array_length(global.card_instance) > 0 )
{
	array_foreach(global.card_instance, function(_card){
		instance_destroy(_card);
	});
}
global.card_instance = [];