instance_define(id, "fade", 0);
instance_define(id, "title", "Mittens Descent");
fade_to_play = false;

wait = 30;
timer = 1;
total = array_length(menu);
curr = 0;
array_foreach(menu, function(_func, i){
	menu[@ i] = method(self, _func);
});