function card_base() constructor {
	
	name = "Blank";
	desc = "Does nothing";
	cost = [0, 0];
	func = function(){};
	icon = undefined;
	odds = function(){ return 100; }
	limit= false;
	
	get_odds = function(){
		var _cost = cost;
		with ( component_get(Component.Health, Player) )
		{
			if ( hp < _cost[0] or hp_max < _cost[1] ) return 0;	
		}
		return odds();
	}	

}
