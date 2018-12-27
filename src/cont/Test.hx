package cont;

import drc.anim.DrcArmatureData;
import drc.anim.DrcSkeletonParser;
import drc.display.DrcProfile;
import drc.graphics.DrcImage;
import drc.graphics.DrcTile;
import drc.graphics.DrcTileMap;
import drc.objects.DrcScene;
import drc.sound.DrcSound;
import drc.tweens.DrcNumTween;
import lime.media.AudioBuffer;
import openfl.display.BitmapData;
import openfl.geom.Rectangle;
import openfl.utils.Assets;
import drc.tweens.DrcTweenType;
import drc.anim.DrcArmature;

class Test extends DrcScene
{
	private var __profile:DrcProfile;
	
	private var __bitmapData:BitmapData;
	
	public static var __image:DrcImage;
	
	private var __tilemap:DrcTileMap;
	
	private var __tween:DrcNumTween;
	
	private var __num:Float = 0;
	
	private var __skeletonParser:DrcSkeletonParser;
	
	private var __armatureData:DrcArmatureData;
	
	private var __armature:DrcArmature = new DrcArmature();
	
	private var __sound:DrcSound;
	
	private var __tile:DrcTile;
	
	public function new() 
	{
		super();
		
		//camera.viewMatrix.appendTranslation(-320, -240, 0);
		
		__profile = new DrcProfile("profiles/default.json");
		
		__bitmapData = Assets.getBitmapData("textures/grid.png");
		
		__image = new DrcImage(__profile, __bitmapData);
		
		__image.x = 0;
		
		addGraphic(__image);
		
		__tilemap = new DrcTileMap(__profile, Assets.getBitmapData("textures/sprites2.png"));
		
		__tilemap.regions.push(new Rectangle(0, 0, 32, 32));
		//__tilemap.rectangles.push(new Rectangle(0, 0, 0.125, 0.125));
		
		__tile = new DrcTile(__tilemap);
		
		//__tile.originX = 128;
		//__tile.originY = 128;
		
		__tile.x = 32;
		__tile.y = 32;
		
		//__tile.scaleX = 4;
		//__tile.scaleY = 4;
		
		__tilemap.addTile(__tile);
		
		addGraphic(__tilemap);
		
		//__tween = new DrcNumTween(DrcTweenType.PERSIST);
		//
		//__tween.tween(__image.x, 600, 10);
		//
		//__skeletonParser = new DrcSkeletonParser(Assets.getText("armatures/test_ske.json"), Assets.getText("armatures/test_tex.json"));
		//
		//__armature.tilemap = __tilemap;
		//
		//__armature.data = __skeletonParser.armatureDatas[0];
		//
		//__armature.init();
		//
		//__armature.play([0]);
		//
		//__sound = new DrcSound(AudioBuffer.fromFile("music/CutTheFat.ogg"));
	}
	
	override public function render():Void 
	{
		super.render();
	}
	
	override public function update():Void 
	{
		super.update();
		
		__tile.angle += 1;
		
		//__armature.update();
		
		//__armatureData.step();
		
		//__tween.update();
		
		//__image.y += 2;
		
		//__image.x = __tween.value;
		
		//trace(__tween.value);
	}
}