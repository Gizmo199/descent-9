draw_sprite(sprite_index, selected, x, y + float);
if ( icon != undefined ) draw_sprite_ext(icon, index, x, y + float, 1, 1, 0, selected ? C_RED : C_LTGRAY, 1);

var _total = cost[0] + cost[1];
var _x = ( x - ( icon_w * .5 * _total )) + icon_w * .5;
var _y = bbox_top + float + 1;
var _sprite = sp_player_hp_card_outline;
if ( selected ) _sprite = sp_player_hp_highlight;

// Draw normal hp cost
repeat(cost[0])
{
	draw_sprite(_sprite, 0, _x, _y + 1);
	_x += icon_w;
}

// Draw max hp cost
repeat(cost[1])
{
	draw_sprite(_sprite, 1, _x, _y + 1);
	_x += icon_w;
}
