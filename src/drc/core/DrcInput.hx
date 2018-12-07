package drc.core;

import drc.debug.DrcConsole;
import drc.input.DrcGamepad;
import drc.input.DrcKeyboard;
import drc.input.DrcMouse;
import openfl.Vector;
import openfl.events.GameInputEvent;
import openfl.ui.GameInput;
import drc.utils.DrcCommon;

@:final
class DrcInput //** Define metadata: final.
{
	//** Constants.
	
	/**
	 * The name of the input script.
	 */
	public static inline var CONST_SCRIPT_INPUT:String = "input.json";
	
	/**
	 * The name of the gamepad script.
	 */
	public static inline var CONST_SCRIPT_GAMEPAD:String = "gamepad.json";
	
	//** Publics.
	
	/**
	 * The number of all available gamepads. Cannot be set.
	 */
	public var gamepadsCount(get, null):Int;
	
	/**
	 * A list of every available joystick.
	 */
	public var gamepads:Vector<DrcGamepad>;
	
	/**
	 * The keyaboard input class.
	 */
	public var keyboard:DrcKeyboard;
	
	/**
	 * The mouse input class.
	 */
	public var mouse:DrcMouse;
	
	//** Privates.
	
	/** @private */ private var __gameInput:GameInput;
	
	/** @private */ private var __controls:Array<Dynamic>;
	
	public function new() 
	{
		
	}
	
	public function init():Void
	{
		var inputScript:DrcScript = new DrcScript(DrcCommon.CONST_FOLDER_SCRIPTS + CONST_SCRIPT_INPUT);
		
		#if windows // ------
		
		if (inputScript.get("gamepads"))
		{
			var count:Int = inputScript.get("gamepadsCount");
			
			gamepads = new Vector<DrcGamepad>(count, true);
			
			var gamepadScript:DrcScript = new DrcScript(DrcCommon.CONST_FOLDER_SCRIPTS + CONST_SCRIPT_GAMEPAD);
			
			for (i in 0...count)
			{
				gamepads[i] = new DrcGamepad(i);
				
				gamepads[i].init();
			}
			
			#if debug // ------
			
			DrcConsole.showTrace("Gamepads initiated. Count = " + count);
			
			#end // ------
			
			//** Create a new game input class;
			
			__gameInput = new GameInput();
			
			//** Add new "DEVICE_ADDED" event to the game input class.
			
			__gameInput.addEventListener(GameInputEvent.DEVICE_ADDED, __onDeviceAdded);
			
			//** Add new "DEVICE_REMOVED" event to the game input class.
			
			__gameInput.addEventListener(GameInputEvent.DEVICE_REMOVED, __onDeviceRemoved);
			
			var gamepadScript:DrcScript = new DrcScript(DrcCommon.CONST_FOLDER_SCRIPTS + CONST_SCRIPT_GAMEPAD);
			
			__controls = gamepadScript.get("controls");
		}
		
		#end // ------
		
		if (inputScript.get("keyboard"))
		{
			keyboard = new DrcKeyboard();
			
			keyboard.init();
		}
		
		if (inputScript.get("Mouse"))
		{
			//mouse.init();
		}
	}
	
	/**
	 * Release method.
	 */
	public function release():Void
	{
		
	}
	
	private function __onDeviceAdded(event:GameInputEvent):Void
	{
		//** Find an empty slot and assign a gamepad to it.
		
		for (i in 0...gamepadsCount) 
		{
			if (!gamepads[i].active)
			{
				gamepads[i].set(event.device, __controls);
				
				#if debug // ------
				
				DrcConsole.showTrace("Device added at slot " + i + ".");
				
				#end // ------
				
				break;
			}
		}
	}
	
	private function __onDeviceRemoved(event:GameInputEvent):Void
	{
		event.device.enabled = false;
	}
	
	/**
	 * Update method.
	 */
	public function update():Void
	{
		#if windows // ------
		
		#end // ------
	}
	
	/**
	 * Post update method.
	 */
	public function postUpdate():Void
	{
		#if windows // ------
		
		for (i in 0...gamepadsCount) 
		{
			//** Post update every active gamepad.
			
			//gamepads[i].postUpdate();
		}
		
		#end // ------
		
		//** Post update the keyboard.
		
		keyboard.postUpdate();
	}
	
	// ** Getters and setters.
	
	private function get_gamepadsCount():Int
	{
		return gamepads.length;
	}
}