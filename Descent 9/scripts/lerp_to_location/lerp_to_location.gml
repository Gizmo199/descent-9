function lerp_to_location(_inst, _destx, _desty, _speed){

	with ( _inst )
	{
		if ( x == _destx && y == _desty ) return true;
		x = lerp(x, _destx, _speed);
		y = lerp(y, _desty, _speed);
		if ( point_distance(x, y, _destx, _desty) <= 1 )
		{
			x = _destx;
			y = _desty;
			return true;
		}
	}
	return false;
	
}