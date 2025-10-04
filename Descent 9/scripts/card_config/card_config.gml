enum eCard {
	Blank,
	KittyPhysics,
	WallClaws,
	Helevator,
	
	Sizeof
}
function card_register(_enum, _constructor){
	
	var _card = new _constructor();
	global.__card_class[@ _enum] = _card;
	global.__card_pool[@ _enum] = _constructor;
	global.__card_weights[@ _enum] = _card.odds;
	global.__card_limits[@ _enum] = _card.limit;
	
}
global.__card_class		= array_create(eCard.Sizeof, undefined);
global.__card_pool		= array_create(eCard.Sizeof, undefined);
global.__card_weights	= array_create(eCard.Sizeof, undefined);
global.__card_limits	= array_create(eCard.Sizeof, undefined);

// Register cards
card_register(eCard.Blank, card_base);
card_register(eCard.KittyPhysics, card_kittyphysics);
card_register(eCard.WallClaws, card_wallclaws);
card_register(eCard.Helevator, card_helevator);