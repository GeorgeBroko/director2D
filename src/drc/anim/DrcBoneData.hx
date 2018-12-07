package drc.anim;

@:allow(drc.anim.DrcSkeletonParser)
class DrcBoneData //** Define metadata allow.
{
	//** Publics.
	
	@:isVar
	public var name(get, null):String; //** Define metadata isVar.
	
	public var parentBone:DrcBoneData;
	
	public var transformation:DrcTransformation;
	
	public var x:Float = 0;
	
	public var y:Float = 0;
	
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