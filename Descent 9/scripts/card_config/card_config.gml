enum eCard {
	Blank,
	KittyPhysics,
	WallClaws,
	Helevator,
	ExtendedStay,
	LandingPad,
	Zoomies,
	BirdCatcher,
	
	Sizeof
}
function card_register(_enum, _constructor){
	
	var _card = new _constructor();
	global.__card_class[@ _enum] = _card;
	global.__card_pool[@ _enum] = _constructor;
	global.__card_weights[@ _enum] = _card.get_odds;
	global.__card_limits[@ _enum] = _card.limit;
	
}
global.__card_class		= array_create(eCard.Sizeof, undefined);
global.__card_pool		= array_create(eCard.Sizeof, undefined);
global.__card_weights	= array_create(eCard.Sizeof, undefined);
global.__card_limits	= array_create(eCard.Sizeof, undefined);

// Register cards
card_register(eCard.Blank, card_blank);
card_register(eCard.KittyPhysics, card_kitty_physics);
card_register(eCard.WallClaws, card_wall_claws);
card_register(eCard.Helevator, card_helevator);
card_register(eCard.ExtendedStay, card_extended_stay);
card_register(eCard.LandingPad, card_landing_pad);
card_register(eCard.Zoomies, card_zoomies);
card_register(eCard.BirdCatcher, card_bird_catcher);