instance_define(id, "name", "Card");
instance_define(id, "desc", "Card Description");
instance_define(id, "cost", [0, 0]);
instance_define(id, "func", function(){});

selected = false;
icon_w = sprite_get_width(sp_player_hp);
float = 0;
number = instance_number(Card);
wait = ( number - 1 ) * 20;
