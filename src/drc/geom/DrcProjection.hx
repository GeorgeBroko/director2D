package drc.geom;

import openfl.Vector;

class DrcProjection extends DrcMatrix
{
	public function new() 
	{
		super();
	}
	
	public function orthographic(width:Float, height:Float, zNear:Float, zFar:Float):Void
	{
		var sx = 1 / 320;
		var sy = 1 / 240;
		var sz = 1 / (zFar - zNear);
		
		this.copyRawDataFrom(Vector.ofArray([
		sx, 0.0, 0.0, 0.0,
		0.0, -sy, 0.0, 0.0, 
		0.0, 0.0, (zFar - zNear), 0, 
		-1, 1, zNear / (zNear - zFar), 1.0]));
	}
	
	public function orthographicFlipped(width:Float, height:Float, zNear:Float, zFar:Float):Void
	{
		var sx = 1 / 320;
		var sy = 1 / 240;
		var sz = 1 / (zFar - zNear);
		
		this.copyRawDataFrom(Vector.ofArray([
		sx, 0.0, 0.0, 0.0,
		0.0, sy, 0.0, 0.0,
		0.0, 0.0, (zFar - zNear), 0, 
		0, 0, zNear / (zNear - zFar), 1.0]));
	}
}