function card_endless() : card_base() constructor {
	
	name = "Endless"
	desc = "Gameplay continues until death. Earn +100 points for each enemy destroyed";
	cost = [0, 0];
	icon = sp_card_icon_environment;
	index = 5;
	func = function(){
		with ( Player )
		{
			component_add(Component.Endless);
			component_add(Component.Score);
		}
	}
	odds = function(){
		return 0;
	}
	
}