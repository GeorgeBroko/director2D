package drc.data;

import openfl.Vector;

@:allow(drc.core.DrcScreen)
class DrcConstant //** Define metadata allow.
{
	//** Publics.
	
	/**
	 * The w value of the constant.
	 */
	@:isVar 
	public var w(get, set):Float = 0; //** Define metadata isVar.
	
	/**
	 * The x value of the constant.
	 */
	@:isVar 
	public var x(get, set):Float = 0; //** Define metadata isVar.
	
	/**
	 * The y value of the constant.
	 */
	@:isVar 
	public var y(get, set):Float = 0; //** Define metadata isVar.
	
	/**
	 * The z value of the constant.
	 */
	@:isVar 
	public var z(get, set):Float = 0; //** Define metadata isVar.
	
	//** Privates.
	
	/** @private */ private var __innerData:Vector<Float> = new Vector<Float>();
	
	/** @private */ private var __location:Int;
	
	/** @private */ private var __name:String;
	
	public function new(name:String, location:Int) 
	{
		__name = name;
		
		__location = location;
	}
	
	//** Getters and setters.
	
	private function get_x():Float
	{
		return __innerData[0];
	}
	
	private function set_x(value:Float):Float
	{
		__innerData[0] = value;
		
		return __innerData[0];
	}
	
	private function get_y():Float
	{
		return __innerData[1];
	}
	
	private function set_y(value:Float):Float
	{
		__innerData[1] = value;
		
		return __innerData[1];
	}
	
	private function get_z():Float
	{
		return __innerData[2];
	}
	
	private function set_z(value:Float):Float
	{
		__innerData[2] = value;
		
		return __innerData[2];
	}
	
	private function get_w():Float
	{
		return __innerData[3];
	}
	
	private function set_w(value:Float):Float
	{
		__innerData[3] = value;
		
		return __innerData[3];
	}
}