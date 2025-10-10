offset = irandom_range(0, 360);
hsp = 0;
time = 1;
time_reset = 5;
ypos = y;

mezzanine = undefined;
create_mezzanine = function(){
	var _this = self;
	mezzanine ??= instance_create_layer(x, y, layer, Mezzanine, {
		platform : _this
	});
}