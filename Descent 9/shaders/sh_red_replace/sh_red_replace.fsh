varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_color;
uniform float u_threshold;

void main()
{
    vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if ( color.r >= u_threshold ) color.rgb = u_color;
	gl_FragColor = color;
}
