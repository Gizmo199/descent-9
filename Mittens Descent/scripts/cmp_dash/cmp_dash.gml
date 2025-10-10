function cmp_dash(e) : cmp_base(e) constructor {
	
	dashing = false;
	update = function(){
		
		var _id = 0;
		var _ix = 0;
		var _iy = 0;
		
		with ( component_get(Component.LocalInput) )
		{
			_ix = get(eBinding.Right) - get(eBinding.Left);
			_iy = get(eBinding.Down) - get(eBinding.Up);
			_id = get(eBinding.Action1);
		}
		
	}
	
}