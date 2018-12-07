package drc.anim;

import drc.anim.DrcSkinSlotData;
import openfl.Vector;

@:allow(drc.anim.DrcSkeletonParser)
class DrcSkinData //** Define metadata allow.
{
	//** Publics.
	
	@:isVar
	public var name(get, null):String; //** Define metadata isVar.
	
	//** Privates.
	
	/** @private **/ private var __name:String;
	
	/** @private **/ public var __skinSlots:Vector<DrcSkinSlotData>;
	
	public function new() 
	{
		
	}
	
	private function __addSkinSlot(skinSlot:DrcSkinSlotData):Void
	{
		__skinSlots.push(skinSlot);
	}
	
	private function __initSkinSlots(count:Int):Void
	{
		__skinSlots = new Vector<DrcSkinSlotData>();
	}
	
	//** Getters and setters.
	
	private function get_name():String
	{
		return __name;
	}
}