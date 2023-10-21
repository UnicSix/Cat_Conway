shader_type canvas_item;

uniform float isShown=0;

void fragment() {
	
    // Time varying pixel color
    vec3 col = 1.0 + isShown*cos(TIME+UV.xyx+vec3(0,2,4));

    // Output to screen
    COLOR = vec4(col,1.0)*texture(TEXTURE,UV);
}
