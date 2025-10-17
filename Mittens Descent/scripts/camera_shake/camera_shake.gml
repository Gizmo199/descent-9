function camera_shake(_amount=1, _time=60){
	with ( CameraShake )
	{
		if ( shake >= _amount ) return;	
		instance_destroy();
	}
	return instance_create_depth(0, 0, 0, CameraShake, {
		shake : _amount,
		time  : 1/max(_time, 0)
	});
}