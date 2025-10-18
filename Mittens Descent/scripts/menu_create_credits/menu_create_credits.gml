function menu_create_credits(){
	
	InputVerbConsume(INPUT_VERB.PRIMARY);
	var _menu = 
	[
		function(_selected, _pressed){
			return menu_credit_text("Programming, Music & Art", "Gizmo199", "https://gizmo199.itch.io/", _selected, _pressed);
		},
		function(_selected, _pressed){
			return menu_credit_text("Scribble", "Juju Adams", "https://www.jujuadams.com/", _selected, _pressed);
		},
		function(_selected, _pressed){
			return menu_credit_text("Input", "Offalyne", "https://github.com/offalynne/Input/", _selected, _pressed);
		},
		function(_selected, _pressed){
			return menu_credit_text("Input Icons", "Kenney", "https://kenney.nl/", _selected, _pressed);
		},
		function(_selected, _pressed){
			return menu_credit_text("Fonts", "Chequered Ink", "https://ci.itch.io/", _selected, _pressed);
		},
	];
	return instance_create_layer(0, 0, "Menu", Menu, {
		
		center : true,
		back : menu_create_main,
		fade : 0,
		menu : _menu,
		title : "Credits"
		
	});
	
}