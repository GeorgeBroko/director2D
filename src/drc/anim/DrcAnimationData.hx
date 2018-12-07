package drc.anim;

import openfl.Vector;

@:allow(drc.anim.DrcSkeletonParser)
class DrcAnimationData //** Define metadata allow.
{
	//** Publics.
	
	@:isVar
	public var frame(get, null):Int;
	
	@:isVar
	public var name(get, null):String; //** Define metadata isVar.
	
	//** Privates.
	
	/** @private **/ public var __boneFrames:Vector<DrcBoneFrames>;
	
	/** @private **/ private var __frame:Int;
	
	/** @private **/ private var __frameCount:Int;
	
	/** @private **/ private var __name:String;
	
	/** @private **/ private var __playTimes:Int;
	
	public function new() 
	{
		
	}
	
	public function play():Void
	{
		__frame = -1;
		
		for (count in 0...__boneFrames.length) 
		{
			__boneFrames[count].play();
		}
	}
	
	public function step():Void
	{
		if (__frame >= __frameCount - 1)
		{
			return;
		}
		
		__frame ++;
		
		for (count in 0...__boneFrames.length) 
		{
			__boneFrames[0].step(__frame);
		}
	}
	
	private function __addBoneFrames(boneFrames:DrcBoneFrames):Void
	{
		__boneFrames.push(boneFrames);
	}
	
	private function __initBoneFrames(count:Int)
	{
		__boneFrames = new Vector<DrcBoneFrames>();
	}
	
	//** Getters and setters.
	
	private function get_frame():Int
	{
		return __frame;
	}
	
	private function get_name():String
	{
		return __name;
	}
}