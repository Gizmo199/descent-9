enum eCard {
	Blank,
	DoubleJump,
	WallClaws,
	Hellavator,
	Lifespan,
	LandingPad,
	Zoomies,
	BirdCatcher,
	Ducking,
	Naptime,
	Catnip,
	Redraw,
	Mezzanine,
	HighGround,
	LuckyCat,
	Impurrvious,
	
	Sizeof
}
global.__card_forced = [];
//global.__card_forced = [eCard.Mezzanine, eCard.Hellavator, eCard.LandingPad];

show_debug_message($"Total number of cards : {eCard.Sizeof}");
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
card_register(eCard.DoubleJump, card_double_jump);
card_register(eCard.WallClaws, card_wall_claws);
card_register(eCard.Hellavator, card_helevator);
card_register(eCard.Lifespan, card_lifespan);
card_register(eCard.LandingPad, card_landing_pad);
card_register(eCard.Zoomies, card_zoomies);
card_register(eCard.BirdCatcher, card_bird_catcher);
card_register(eCard.Ducking, card_duck);
card_register(eCard.Naptime, card_naptime);
card_register(eCard.Catnip, card_catnip);
card_register(eCard.Redraw, card_redraw);
card_register(eCard.Mezzanine, card_mezzanine);
card_register(eCard.HighGround, card_high_ground);
card_register(eCard.LuckyCat, card_lucky_cat);
card_register(eCard.Impurrvious, card_impurrvious);