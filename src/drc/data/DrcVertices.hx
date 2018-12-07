package drc.data;

import drc.display.DrcGraphic;
import openfl.Vector;

@:allow(drc.display.DrcGraphic)
class DrcVertices 
{
	//** Publics.
	
	/**
	 * The lenght of the innerData vector.
	 */
	public var count(get, null):Int;
	
	/**
	 * A vector list of all the vertices.
	 */
	public var innerData:Vector<Float> = new Vector<Float>();
	
	//** Privates.
	
	/** @private */ private var __dataPerVertex:Int;
	
	/**
	 * Creates a new vertices instance.
	 * 
	 * @param	data: The data to be uploaded.
	 */
	public function new(?data:Vector<Float>) 
	{
		//** Check if the data is null.
		
		if (data != null)
		{
			//** Upload the data.
			
			upload(data);
		}
	}
	
	/**
	 * Dispose of the inner data.
	 */
	public function dispose():Void
	{
		innerData.splice(0, innerData.length);
	}
	
	/**
	 * Insert an amount of data into the list.
	 * 
	 * @param	count: The amount of data to be uploaded.
	 */
	public function insert(count:UInt):Void
	{
		for (value in 0...count)
		{
			innerData.push(0);
		}
	}
	
	/**
	 * Resolve a copy of a value at the specified index.
	 * 
	 * @param	index: The index position of the value.
	 * 
	 * @return	Float
	 */
	public function resolve(index:Int):Float
	{
		return innerData[index];
	}
	
	/**
	 * Upload a vector of vertices.
	 * 
	 * @param	data: The index data to be uploaded.
	 */
	public function upload(data:Vector<Float>):Void
	{
		innerData = data;
	}
	
	//** Getters and setters.
	
	private function get_count():Int
	{
		return Std.int(innerData.length / __dataPerVertex);
	}
}