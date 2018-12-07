varying vec2 _varying_uv;

uniform sampler2D _texture;

uniform vec4 _a;
uniform vec4 _b;

void main(void) 
{
	vec4 test = _a;
	
	gl_FragColor = texture2D(_texture, _varying_uv.xy) + _b;
	//gl_FragColor = _d;
	
	//gl_FragColor = vec4(_varying_uv.x, _varying_uv.y, _varying_uv.x, 1);
	
	//gl_FragColor = vec4(1, 0, 0, 1);
}

// Fragment shader unspoken rules!
//
// 1: Beware of reserved keywords. May cause unpredictable bugs.