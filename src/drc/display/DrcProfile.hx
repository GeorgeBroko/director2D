package drc.display;

import drc.core.DrcScript;
import drc.data.DrcAttribute;
import drc.data.DrcConstant;
import openfl.Vector;
import openfl.Assets;
import drc.utils.DrcCommon;

class DrcProfile 
{
	/**
	 * The attributes of each vertex.
	 */
	public var attributes:Vector<DrcAttribute> = new Vector<DrcAttribute>();
	
	/**
	 * The number of data a vertex contains.
	 */
	public var dataPerVertex:Int;
	
	/**
	 * The constants of the program.
	 */
	public var constants:Vector<DrcConstant> = new Vector<DrcConstant>();
	
	/**
	 * The rendering program that represents a pair of shaders.
	 */
	public var program:DrcProgram;
	
	/**
	 * A list with all the translating positions.
	 */
	public var translations:Vector<Int> = new Vector<Int>();
	
	//** Privates.
	
	/** @private */ public var __:Int;
	
	public function new(path:String) 
	{
		//** Upload the data.
		
		upload(path);
	}
	
	public function dispose():Void
	{
		
	}
	
	public function upload(path:String):Void
	{
		//** TODO: Clean up code!
		
		var script:DrcScript = new DrcScript(path);
		
		dataPerVertex = script.get("dataPerVertex");
		
		var objects:Array<Dynamic> = script.get("attributes");
		
		//if (objects[0].name != "space")
		//{
			//attributes.push(new DrcAttribute("space", "float3", 0));
		//}
		//
		//if (objects[1].name != "texture")
		//{
			//attributes.push(new DrcAttribute("texture", "float2", 3));
		//}
		
		for (i in 0...objects.length)
		{
			attributes.push(new DrcAttribute(objects[i].name, objects[i].format, objects[i].position));
		}
		
		//constants = new Vector<DrcConstant>(script.get("constantCount"), true);
		
		program = new DrcProgram(script.get("programName"));
		
		#if flash // ------
		
		var vertexShader:String = "m44 op, va0, vc0\n" + "mov v0, va1";
		//var vertexShader:String = "m44 op, va0, vc0" + "mov v0, va1";
		
		var fragmentShader:String = "tex ft1, v0, fs0 <2d>\n" + "mov oc, ft1";
		//var fragmentShader:String = "mov oc, v0";
		
		program.upload(vertexShader, fragmentShader);
		
		return;
		
		#end // ------
		
		program.upload(Assets.getText("shaders/" + script.get("vertexShader")), Assets.getText("shaders/" + script.get("fragmentShader")));
		
		var const:Array<Dynamic> = script.get("constants");
		
		constants.push(new DrcConstant("matrix", getUniformLocation("_matrix")));
		
		//trace(const.length);
		
		for (count in 0...const.length)
		{
			//trace(const[count].name);
			
			var name:String = const[count].name;
			
			var location:Int = getUniformLocation(name);
			
			constants.push(new DrcConstant(name, location));
		}
		
		//__matrixLocation = DrcCommon.view.context.getUniformLocation(program.getInnerData(), "_matrix");
		
		//__textureLocation = DrcCommon.view.context.getUniformLocation(program.getInnerData(), "_texture");
	}
	
	private function getUniformLocation(name:String):Int
	{
		return DrcCommon.view.context.getUniformLocation(program.getInnerData(), name);
	}
}