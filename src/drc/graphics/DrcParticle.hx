package drc.graphics;

import drc.objects.DrcEntity;

class DrcParticle extends DrcEntity
{
	public var duration:Float;
	
	public var velocityX:Float;
	
	public var velocityY:Float;
	
	public var gravity:Float;
	
	public var rotation:Float;
	
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
		
		graphic.angle += rotation;
		
		x += velocityX * 2;
		
		y += (velocityY * 5) + (gravity * __time);
		
		super.update();
	}
}