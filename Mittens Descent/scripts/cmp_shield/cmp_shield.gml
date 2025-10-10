function cmp_shield(e) : cmp_base(e) constructor {
	
	time = 0;
	time_max = 3;
	used = false;
	
	reset = function(){
		///@func reset()
		used = false;
		time = 0;
	}	
	update = function(){
		
		if ( used ) return;
		time += DELTA;
		if ( time >= time_max ) used = true;
		
	}
	
}