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
		with ( cards[selected] )
		{
			func();
			if ( collect ) 
			{
				array_push(global.cards, {
					name	: name, 
					desc	: desc,
					cost	: cost,
					icon	: icon,
					index	: index
				});
			}
		}
		sfx_play(snd_blip);
		sfx_play(choose(snd_spend_01, snd_spend_02));
		
		// Select which platform to make player hover to
		platform = instance_find(Platform, irandom(instance_number(Platform)-1));
		return;
	}
	
	if ( timer && !--timer )
	{
		var _sel = selected;
		timer = 15;
		selected = clamp(selected + _ix, 0, array_length(cards)-1);
		
		if ( _sel != selected )
		{
			sfx_play(snd_flick);
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
		var _y = bbox_top - 8;
		with ( Player )
		{
			var _float = dcos(current_time/10) * .1;
			lerp_to_location(id, _x, _y + _float, 0.1);
		}	
	}
	
}