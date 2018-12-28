package drc.graphics;

import drc.graphics.DrcTileMap;
import drc.graphics.DrcParticle;
import openfl.Vector;

class DrcEmitter 
{
	//** Publics.
	
	/**
	 * The parent class of the emitter. Cannot be set.
	 */
	public var parent(get, null):DrcTileMap;
	
	/**
	 * A list of all active particles.
	 */
	public var particles:Vector<DrcParticle> = new Vector<DrcParticle>();
	
	//** Privates.
	
	private var __parent:DrcTileMap;
	
	public function new(parent:DrcTileMap) 
	{
		__parent = parent;
	}
	
	public function init():Void
	{
		
	}
	
	public function release():Void
	{
		
	}
	
	public function emit():Void
	{
		
	}
	
	//** Getters and setters.
	
	private function get_parent():DrcTileMap
	{
		return __parent;
	}
}