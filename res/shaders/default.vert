attribute vec4 _position;
attribute vec2 _uv;

varying vec2 _varying_uv;

uniform mat4 _matrix;

void main(void) 
{
	_varying_uv = _uv;
	
	vec3 _fixed_position;
	
	float cosT = cos(_position.w * (3.14159 / 180.0));
	float sinT = sin(_position.w * (3.14159 / 180.0));
	
	//_fixed_position.x = (_position.x * cosT) - (_position.y * sinT);
	//_fixed_position.y = (_position.x * sinT) + (_position.y * cosT);
	//_fixed_position.z = _position.z;
	
	gl_Position = _matrix * vec4(_position.xyz, 1); //** Matrix always before xyz!!
	
	//gl_PointSize = 10;
	
	//gl_Position = vec4(0, 0, 0, 1);
}

// Vertex shader unspoken rules!
//
// 1: Beware of reserved keywords. May cause unpredictable bugs. 
// 2: In gl_Position, multiply matrix with the position. Not the other way around.