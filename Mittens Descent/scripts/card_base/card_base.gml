function card_base() constructor {
	
	name = "Card";
	desc = "Card Description";
	cost = [0, 0];
	func = function(){};
	icon = undefined;
	index= 0;
	odds = function(){ return 100; }
	limit= true;
	collect = true;
	
	get_odds = function(){
		var _cost = cost;
		with ( component_get(Component.Health, Player) )
		{
			if ( hp < _cost[0]+1 or hp_max < _cost[1]+1 ) return 0;	
		}
		return odds();
	}	

}
