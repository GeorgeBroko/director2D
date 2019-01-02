package drc.input;

import drc.input.DrcDevice;
import haxe.Int32;
import openfl.Vector;
import openfl.events.MouseEvent;
import openfl.Lib;

class DrcMouse extends DrcDevice
{
	/**
	 * The default count of keys.
	 */
	public static inline var CONST_CONTROLS:Int32 = 3;
	
	public function new() 
	{
		__checkCount = 0;
		
		__pressCount = 0;
		
		__releaseCount = 0;
		
		__checkControls = new Vector<Bool>(CONST_CONTROLS, true);
		
		__pressControls = new Vector<Int>(CONST_CONTROLS, true);
		
		__releaseControls = new Vector<Int>(CONST_CONTROLS, true);
		
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, __onMouseDown(0));
		
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, __onMouseUp(0));
	}
	
	public function init():Void
	{
		
	}
	
	public function release():Void
	{
		
	}
	
	private function __onMouseDown(code:Int):MouseEvent -> Void
	{	
		return function(e:MouseEvent):Void
		{
			if (!__checkControls[code])
			{
				__checkControls[code] = true;
				
				__checkCount ++;
				
				__pressControls[__pressCount ++] = code;
				
				__updateLog(code);
			}
		}
	}
	
	private function __onMouseUp(code:Int):MouseEvent -> Void
	{
		return function(e:MouseEvent):Void
		{
			if (__checkControls[code])
			{
				__checkControls[code] = false;
				
				__checkCount --;
				
				__releaseControls[__releaseCount ++] = code;
			}
		}
	}
}