function array_get_weighted(_array, _weight, _indexOnly=false){
	
	// Add weights to total and run weight functions
	var i = 0;
	var _total = 0;
	var _weights = [];
	repeat(array_length(_weight))
	{
		var _w = _weight[i];
		if ( is_method(_w) ) _w = _w();		
		array_push(_weights, _w);
		_total += _w;
		i++
	}
	
	// Get weighted entry
	var _n = random(_total), i = 0;
	repeat(array_length(_array))
	{
		if ( _n < _weights[i] ) return ( _indexOnly ? i : _array[i] );
		_n = max(_n - _weights[i], 0);
		i++;
	}
	
	// Try again if no card was obtained
	return array_get_weighted(_array, _weight, _indexOnly);
	
}