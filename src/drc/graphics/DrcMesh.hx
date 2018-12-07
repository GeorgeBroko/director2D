package drc.graphics;

import drc.data.DrcIndices;
import drc.display.DrcProfile;
import drc.display.DrcTexture;
import drc.geom.DrcMatrix;
import drc.display.DrcGraphic;
import openfl.Vector;

class DrcMesh extends DrcGraphic
{
	//** Publics.
	
	/**
	 * The indices of the graphic.
	 */
	public var indices:DrcIndices = new DrcIndices();
	
	/**
	 * The matrix of the graphic.
	 */
	public var matrix:DrcMatrix = new DrcMatrix();
	
	/**
	 * The profile of the graphic.
	 */
	public var profile:DrcProfile;
	
	/**
	 * The texture of the graphic.
	 */
	public var texture:DrcTexture = new DrcTexture();
	
	//** Privates.
	
	/** @private */ private var __dataPerVertex:Int;
	
	public function new(profile:DrcProfile) 
	{
		super();
		
		this.profile = profile;
		
		//vertices.upload(new Vector<Float>(
		//[0, 0, 0, 0, 1, 
		//0, -480, 0, 0, 0, 
		//640, -480, 0, 1, 0, 
		//640, 0, 0, 1, 1]));
		
		vertices.upload(new Vector<Float>(
		[0, 0, 0, 0, 1, 
		0, -960, 0, 0, -1,  
		1280, 0, 0, 2, 1]));
		
		vertices.__dataPerVertex = profile.dataPerVertex;
		
		indices.upload(new Vector<UInt>([0, 1, 2]));
	}
	
	override public function render():Void 
	{
		
	}
	
	override function set_x(value:Float):Float 
	{
		return __x = matrix.rawData[12] = value;
	}
	
	override function set_y(value:Float):Float 
	{
		return __y = matrix.rawData[13] = value;
	}
}