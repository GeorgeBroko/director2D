package drc.anim;

@:allow(drc.anim.DrcSkeletonParser)
class DrcBoneKeyFrame //** Define metadata allow.
{
	//** Publics.
	
	@:isVar
	public var duration(get, null):UInt; //** Define metadata isVar.
	
	@:isVar
	public var x(get, null):Float; //** Define metadata isVar.
	
	@:isVar
	public var y(get, null):Float; //** Define metadata isVar.
	
	//** Privates.
	
	/** @private **/ private var __duration:UInt;
	
	/** @private **/ private var __x:Float;
	
	/** @private **/ private var __y:Float;
	
	public function new() 
	{
		
	}
	
	//** Getters and setters.
	
	private function get_duration():UInt
	{
		return __duration;
	}
	
	private function get_x():Float
	{
		return __x;
	}
	
	private function get_y():Float
	{
		return __y;
	}
}