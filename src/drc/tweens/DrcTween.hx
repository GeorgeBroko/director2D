package drc.tweens;

import drc.tweens.DrcTweenType;

class DrcTween 
{
	//** Publics.
	
	@:isVar
	public var active(get, null):Bool;
	
	/**
	 * 
	 */
	@:isVar
	public var duration(get, null):Float; //** Define metadata isVar.
	
	/**
	 * 
	 */
	public var onComplete:Void -> Void;
	
	/**
	 * 
	 */
	@:isVar
	public var type(get, null):DrcTweenType; //** Define metadata isVar.
	
	//** Privates.
	
	/** @private **/ private var __active:Bool;
	
	/** @private **/ private var __duration:Float;
	
	/** @private **/ private var __target:Float;
	
	/** @private **/ private var __time:Float;
	
	/** @private **/ private var __type:DrcTweenType;
	
	var _t:Float;
	
	public function new(duration:Float, type:DrcTweenType) 
	{
		__duration = duration;
		
		__type = type;
	}
	
	public function init():Void
	{
		
	}
	
	public function release():Void
	{
		
	}
	
	public function start():Void
	{
		__time = 0;
		
		if (__target == 0)
		{
			__active = false;
			
			return;
		}
		
		__active = true;
	}
	
	public function cancel():Void
	{
		
	}
	
	public function update():Void
	{
		if (active)
		{
			__time += 0.0166;
			
			_t = __target == 0 ? 0 : __time / __target;
			
			if (__time >= __target)
			{
				//_t = forward ? 1 : 0;
				
				//isFinished = true;
				
				__active = false;
			}
		}
	}
	
	private function __finish():Void
	{
		onComplete();
	}
	
	//** Getters and setters.
	
	private function get_active():Bool
	{
		return __active;
	}
	
	private function get_duration():Float
	{
		return __duration;
	}
	
	private function get_type():DrcTweenType
	{
		return __type;
	}
}