function component_exists(_component, _entity=self){
	with ( _entity ) return ( component_get(_component) != undefined );
}