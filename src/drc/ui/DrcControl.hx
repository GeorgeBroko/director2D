package drc.ui;

import drc.graphics.DrcTile;
import drc.objects.DrcObject;
import drc.ui.DrcLayout;
import openfl.Vector;

@:allow(drc.ui.DrcLayout) //** Define metadata allow.
class DrcControl extends DrcObject
{
	//** Publics.
	
	@:isVar
	public var layer(get, set):Int; //** Define metadata isVar.
	
	/**
	 * The parent class of the control. Cannot be set.
	 */
	public var parent(get, null):DrcLayout;
	
	@:isVar
	public var x(get, set):Float; //** Define metadata isVar.
	
	@:isVar
	public var y(get, set):Float; //** Define metadata isVar.
	
	@:isVar
	public var z(get, set):Float; //** Define metadata isVar.
	
	//** Privates.
	
	/** @private **/ private var __layer:Int;
	
	/** @private **/ private var __parent:DrcLayout;
	
	/** @private **/ private var __tiles:Vector<DrcTile>;
	
	/** @private **/ private var __x:Float;
	
	/** @private **/ private var __y:Float;
	
	/** @private **/ private var __z:Float;
	
	public function new() 
	{
		super();
	}
	
	override public function init():Void
	{
		
	}
	
	override public function release():Void
	{
		
	}
	
	public function render():Void
	{
		
	}
	
	//** Getters and setters.
	
	private function get_layer():Int
	{
		return __layer;
	}
	
	private function set_layer(value:Int):Int
	{
		return __layer = value;
	}
	
	private function get_parent():DrcLayout
	{
		return __parent;
	}
	
	private function get_x():Float
	{
		return __x;
	}
	
	private function set_x(value:Float):Float
	{
		return __x += value;
	}
	
	private function get_y():Float
	{
		return __y;
	}
	
	private function set_y(value:Float):Float
	{
		return __y += value;
	}
	
	private function get_z():Float
	{
		return __z;
	}
	
	private function set_z(value:Float):Float
	{
		return __z += value;
	}
}