shake = approach(shake, 0, time);
if ( shake == 0  ) instance_destroy();
camera_set_view_pos(view_camera[0], random_range(-shake, shake), random_range(-shake, shake));