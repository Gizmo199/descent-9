enum Component {
	Health,
	Damage,
	LocalInput,
	DoubleJump,
	Platformer,
	WallHang,
	MoveSpeed,
	JumpSpeed,
	Sizeof
}
#macro __entity_component_array struct_get_from_hash(self, global.__component_hash)
global.__component_hash = variable_get_hash("__COMPONENT__");
global.__component = array_create(Component.Sizeof, undefined);	

// Define components
function component_define(_enum, _constructor){
	global.__component[@ _enum] = _constructor;	
}
component_define(Component.Health, cmp_health);
component_define(Component.Damage, cmp_damage);
component_define(Component.LocalInput, cmp_localinput);
component_define(Component.DoubleJump, cmp_doublejump);
component_define(Component.Platformer, cmp_platformer);
component_define(Component.WallHang, cmp_wallhang);
component_define(Component.MoveSpeed, cmp_movespeed);
component_define(Component.JumpSpeed, cmp_jumpspeed);

