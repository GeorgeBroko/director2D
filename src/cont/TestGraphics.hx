package cont;

import drc.display.DrcProfile;
import drc.graphics.DrcImage;
import drc.graphics.DrcPoly;
import drc.graphics.DrcPolyMap;
import drc.graphics.DrcTile;
import drc.graphics.DrcTileMap;
import drc.objects.DrcScene;
import openfl.display.BitmapData;
import openfl.geom.Rectangle;
import openfl.utils.Assets;

class TestGraphics extends DrcScene
{
	private var __profile:DrcProfile;
	
	private var __bitmapData:BitmapData;
	
	private var __background:DrcImage;
	
	private var __tilemap:DrcTileMap;
	
	private var __tile:DrcTile;
	
	private var __meshmap:DrcPolyMap;
	
	private var __mesh:DrcPoly;
	
	public function new() 
	{
		super();
		
		//camera.viewMatrix.appendTranslation(-320, -240, 0);
		
		__profile = new DrcProfile("profiles/default.json");
		
		__bitmapData = Assets.getBitmapData("textures/grid.png");
		
		__background = new DrcImage(__profile, __bitmapData);
		
		__tilemap = new DrcTileMap(__profile, Assets.getBitmapData("textures/cats.png"));
		
		__tilemap.regions.push(new Rectangle(0, 0, 32, 32));
		
		__tile = new DrcTile(__tilemap, 0);
		
		__tile.y = 64;
		
		__meshmap = new DrcPolyMap(__profile, Assets.getBitmapData("textures/cats.png"));
		
		__mesh = new DrcPoly(__tilemap);
		
		//__mesh.y = 64;
		
		__tilemap.addTile(__tile);
		
		__meshmap.addMesh(__mesh);
		
		//addGraphic(__background);
		
		addGraphic(__tilemap);
	}
}