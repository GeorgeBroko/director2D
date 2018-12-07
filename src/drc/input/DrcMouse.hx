package drc.input;

import drc.input.DrcDevice;
import haxe.Int32;
import openfl.Vector;

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
	}
	
	public function init():Void
	{
		
	}
	
	public function release():Void
	{
		
	}
}