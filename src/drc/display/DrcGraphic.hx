package drc.display;

import drc.data.DrcConstant;
import drc.data.DrcVertices;
import drc.objects.DrcObject;
import openfl.Vector;

class DrcGraphic extends DrcObject
{
	/**
	 * If the graphic is active.
	 */
	public var active(get, null):Bool;
	
	/**
	 * The rotation of the graphic.
	 */
	@:isVar
	public var angle(get, set):Float; //** Define metadata isVar.
	
	/**
	 * The x scale of the graphic.
	 */
	@:isVar
	public var scaleX(get, set):Float;
	
	/**
	 * The y scale of the graphic.
	 */
	@:isVar
	public var scaleY(get, set):Float;
	
	/**
	 * The x offset of the graphic.
	 */
	public var offsetX:Float = 0;
	
	/**
	 * The y offset of the graphic.
	 */
	public var offsetY:Float = 0;
	
	/**
	 * The x origin of the graphic.
	 */
	public var originX:Float = 0;
	
	/**
	 * The y origin of the graphic.
	 */
	public var originY:Float = 0;
	
	/**
	 * The width of the graphic.
	 */
	public var width:Float = 0;
	
	/**
	 * The height of the graphic.
	 */
	public var height:Float = 0;
	
	/**
	 * The vertices of the graphic.
	 */
	public var vertices:DrcVertices = new DrcVertices();
	
	/**
	 * The x position of the graphic in space.
	 */
	@:isVar
	public var x(get, set):Float; // ** Define metadata: isVar.
	
	/**
	 * The y position of the graphic in space.
	 */
	@:isVar
	public var y(get, set):Float; // ** Define metadata: isVar.
	
	/**
	 * The z position of the graphic in space.
	 */
	@:isVar
	public var z(get, set):Float; // ** Define metadata: isVar.
	
	//** Privates.
	
	/** @private **/ private var __active:Bool = false;
	
	/** @private **/ private var __angle:Float = 0;
	
	/** @private **/ private var __scaleX:Float = 1;
	
	/** @private **/ private var __scaleY:Float = 1;
	
	/** @private **/ private var __x:Float = 0;
	
	/** @private **/ private var __y:Float = 0;
	
	/** @private **/ private var __z:Float = 0;
	
	public function new(x:Float = 0, y:Float = 0) 
	{
		super();
		
		//** Set x position of the display object.
		
		__x = x;
		
		//** Set y position of the display object.
		
		__y = y;
	}
	
	public function remove():Void
	{
		
	}
	
	public function setPosition(x:Float, y:Float):Void
	{
		
	}
	
	public function render():Void
	{
		
	}
	
	//** Getters and setters.
	
	private function get_active():Bool
	{
		return __active;
	}
	
	private function get_angle():Float
	{
		return __angle;
	}

	private function set_angle(value:Float):Float
	{
		__angle = value;
		
		return __angle;
	}
	
	private function get_scaleX():Float
	{
		return __scaleX;
	}
	
	private function set_scaleX(value:Float):Float
	{
		return __scaleX = value;
	}
	
	private function get_scaleY():Float
	{
		return __scaleY;
	}
	
	private function set_scaleY(value:Float):Float
	{
		return __scaleY = value;
	}
	
	private function get_x():Float
	{
		return __x;
	}
	
	private function set_x(value:Float):Float
	{
		__x = value;
		
		return __x;
	}
	
	private function get_y():Float
	{
		return __y;
	}
	
	private function set_y(value:Float):Float
	{
		__y = value;
		
		return __y;
	}
	
	private function get_z():Float
	{
		return __z;
	}
	
	private function set_z(value:Float):Float
	{
		__z = value;
		
		return __z;
	}
}