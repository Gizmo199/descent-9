function card_base() constructor {
	
	name = "Card";
	desc = "Card Description";
	cost = [0, 0];
	func = function(){};
	icon = undefined;
	odds = function(){ return 100; }
	limit= true;
	
	get_odds = function(){
		var _cost = cost;
		with ( component_get(Component.Health, Player) )
		{
			if ( hp < _cost[0]+1 or hp_max < _cost[1]+1 ) return 0;	
		}
		return odds();
	}	

}
