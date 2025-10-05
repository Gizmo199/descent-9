if ( !instance_exists(platform) ) 
{
	instance_destroy();
	exit;
}
x = platform.x;
y = platform.bbox_top + 2;
image_xscale = platform.image_xscale;