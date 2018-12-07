package drc.anim;

import openfl.Vector;

@:allow(drc.anim.DrcSkeletonParser)
class DrcSlotData //** Define metadata allow.
{
	//** Publics.
	
	public var displays:Vector<DrcDisplayData>;
	
	@:isVar
	public var name(get, null):String; //** Define metadata isVar.
	
	public var parentBone:DrcBoneData;
	
	//** Privates.
	
	/** @private **/ private var __name:String;
	
	/** @private **/ public var __parentName:String;
	
	public function new() 
	{
		
	}
	
	//** Getters and setters.
	
	private function get_name():String
	{
		return __name;
	}
	
	private function get_parentName():String
	{
		return __parentName;
	}
}