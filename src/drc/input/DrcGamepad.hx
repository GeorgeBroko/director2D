package drc.input;

import haxe.Int32;
import openfl.geom.Point;
import drc.core.DrcScript;
import openfl.Vector;
import openfl.ui.GameInputDevice;
import openfl.ui.GameInputControl;
import openfl.events.Event;

class DrcGamepad 
{
	//** Constants.
	
	/**
	 * The default count of gamepads input controls.
	 */
	public static inline var CONST_CONTROLS:Int32 = 21;
	
	/**
	 * The default count of gamepad value controls.
	 */
	public static inline var CONST_VALUES:Int32 = 6;
	
	// ** Publics.
	
	/**
	 * If the current gamepad is active.
	 */
	@:isVar public var active(get, set):Bool; // ** Define metadata: isVar.
	
	/**
	 * The id of the current gamepad. Cannot be set.
	 */
	@:isVar public var id(get, null):String; // ** Define metadata: isVar.
	
	/**
	 * The name of the current gamepad. Cannot be set.
	 */
	@:isVar public var name(get, null):String; // ** Define metadata: isVar.
	
	/**
	 * The values of each axis to be exceeded for the left analog sticks to work.
	 */
	public var leftAnalogThreshold:Point;
	
	/**
	 *  The values of each axis to be exceeded for the right analog sticks to work.
	 */
	public var rightAnalogThreshold:Point;
	
	/**
	 * The startup script of the class.
	 */
	public var script:DrcScript;
	
	/**
	 * The slot of the current gamepad.
	 */
	@:isVar public var slot(get, null):UInt; // ** Define metadata: isVar.
	
	//** Privates.
	
	/** @private */ private var __checkValue:Vector<Float>;
	
	/** @private */ private var __gameInputControls:Vector<GameInputControl>;
	
	/** @private */ private var __gameInputDevice:GameInputDevice;
	
	/** @private */ private var __slot:UInt;
	
	/** @private */ private var __sourceScript(default, null):String = "gamepad.json";
	
	public function new(slot:Int) 
	{
		// ** Assign the slot to a private variable.
		
		__slot = slot;
		
		__gameInputControls = new Vector<GameInputControl>(CONST_CONTROLS, true);
	}
	
	public function init():Void
	{
		
	}
	
	public function release():Void
	{
		
	}
	
	public function set(gameInputDevice:GameInputDevice, controls:Array<Dynamic>):Void
	{
		// ** Assign the game input device to a private variable.
		
		__gameInputDevice = gameInputDevice;
		
		// ** Enable the device.
		
		__gameInputDevice.enabled = true;
		
		// ** Set the controls of the device.
		
		for (i in 0...CONST_CONTROLS) 
		{
			if (controls[i].active)
			{
				__gameInputControls[i] = __gameInputDevice.getControlAt(i);
				
				if (i < CONST_VALUES) 
				{
					__gameInputControls[i].addEventListener(Event.CHANGE, __onValueChange(i));
					
					continue;
				}
				
				__gameInputControls[i].addEventListener(Event.CHANGE, __onChange(i));
			}
		}
	}
	
	private function __onChange(code:Int):Event -> Void
	{
		return function(e:Event):Void
		{
			trace(code);
		}
	}
	
	private function __onValueChange(code:Int):Event -> Void
	{
		return function(e:Event):Void
		{
			
		}
	}
	
	//** Getters ans setters.
	
	private function get_active():Bool
	{
		return __gameInputDevice != null ? __gameInputDevice.enabled : false;
	}
	
	private function set_active(value:Bool):Bool
	{
		__gameInputDevice.enabled = value;
		
		return value;
	}
	
	private function get_id():String
	{
		return __gameInputDevice.id;
	}
	
	private function get_name():String
	{
		return __gameInputDevice.name;
	}
	
	private function get_slot():UInt
	{
		return __slot;
	}
}