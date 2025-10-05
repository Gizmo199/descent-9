function outside_room(_x1=bbox_left, _y1=bbox_top, _x2=bbox_right, _y2=bbox_bottom){
	if ( !rectangle_in_rectangle(_x1, _y1, _x2, _y2, 0, 0, room_width, room_height) ) return true;
	return false;
}