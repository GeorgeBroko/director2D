package drc.anim;

import drc.anim.DrcBoneKeyFrame;
import openfl.Vector;
import cont.Test;

@:allow(drc.anim.DrcSkeletonParser)
class DrcBoneFrames //** Define metadata allow.
{
	//** Publics.
	
	public var bone:DrcBoneData;
	
	@:isVar
	public var lastKeyFrame(get, null):Int;
	
	@:isVar
	public var name(get, null):String; //** Define metadata isVar.
	
	@:isVar
	public var nextRotation(get, null):Int = 0;
	
	@:isVar
	public var nextScale(get, null):Int = 0;
	
	@:isVar
	public var nextTranslation(get, null):Int = 0;
	
	//** Privates.
	
	/** @private **/ private var __lastKeyFrame:Int;
	
	/** @private **/ private var __keyFrames:Vector<DrcBoneKeyFrame>;
	
	/** @private **/ private var __name:String;
	
	/** @private **/ private var __nextRotation:Int = 0;
	
	/** @private **/ private var __nextScale:Int = 0;
	
	/** @private **/ private var __nextTranslation:Int = 0;
	
	//** Internal.
	
	/** @private **/ private var __rangeX:Float = 0;
	
	/** @private **/ private var __rangeY:Float = 0;
	
	/** @private **/ private var __startX:Float = 0;
	
	/** @private **/ private var __startY:Float = 0;
	
	/** @private **/ private var __target:Float = 0;
	
	/** @private **/ private var __time:Float = 0;
	
	/** @private **/ private var __t:Float = 0;
	
	public function new() 
	{
		
	}
	
	public function play():Void
	{
		__lastKeyFrame = 0;
		
		__nextTranslation = __keyFrames[0].duration;
		
		__startX = Test.__image.x;
		
		__startY = Test.__image.y;
		
		__rangeX = __keyFrames[1].x - __startX;
		
		__rangeY = __keyFrames[1].y - __startY;
		
		__target = __keyFrames[0].duration;
		
		__time = 0;
	}
	
	public function step(frame:Int):Void
	{
		if (frame == __nextTranslation)
		{
			__lastKeyFrame ++;
			
			__nextTranslation += __keyFrames[__lastKeyFrame].duration;
			
			__startX = Test.__image.x;
			
			__startY = Test.__image.y;
			
			__rangeX = __keyFrames[__lastKeyFrame + 1].x - __startX;
			
			__rangeY = __keyFrames[__lastKeyFrame + 1].y - __startY;
			
			__target = __keyFrames[__lastKeyFrame].duration;
			
			__time = 0;
		}
		
		__time += 1;
		
		__t = __target == 0 ? 0 : __time / __target;
		
		bone.x = __startX + __rangeX * __t;
		
		bone.y = __startY + __rangeY * __t;
	}
	
	private function __addKeyFrame(keyFrame:DrcBoneKeyFrame):Void
	{
		__keyFrames.push(keyFrame);
	}
	
	private function __initKeyFrames(count:Int):Void
	{
		__keyFrames = new Vector<DrcBoneKeyFrame>();
	}
	
	//** Getters and setters.
	
	private function get_lastKeyFrame():Int
	{
		return __lastKeyFrame;
	}
	
	private function get_name():String
	{
		return __name;
	}
	
	private function get_nextRotation():Int
	{
		return __nextRotation;
	}
	
	private function get_nextScale():Int
	{
		return __nextScale;
	}
	
	private function get_nextTranslation():Int
	{
		return __nextTranslation;
	}
}