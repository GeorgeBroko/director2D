package drc.data;

import openfl.display3D.Context3DVertexBufferFormat;

class DrcAttribute 
{
	//** Publics.
	
	/**
	 * The name of the attribute.
	 */
	public var name(get, null):String;
	
	/**
	 * The foramt of the attribute.
	 */
	public var format(get, null):Context3DVertexBufferFormat;
	
	/**
	 * The position of the attribute.
	 */
	public var position(get, null):Int;
	
	//** Privates.
	
	private var __name:String;
	
	private var __format:Context3DVertexBufferFormat;
	
	private var __position:Int;
	
	public function new(name:String, format:String, position:Int) 
	{
		__name = name;
		
		__format = format;
		
		__position = position;
	}
	
	//** Getters and setters.
	
	private function get_name():String
	{
		return __name;
	}
	
	private function get_format():Context3DVertexBufferFormat
	{
		return __format;
	}
	
	private function get_position():Int
	{
		return __position;
	}
}