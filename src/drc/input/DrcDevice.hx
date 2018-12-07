package drc.input;

import haxe.Int32;
import openfl.Vector;

class DrcDevice 
{
	//** Constants.
	
	/**
	 * Max characters the log can hold.
	 */
	public static inline var CONST_MAX_LOGS:Int32 = 64;
	
	// ** Publics.
	
	/**
	 * The number of controls of the device.
	 */
	@:isVar public var controlsCount(get, null):Int; // ** Define metadata: isVar.
	
	/**
	 * An updated string that contains the inputs that has been pressed.
	 */
	public var log:String = "";
	
	// ** Privates.
	
	/** @private */ private var __controlsCount:Int;
	
	/** @private */ private var __checkCount:Int;
	
	/** @private */ private var __pressCount:Int;
	
	/** @private */ private var __releaseCount:Int;
	
	/** @private */ private var __checkControls:Vector<Bool>;
	
	/** @private */ private var __pressControls:Vector<Int>;
	
	/** @private */ private var __releaseControls:Vector<Int>;
	
	/**
	 * Check if a control is held down.
	 * 
	 * @param	control	A control ID to check for.  
	 * 
	 * @return	Boolean
	 */
	public function check(control:Int):Bool
	{
		return control < 0 ? __checkCount > 0 : __checkControls[control];
	}
	
	/**
	 * Check if a control is pressed down this frame.
	 * 
	 * @param	control	A control ID to check for.  
	 * 
	 * @return	Boolean
	 */
	public function pressed(control:Int):Bool
	{
		return control < 0 ? __pressCount > 0 : __pressControls.indexOf(control) >= 0;
	}
	
	/**
	 * Check if a control is released this frame.
	 * 
	 * @param	control	A control ID to check for.
	 * 
	 * @return	Boolean
	 */
	public function released(control:Int):Bool
	{
		return control < 0 ? __releaseCount > 0 : __releaseControls.indexOf(control) >= 0;
	}
	
	/**
	 * Post update method.
	 */
	public function postUpdate():Void
	{
		// ** Clear every pressed control for the next frame.
		
		while (__pressCount > 0) 
		{
			__pressControls[-- __pressCount] = 0;
		}
		
		// ** Clear every released control for the next frame.
		
		while (__releaseCount > 0) 
		{
			__releaseControls[-- __releaseCount] = 0;
		}
	}
	
	private function __updateLog(code:Int):Void
	{
		if (log.length > CONST_MAX_LOGS) log = log.substring(1);
		
		log += Std.string(code);
	}
	
	// ** Getters and setters.
	
	private function get_controlsCount():Int
	{
		return __controlsCount;
	}
}