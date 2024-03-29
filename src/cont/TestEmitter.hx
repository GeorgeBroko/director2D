package cont;

import drc.display.DrcProfile;
import drc.graphics.DrcEmitter;
import drc.graphics.DrcTileMap;
import drc.objects.DrcScene;
import openfl.geom.Rectangle;
import openfl.utils.Assets;
import drc.utils.DrcCommon;
import drc.input.DrcKey;
import drc.graphics.DrcMesh;

class TestEmitter extends DrcScene
{
	private var __tilemap:DrcTileMap;
	
	private var __profile:DrcProfile;
	
	private var __emitter:DrcEmitter;
	
	public function new() 
	{
		super();
		
		__profile = new DrcProfile("profiles/default.json");
		
		__tilemap = new DrcTileMap(__profile, Assets.getBitmapData("textures/rect.png"));
		
		__tilemap.regions.push(new Rectangle(0, 0, 16, 16));
		
		addGraphic(__tilemap);
		
		__emitter = new DrcEmitter(__tilemap);
		
		addEmitter(__emitter);
	}
	
	override public function update():Void 
	{
		if (DrcCommon.input.mouse.check(0))
		{
			__emitter.emit(mouseX, mouseY, 45, 135);
		}
		
		super.update();
	}
}