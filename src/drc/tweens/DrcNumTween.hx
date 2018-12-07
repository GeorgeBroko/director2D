package drc.tweens;

import drc.tweens.DrcTween;

class DrcNumTween extends DrcTween
{
	//** Publics.
	
	@:isVar
	public var value:Float = 0; //** Define metadata isVar.
	
	//** Privates.
	
	/** @private **/ private var __startValue:Float;
	
	/** @private **/ private var __rangeValue:Float;
	
	public function new(type:DrcTweenType) 
	{
		super(0, type);
	}
	
	public function tween(from:Float, to:Float, duration:Float):Void
	{
		__startValue = value = from;
		
		__rangeValue = to - value;
		
		__target = duration;
		
		start();
	}
	
	override public function update():Void 
	{
		super.update();
		
		value = __startValue + __rangeValue * _t;
	}
}