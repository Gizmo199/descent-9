function menu_create_remap(_verb, _name){
	
	global.__inputVerbRebinding = _verb;
	global.__inputVerbRebindingName = _name;
	var _menu = 
	[
		function(_selected, _pressed){
			var _device = InputPlayerGetDevice();
			InputDeviceSetRebinding(_device, true);
						
			if ( InputDeviceGetRebinding(_device) )
			{
				var _binding = InputDeviceGetRebindingResult(_device);
				if( _binding != undefined )
				{
					if ( global.__inputVerbRebinding = INPUT_VERB.JUMP ) 
					{
						InputBindingSet(InputDeviceIsGamepad(_device), global.__inputVerbRebinding, _binding);
					}
					else
					{
						InputBindingSetSafe(InputDeviceIsGamepad(_device), global.__inputVerbRebinding, _binding);
					}
					InputDeviceSetRebinding(_device, false);
					menu_create_controls();
					instance_destroy();
				}
			}			
			return menu_scribble($"[wave][fnt_text_outline]Press any button to remap {global.__inputVerbRebindingName}", _selected);
		}
	];
	return instance_create_layer(0, 0, "Menu", Menu, {
		
		center : true,
		fade : 0,
		menu : _menu,
		title : "Remapping"
		
	});
	
}