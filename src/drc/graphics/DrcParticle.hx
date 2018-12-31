package drc.graphics;

import drc.graphics.DrcTile;
import drc.objects.DrcEntity;

class DrcParticle extends DrcEntity
{
	public var velocityX:Float;
	
	public var velocityY:Float;
	
	public function new() 
	{
		super();
	}
	
	override public function update():Void 
	{
		x += velocityX;
		
		y += velocityY;
		
		super.update();
	}
}