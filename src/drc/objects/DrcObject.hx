package drc.objects;

@:allow(drc.part.DrcList) //** Define metadata: allow.
class DrcObject 
{
	//** Publics.
	
	/**
	 * The index of the object.
	 */
	public var index(get, null):Int;
	
	//** Privates.
	
	/** @private */ private var __index:Int;
	
	public function new() 
	{
		
	}
	
	/**
	 * Init method.
	 */
	public function init():Void
	{
		
	}
	
	/**
	 * Release method.
	 */
	public function release():Void
	{
		
	}
	
	//** Getters and setters.
	
	private function get_index():Int
	{
		return __index;
	}
}