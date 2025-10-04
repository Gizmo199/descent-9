function cmp_doublejump(e) : cmp_base(e) constructor {
	
	count = 1;
	update = function(){
		
		var c = self;
		with ( entity )
		{
			if ( place_meeting(x, y + 1, Collider) ) c.count = 1;	
		}
		
		// If wall hanging, allow double jump
		if ( count > 0 ) return;
		with ( component_get(Component.WallHang, entity) ) c.count = hanging;

	}
	draw = function(){
		if ( !debug ) return;
		
		var c = self;
		with ( entity ) draw_text(bbox_right + 5, bbox_top, $"Double Jump : {c.count}");
	}
	
}