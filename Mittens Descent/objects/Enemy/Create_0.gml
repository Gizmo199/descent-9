damage = 1;
damage_performed = false;
collision = noone;
on_collision = function(_instance){
	collision = _instance;
	event_user(0);
}
explosion = sp_explosion_small;