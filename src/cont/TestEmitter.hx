package cont;

import drc.display.DrcProfile;
import drc.graphics.DrcEmitter;
import drc.graphics.DrcTileMap;
import drc.objects.DrcScene;
import openfl.geom.Rectangle;
import openfl.utils.Assets;

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
		
		__tilemap.regions.push(new Rectangle(0, 0, 45, 45));
		
		addGraphic(__tilemap);
		
		__emitter = new DrcEmitter(__tilemap);
	}
}