if ( damage_performed ) exit;

var _this = self;
var _damage = damage;
with ( other.component_id ) other.damage_performed = collide(_this, { amount : _damage });