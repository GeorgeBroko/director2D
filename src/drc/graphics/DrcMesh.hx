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
		
		vertices.__dataPerVertex = profile.dataPerVertex;
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