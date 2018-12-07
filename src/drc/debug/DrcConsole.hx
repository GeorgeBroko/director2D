package drc.debug;

import drc.display.DrcProfile;
import drc.graphics.DrcTileMap;
import openfl.utils.Assets;

class DrcConsole 
{
	private var __tilemap:DrcTileMap;
	
	public function new() 
	{
		__tilemap = new DrcTileMap(new DrcProfile("profiles/debug.json"), Assets.getBitmapData("textures/debug.png"));
		
		
	}
	
	public static function showTrace(value:Dynamic):Void
	{
		trace(value);
	}
}