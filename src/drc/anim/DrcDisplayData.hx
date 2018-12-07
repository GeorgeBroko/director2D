package drc.anim;
import drc.graphics.DrcTile;

@:allow(drc.anim.DrcSkeletonParser)
class DrcDisplayData //** Define metadata allow.
{
	//** Publics.
	
	@:isVar
	public var name(get, null):String; //** Define metadata isVar.
	
	public var transformation:DrcTransformation;
	
	public var tile:DrcTile;
	
	//** Privates.
	
	/** @private **/ private var __name:String;
	
	public function new() 
	{
		
	}
	
	//** Getters and setters.
	
	private function get_name():String
	{
		return __name;
	}
}