package drc.objects;

import drc.display.DrcGraphic;
import drc.objects.DrcObject;

@:allow(drc.objects.DrcScene)
class DrcEntity extends DrcObject
{
	//** Publics.
	
	public var graphic:DrcGraphic;
	
	public var scene(get, null):DrcScene;
	
	public var x(get, set):Float;
	
	public var y(get, set):Float;
	
	//** Privates.
	
	private var __scene:DrcScene;
	
	private var __x:Float = 0;
	
	private var __y:Float = 0;
	
	public function new() 
	{
		super();
	}
	
	override public function init():Void 
	{
		super.init();
	}
	
	override public function release():Void 
	{
		super.release();
		
		graphic.remove();
	}
	
	public function update():Void
	{
		graphic.x = __x;
		
		graphic.y = __y;
	}
	
	//** Getters and setters.
	
	private function get_scene():DrcScene
	{
		return __scene;
	}
	
	private function get_x():Float
	{
		return __x;
	}
	
	private function get_y():Float
	{
		return __y;
	}
	
	private function set_x(value:Float):Float
	{
		return __x = value;
	}
	
	private function set_y(value:Float):Float
	{
		return __y = value;
	}
}