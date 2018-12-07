package drc.display;

import openfl.display3D.Program3D;
import openfl.display3D.Context3DProgramFormat;
import drc.utils.DrcCommon;

class DrcProgram 
{
	//** Publics.
	
	/**
	 * The name of the program.
	 */
	public var name(get, null):String;
	
	//** Privates.
	
	/** @private */ private var __name:String;
	
	/** @private */ private var __program:Program3D;
	
	/** @private */ private var __programFormat:Context3DProgramFormat;
	
	public function new(name:String) 
	{
		//** Assign the name.
		
		__name = name;
		
		//** Create the program.
		
		create();
	}
	
	/**
	 * Creates a new program through the context of the view.
	 */
	public function create():Void
	{
		//** Create a program.
		
		#if flash // ------
		
		__programFormat = Context3DProgramFormat.AGAL;
		
		#else
		
		__programFormat = Context3DProgramFormat.GLSL;
		
		#end // ------
		
		__program = DrcCommon.view.context.createProgram(__programFormat);
	}
	
	/**
	 * Frees all resources associated with this program.
	 */
	public function dispose():Void
	{
		//** Dispose of the program data.
		
		__program.dispose();
	}
	
	/**
	 * Uploads a pair of shaders into the program.
	 * 
	 * @param	vertexShader: The vertex shader.
	 * 
	 * @param	fragmentShader: The fragment shader.
	 */
	public function upload(vertexShader:String, fragmentShader:String):Void
	{
		__program.uploadSources(vertexShader, fragmentShader);
	}
	
	/**
	 * Returns the inner data of the program.
	 * 
	 * @return	Program3D
	 */
	public function getInnerData():Program3D
	{
		return __program;
	}
	
	//** Getters and setters.
	
	private function get_name():String
	{
		return __name;
	}
}