package drc.data;

import openfl.Vector;

class DrcIndices 
{
	//** Publics.
	
	/**
	 * The lenght of the innerData vector.
	 */
	public var count(get, null):Int;
	
	
	/**
	 * A vector array of all the indices.
	 */
	public var innerData:Vector<UInt> = new Vector<UInt>();
	
	/**
	 * Creates a new indices instance.
	 * 
	 * @param	data: The data to be uploaded.
	 */
	public function new(?data:Vector<UInt>) 
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
	 * Upload a vector of indices.
	 * 
	 * @param	data: The index data to be uploaded.
	 */
	public function upload(data:Vector<UInt>):Void
	{
		innerData = data;
	}
	
	//** Getters and setters.
	
	private function get_count():Int
	{
		return innerData.length;
	}
}