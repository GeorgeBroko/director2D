package drc.input;

import openfl.Vector;
import haxe.Int32;
import openfl.Lib;
import openfl.events.KeyboardEvent;

class DrcKeyboard extends DrcDevice
{
	//** Constants.
	
	/**
	 * The default count of keys.
	 */
	public static inline var CONST_CONTROLS:Int32 = 21;
	
	public function new() 
	{
		__checkCount = 0;
		
		__pressCount = 0;
		
		__releaseCount = 0;
		
		__checkControls = new Vector<Bool>(CONST_CONTROLS, true);
		
		__pressControls = new Vector<Int>(CONST_CONTROLS, true);
		
		__releaseControls = new Vector<Int>(CONST_CONTROLS, true);
		
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, __onKeyDown);
		
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, __onKeyUp);
	}
	
	public function init():Void
	{
		
	}
	
	public function release():Void
	{
		
	}
	
	private function __onKeyDown(event:KeyboardEvent):Void
	{
		var code:Int = event.keyCode;
		
		if (!__checkControls[code])
		{
			__checkControls[code] = true;
			
			__checkCount ++;
			
			__pressControls[__pressCount ++] = code;
			
			__updateLog(code);
		}
	}
	
	private function __onKeyUp(event:KeyboardEvent):Void
	{
		var code:Int = event.keyCode;
		
		if (__checkControls[code])
		{
			__checkControls[code] = false;
			
			__checkCount --;
			
			__releaseControls[__releaseCount ++] = code;
		}
	}
}