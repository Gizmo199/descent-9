image_xscale = sign(hspeed);

// Score
var _this = id;
with ( Player )
{
	if ( !_this.scored && point_distance(_this.x, _this.y, x, y) < 100 )
	{
		if ( _this.image_xscale == 1 ) 
		{
			if ( _this.bbox_left > x )
			{
				_this.scored = true;
				score_add(_this.x, _this.y);	
			}
		}
		else
		{
			if ( _this.bbox_right < x )
			{
				_this.scored = true;
				score_add(_this.x, _this.y);	
			}
		}
	}
}

if ( outside_room() ) instance_destroy();