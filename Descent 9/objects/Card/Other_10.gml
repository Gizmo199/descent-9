draw_sprite(sprite_index, selected, x, y + float);
if ( icon != undefined ) draw_sprite(icon, 0, x, y + float);

var _total = cost[0] + cost[1];
var _x = ( x - ( icon_w * .5 * _total )) + icon_w * .5;
var _y = bbox_top + float + 1;
var _sprite = sp_player_hp_card_outline;
if ( selected ) _sprite = sp_player_hp_highlight;

// Draw normal hp cost
repeat(cost[0])
{
	draw_sprite(_sprite, 0, _x, _y);
	_x += icon_w;
}

// Draw max hp cost
repeat(cost[1])
{
	draw_sprite(_sprite, 1, _x, _y);
	_x += icon_w;
}
