enum Component {
	Health,
	Damage,
	LocalInput,
	JumpDestroy,
	DoubleJump,
	Platformer,
	Duck,
	Naptime,
	WallHang,
	MoveSpeed,
	JumpSpeed,
	Hurtbox,
	Shield,
	Luck,
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
component_define(Component.Duck, cmp_duck);
component_define(Component.WallHang, cmp_wallhang);
component_define(Component.MoveSpeed, cmp_movespeed);
component_define(Component.JumpSpeed, cmp_jumpspeed);
component_define(Component.Naptime, cmp_naptime);
component_define(Component.Hurtbox, cmp_hurtbox);
component_define(Component.Luck, cmp_luck);
component_define(Component.Shield, cmp_shield);
component_define(Component.JumpDestroy, cmp_jumpdestroy);