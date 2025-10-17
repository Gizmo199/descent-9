enum eBinding {
	
	// Base
	Left, 
	Right,
	Up, 
	Down,
	Primary,
	Secondary,
	
	// Ignore
	Sizeof
}
function cmp_localinput(e) : cmp_base(e) constructor {
	
	static get = function(_binding){
		return input_get(_binding);
	}
	
}