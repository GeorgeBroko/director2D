package drc.anim;

import drc.anim.DrcAnimationData;
import drc.anim.DrcArmatureData;
import drc.anim.DrcRegion;
import haxe.Json;
import openfl.Vector;

class DrcSkeletonParser 
{
	public var armatureDatas:Vector<DrcArmatureData> = new Vector<DrcArmatureData>();
	
	public var textureDatas:Vector<DrcRegion> = new Vector<DrcRegion>();
	
	public function new(skeleton:Dynamic, texture:Dynamic) 
	{
		var textureData:Dynamic = Json.parse(texture);
		
		var regions:Dynamic;
		
		if (Reflect.hasField(textureData, "SubTexture"))
		{
			regions = Reflect.field(textureData, "SubTexture");
			
			for (count in 0...regions.length)
			{
				textureDatas.push(__getRegion(regions[count]));
			}
		}
		
		var skeletonData:Dynamic = Json.parse(skeleton);
		
		var armatures:Dynamic;
		
		if (Reflect.hasField(skeletonData, "armature"))
		{
			armatures = Reflect.field(skeletonData, "armature");
			
			for (count in 0...armatures.length)
			{
				armatureDatas.push(__getArmatureData(armatures[count]));
			}
		}
	}
	
	private function __getRegion(data:Dynamic):DrcRegion
	{
		var region:DrcRegion = new DrcRegion();
		
		region.name = data.name;
		
		region.x = data.x;
		
		region.y = data.y;
		
		region.width = data.width;
		
		region.height = data.height;
		
		return region;
	}
	
	private function __getArmatureData(data:Dynamic):DrcArmatureData
	{
		var armatureData:DrcArmatureData = new DrcArmatureData();
		
		armatureData.__name = data.name;
		
		armatureData.__userData = data.userData;
		
		armatureData.__type = data.type;
		
		//** Parse bones.
		
		var bones:Dynamic;
		
		if (Reflect.hasField(data, "bone"))
		{
			bones = Reflect.field(data, "bone");
			
			for (count in 0...bones.length)
			{
				armatureData.__addBone(__getBoneData(bones[count]));
			}
		}
		
		//** Parse slots.
		
		var slots:Dynamic;
		
		if (Reflect.hasField(data, "slot"))
		{
			slots = Reflect.field(data, "slot");
			
			for (count in 0...slots.length)
			{
				armatureData.__addSlot(__getSlotData(slots[count]));
			}
		}
		
		//** Parse skins.
		
		var skins:Dynamic;
		
		if (Reflect.hasField(data, "skin"))
		{
			skins = Reflect.field(data, "skin");
			
			for (count in 0...skins.length)
			{
				armatureData.__addSkin(__getSkinData(skins[count]));
			}
		}
		
		//** Parse animations.
		
		var animations:Dynamic;
		
		if (Reflect.hasField(data, "animation"))
		{
			animations = Reflect.field(data, "animation");
			
			for (count in 0...animations.length)
			{
				armatureData.__addAnimation(__getAnimationData(animations[count]));
			}
		}
		
		armatureData.__assignParentBones();
		
		return armatureData;
	}
	
	private function __getBoneData(data:Dynamic):DrcBoneData
	{
		var boneData:DrcBoneData = new DrcBoneData();
		
		boneData.__name = data.name;
		
		boneData.__parentName = data.parent;
		
		if (Reflect.hasField(data, "transform"))
		{
			var transformation:Dynamic = Reflect.field(data, "transform");
			
			boneData.transformation = __getTransformationData(transformation);
			
			return boneData;
		}
		
		boneData.transformation = new DrcTransformation();
		
		return boneData;
	}
	
	private function __getSlotData(data:Dynamic):DrcSlotData
	{
		var slotData:DrcSlotData = new DrcSlotData();
		
		slotData.__name = data.name;
		
		slotData.__parentName = data.parent;
		
		return slotData;
	}
	
	private function __getSkinData(data:Dynamic):DrcSkinData
	{
		var skinData:DrcSkinData = new DrcSkinData();
		
		skinData.__name = __getString(data, "name", "default");
		
		if (Reflect.hasField(data, "slot"))
		{
			var skinSlots:Dynamic = Reflect.field(data, "slot");
			
			skinData.__initSkinSlots(skinSlots.length);
			
			for (count in 0...skinSlots.length)
			{
				skinData.__addSkinSlot(__getSkinSlotData(skinSlots[count]));
			}
		}
		
		return skinData;
	}
	
