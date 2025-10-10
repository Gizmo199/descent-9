function card_mezzanine() : card_base() constructor {
	
	name = "Mezzanine"
	desc = "Adds a platform above hellavators";
	cost = [1, 0];
	icon = sp_card_icon_environment;
	func = function(){
		with ( Platform )
		{
			if ( mezzanine == undefined ) 
			{
				create_mezzanine();
				break;
			}
		}
	}
	odds = function(){
		if ( instance_number(Mezzanine) > 1 ) return 0;
		if ( instance_number(Mezzanine) == instance_number(Platform) ) return 0;
		return 20;
	}
	
}