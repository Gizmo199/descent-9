function shader_set_red_replace(_color=[1, 1, 1]){
	
	static _u_color = shader_get_uniform(sh_red_replace, "u_color");
	
	shader_set(sh_red_replace);
	shader_set_uniform_f_array(_u_color, _color);
	
}