function gamefade(_in=true, _func=function(){}){
	if ( instance_exists(Fade) ) return;
	return instance_create_depth(0, 0, -1000000, Fade, {
		
		time : 60,
		fadein : _in,
		func : _func
		
	});
}