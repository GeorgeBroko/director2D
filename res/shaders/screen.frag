varying vec2 _varying_uv;

uniform sampler2D _texture;

void main(void) 
{
	gl_FragColor = texture2D(_texture, _varying_uv.xy);
	
	//gl_FragColor = vec4(_varying_uv.x, _varying_uv.y, _varying_uv.x, 1);
	
	//gl_FragColor = vec4(0, 0, 1, 1);
}

// Fragment shader unspoken rules!
//
// 1: Beware of reserved keywords. May cause unpredictable bugs.