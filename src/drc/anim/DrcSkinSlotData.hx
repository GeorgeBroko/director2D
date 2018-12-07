package drc.anim;

import drc.anim.DrcDisplayData;
import openfl.Vector;

@:allow(drc.anim.DrcSkeletonParser)
class DrcSkinSlotData //** Define metadata allow.
{
	//** Publics.
	
	@:isVar
	public var name(get, null):String; //** Define metadata isVar.
	
	//** Privates.
	
	/** @private **/ public var __displays:Vector<DrcDisplayData>;
	
	/** @private **/ private var __name:String;
	
	public function new() 
	{
		
	}
	
	private function __addDisplay(display:DrcDisplayData):Void
	{
		__displays.push(display);
	}
	
	private function __initDisplays(count:Int):Void
	{
		__displays = new Vector<DrcDisplayData>();
	}
	
	//** Getters and setters.
	
	private function get_name():String
	{
		return __name;
	}
}