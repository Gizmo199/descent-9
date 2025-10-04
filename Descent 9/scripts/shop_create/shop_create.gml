function shop_create(){
	if ( instance_exists(Shop) ) return;
	return instance_create_layer(0, 0, "Shop", Shop);
}