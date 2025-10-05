function shop_state_idle(){
	
	// Get inputs
	var _ix = 0;
	var _ip = 0;
	with ( component_get(Component.LocalInput) )
	{
		_ix = get(eBinding.Right) - get(eBinding.Left);	
		_ip = get(eBinding.Primary);
	}
	
	// Card selected
	if ( _ip ) 
	{
		// Goto complete state
		state = shop_state_complete;
		
		// Remove health costs
		var _card = cards[selected];
		with ( component_get(Component.Health, Player) ) apply_cost(-_card.cost[0], -_card.cost[1]);
	
		// Run selected card function
		with ( cards[selected] ) func();
		
		return;
	}
	
	if ( timer && !--timer )
	{
		var _sel = selected;
		timer = 15;
		selected = clamp(selected + _ix, 0, array_length(cards)-1);
		
		if ( _sel != selected )
		{
			var _card = cards[selected];
			with ( component_get(Component.Health, Player) ) 
			{
				highlight_reset();
				highlight_cost(_card.cost[0], _card.cost[1]);
			}
		}
	}
	if ( _ix == 0 ) timer = 1;
	
	// Update selected card
	with ( cards[selected] )
	{
		selected = true;
		var _x = x;
		with ( Player )
		{
			var _float = dcos(current_time/10) * .1;
			lerp_to_location(id, _x, y + _float, 0.1);
		}	
	}
	
}