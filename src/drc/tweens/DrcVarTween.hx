package drc.tweens;

import drc.tweens.DrcTween;
import drc.tweens.DrcTweenType;

class DrcVarTween extends DrcTween
{
	//** Privates.
	
	/** @private **/ private var __startValue:Float;
	
	/** @private **/ private var __rangeValue:Float;
	
	public function new() 
	{
		super(0, DrcTweenType.PERSIST);
	}
	
	public function	tween(object:Dynamic, property:String, to:Float, duration:Float):Void
	{
		if (Reflect.isObject(object))
		{
			var value:Float = Reflect.getProperty(object, property);
			
			if (Math.isNaN(value))
			{
				throw "The property $property is not a numeric.";
			}
			
			trace(value);
			
			__startValue = value;
			
			__rangeValue = to - __startValue;
			
			__target = duration;
			
			start();
			
			return;
		}
		
		throw "A valid object was not passed.";
	}
	
	override public function update():Void
	{
		super.update();
		
		//Reflect.setProperty(_object, _property, _start + _range * _t);
	}
}