package drc.graphics;

import drc.data.DrcIndices;
import drc.display.DrcGraphic;
import openfl.Vector;

@:allow(drc.graphics.DrcTileMap)
class DrcPoly extends DrcGraphic //** Define metadata allow.
{
	//** Publics.
	
	public var id(get, set):UInt;
	
	/**
	 * The indices of the mesh.
	 */
	public var indices:DrcIndices = new DrcIndices();
	
	/**
	 * The layer of the mesh.
	 */
	public var layer(get, set):Int;
	
	/**
	 * The parent class of the tile. Cannot be set.
	 */
	public var parent(get, null):DrcTileMap;
	
	//** Privates.
	
	/** @private */ private var __id:UInt = 0;
	
	/** @private */ private var __layer:Int = 0;
	
	/** @private */ private var __parent:DrcTileMap;
	
	public function new(parent:DrcTileMap, id:UInt = 0) 
	{
		super();
		
		__parent = parent;
		
		__id = id;
		
		vertices.upload(new Vector<Float>(
		[0, 0, 0, 0, 0, 0, 
		0, -64, 0, 0, 0, 1, 
		64, -64, 0, 0, 1, 1,
		64, 0, 0, 0, 1, 0]));
		
		//vertices.upload(new Vector<Float>(
		//[0, 0, 0, 0, 0, -1, 
		//0, -128, 0, 0, 0, 1,  
		//128, 0, 0, 0, 2, -1]));
		
		vertices.upload(new Vector<Float>(
		[0, 0, 0, 0, 0, 0, 
		0, 128, 0, 0, 0, 2,  
		128, 0, 0, 0, 2, 0]));
		
		indices.upload(new Vector<UInt>([0, 1, 2]));
	}
	
	//** Getters and setters.
	
	override private function set_angle(value:Float):Float
	{
		__angle = (value %= 360) >= 0 ? value : (value + 360);
		
		vertices.innerData[3] = __angle;
		
		vertices.innerData[9] = __angle;
		
		vertices.innerData[15] = __angle;
		
		vertices.innerData[21] = __angle;
		
		return value;
	}
	
	private function get_id():UInt
	{
		return __id;
	}
	
	private function set_id(value:UInt):UInt
	{
		return __id;
	}
	
	private function get_layer():Int
	{
		return __layer;
	}
	
	private function set_layer(value:Int):Int
	{
		__layer = value;
		
		return __layer;
	}
	
	private function get_parent():DrcTileMap
	{
		return __parent;
	}
}