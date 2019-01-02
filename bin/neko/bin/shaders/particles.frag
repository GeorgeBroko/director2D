uniform sampler2D _texture;

varying vec2 _varying_uv;
varying vec4 _varying_color;

void main(void) 
{
	gl_FragColor = texture2D(_texture, _varying_uv.xy) + _varying_color;
	
	//gl_FragColor = vec4(_varying_uv.x, _varying_uv.y, _varying_uv.x, 1);
	
	//gl_FragColor = vec4(1, 0, 0, 1);
}

// Fragment shader unspoken rules!
//
// 1: Beware of reserved keywords. May cause unpredictable bugs.