	private function __getSkinSlotData(data:Dynamic):DrcSkinSlotData
	{
		var skinSlotData:DrcSkinSlotData = new DrcSkinSlotData();
		
		skinSlotData.__name = __getString(data, "name", "default");
		
		if (Reflect.hasField(data, "display"))
		{
			var displays:Dynamic = Reflect.field(data, "display");
			
			skinSlotData.__initDisplays(displays.length);
			
			for (count in 0...displays.length)
			{
				skinSlotData.__addDisplay(__getDisplayData(displays[count]));
			}
		}
		
		return skinSlotData;
	}
	
	private function __getDisplayData(data:Dynamic):DrcDisplayData
	{
		var display:DrcDisplayData = new DrcDisplayData();
		
		display.__name = __getString(data, "name", "default");
		
		if (Reflect.hasField(data, "transform"))
		{
			var transformation:Dynamic = Reflect.field(data, "transform");
			
			display.transformation = __getTransformationData(transformation);
			
			return display;
		}
		
		display.transformation = new DrcTransformation();
		
		return display;
	}
	
	private function __getAnimationData(data:Dynamic):DrcAnimationData
	{
		var animationData:DrcAnimationData = new DrcAnimationData();
		
		animationData.__name = data.name;
		
		animationData.__playTimes = data.playTimes;
		
		animationData.__frameCount = data.duration;
		
		if (Reflect.hasField(data, "bone"))
		{
			var bones:Dynamic = Reflect.field(data, "bone");
			
			animationData.__initBoneFrames(bones.length);
			
			for (count in 0...bones.length)
			{
				animationData.__addBoneFrames(__getBoneFrames(bones[count]));
			}
		}
		
		return animationData;
	}
	
	private function __getBoneFrames(data:Dynamic):DrcBoneFrames
	{
		var boneFrames:DrcBoneFrames = new DrcBoneFrames();
		
		boneFrames.__name = data.name;
		
		if (Reflect.hasField(data, "translateFrame"))
		{
			var translationFrames:Dynamic = Reflect.field(data, "translateFrame");
			
			boneFrames.__initKeyFrames(translationFrames.length);
			
			for (count in 0...translationFrames.length)
			{
				boneFrames.__addKeyFrame(__getBoneKeyFrames(translationFrames[count]));
			}
			
			return boneFrames;
		}
		
		return null;
	}
	
	private function __getBoneKeyFrames(data:Dynamic):DrcBoneKeyFrame
	{
		var boneKeyFrame:DrcBoneKeyFrame = new DrcBoneKeyFrame();
		
		boneKeyFrame.__duration = __getInt(data, "duration", 0);
		
		boneKeyFrame.__x = __getInt(data, "x", 0);
		
		boneKeyFrame.__y = __getInt(data, "y", 0);
		
		return boneKeyFrame;
	}
	
	private function __getTransformationData(data:Dynamic):DrcTransformation
	{
		var transformation:DrcTransformation = new DrcTransformation();
		
		transformation.x = __getFloat(data, "x", 0);
		
		transformation.y = __getFloat(data, "y", 0);
		
		transformation.scaleX = __getFloat(data, "skX", 1);
		
		transformation.scaleY = __getFloat(data, "skY", 1);
		
		transformation.sizeX = __getFloat(data, "scX", 0);
		
		transformation.sizeY = __getFloat(data, "scY", 0);
		
		return transformation;
	}
	
	private function __getInt(data:Dynamic, key:String, defaultValue:Int):Int
	{
		if (Reflect.hasField(data, key))
		{
			var value:Dynamic = Reflect.field(data, key);
			
			if (value == null || value == "NaN")
			{
				return defaultValue;
			}
			
			return value;
		}
		
		return defaultValue;
	}
	
	private function __getFloat(data:Dynamic, key:String, defaultValue:Float):Float
	{
		if (Reflect.hasField(data, key))
		{
			var value:Dynamic = Reflect.field(data, key);
			
			if (value == null || value == "NaN")
			{
				return defaultValue;
			}
			
			return value;
		}
		
		return defaultValue;
	}
	
	private function __getString(data:Dynamic, key:String, defaultValue:String):String
	{
		if (Reflect.hasField(data, key))
		{
			var value:Dynamic = Reflect.field(data, key);
			
			if (value == null || value == "")
			{
				return defaultValue;
			}
			
			return value;
		}
		
		return defaultValue;
	}
}