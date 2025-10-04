function instance_define(_instance, _name, _value){
	with ( _instance )
	{
		if ( !variable_instance_exists(id, _name) ) 
		{
			variable_instance_set(id, _name, _value);	
		}
	}
}