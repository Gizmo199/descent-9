function gamewindow(){
	
	if ( global.settings.fullscreen )
	{
		window_set_showborder(false);
		window_set_size(display_get_width(), display_get_height());
		window_center();
	}
	else
	{
		window_set_showborder(true);
		window_set_size(display_get_width()/2, display_get_height()/2);
		window_center();
	}
		
}