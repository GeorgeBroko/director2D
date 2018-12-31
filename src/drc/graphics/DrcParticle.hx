package drc.graphics;

import drc.graphics.DrcTile;
import drc.objects.DrcEntity;

class DrcParticle extends DrcEntity
{
	public var duration:Float;
	
	public var velocityX:Float;
	
	public var velocityY:Float;
	
	//** Privates.
	
	private var __time:Float = 0;
	
	public function new() 
	{
		super();
	}
	
	override public function update():Void 
	{
		__time += 0.0166;
		
		if (__time >= duration)
		{
			__scene.removeEntity(this);
			
			return;
		}
		
		x += velocityX;
		
		y += velocityY;
		
		super.update();
	}
}