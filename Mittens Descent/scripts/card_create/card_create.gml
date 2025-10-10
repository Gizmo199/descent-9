function card_create(_x, _card=eCard.Blank){
	
	static _height = sprite_get_height(sp_card_back);
	return instance_create_layer(_x, room_height + _height + 32, "Shop", Card, new global.__card_pool[_card]());
	
}