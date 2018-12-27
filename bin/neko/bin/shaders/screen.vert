attribute vec4 _position;
attribute vec2 _uv;

varying vec2 _varying_uv;

uniform mat4 _matrix;

void main(void)
{
	
	_varying_uv = _uv;
	
	gl_Position = _matrix * vec4(_position.xyz, 1); //** Matrix always before xyz!!
}

// Vertex shader unspoken rules!
//
// 1: Beware of reserved keywords. May cause unpredictable bugs. 
// 2: In gl_Position, multiply matrix with the position. Not the other way around.