package drc.anim;

import drc.anim.DrcAnimationData;
import drc.anim.DrcBoneData;
import drc.anim.DrcSkinData;
import drc.anim.DrcSlotData;
import Map;
import openfl.Vector;

@:allow(drc.anim.DrcSkeletonParser)
@:allow(drc.anim.DrcArmature)
class DrcArmatureData 
{
	//** Publics.
	
	public var currentAnimations:Vector<DrcAnimationData> = new Vector<DrcAnimationData>();
	
	@:isVar
	public var name(get, null):String; //** Define metadata isVar.
	
	/**
	 * User data.
	 */
	public var userData(get, null):Dynamic;
	
	//** Privates.
	
	/** @private **/ private var __animations:Vector<DrcAnimationData> = new Vector<DrcAnimationData>();
	
	/** @private **/ private var __bones:Map<String, DrcBoneData> = new Map<String, DrcBoneData>();
	
	/** @private **/ private var __frameRate:String;
	
	/** @private **/ private var __name:String;
	
	/** @private **/ private var __slots:Map<String, DrcSlotData> = new Map<String, DrcSlotData>();
	
	/** @private **/ private var __skins:Vector<DrcSkinData> = new Vector<DrcSkinData>();
	
	/** @private **/ private var __type:String;
	
	/** @private **/ private var __userData:Dynamic;
	
	public function new() 
	{
		
	}
	
	public function play(indexes:Array<Int>):Void
	{
		for (count in 0...indexes.length)
		{
			currentAnimations.push(__animations[indexes[count]]);
			
			currentAnimations[count].play();
		}
	}
	
	public function step():Void
	{
		if (currentAnimations.length == 0)
		{
			return;
		}
		
		for (count in 0...currentAnimations.length)
		{
			currentAnimations[count].step();
		}
	}
	
	public function getBone(name:String):DrcBoneData
	{
		return __bones.get(name);
	}
	
	public function getSlot(name:String):DrcSlotData
	{
		return __slots.get(name);
	}
	
	private function __addBone(boneData:DrcBoneData):Void
	{
		__bones.set(boneData.name, boneData);
	}
	
	private function __addSlot(slotData:DrcSlotData):Void
	{
		__slots.set(slotData.name, slotData);
	}
	
	private function __addSkin(skinData:DrcSkinData):Void
	{
		__skins.push(skinData);
	}
	
	private function __addAnimation(animationData:DrcAnimationData):Void
	{
		for (count in 0...animationData.__boneFrames.length)
		{
			animationData.__boneFrames[count].bone = getBone(animationData.__boneFrames[count].name);
		}
		
		__animations.push(animationData);
	}
	
	private function __assignParentBones():Void
	{
		for (bone in __bones)
		{
			//** Check if parent is null.
			
			if (bone.__parentName == null)
			{
				continue;
			}
			
			//** Assign a parent bone.
			
			bone.parentBone = getBone(bone.__parentName);
		}
		
		for (slot in __slots)
		{
			//** Check if parent is null.
			
			if (slot.__parentName == null)
			{
				continue;
			}
			
			//** Assign a parent bone.
			
			slot.parentBone = getBone(slot.__parentName);
		}
		
		for (count in 0...__skins[0].__skinSlots.length)
		{
			var name:String = __skins[0].__skinSlots[count].name;
			
			getSlot(name).displays = __skins[0].__skinSlots[count].__displays;
		}
	}
	
	//** Getters and setters.
	
	private function get_name():String
	{
		return __name;
	}
	
	private function get_userData():Dynamic
	{
		return __userData;
	}
}