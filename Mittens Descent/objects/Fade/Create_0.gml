instance_define(id, "time", 300);
instance_define(id, "func", function(){
	room_goto(rm_menu);
});
instance_define(id, "fadein", true);
alpha = ( fadein ? 1 : 0 );
time_max = time;