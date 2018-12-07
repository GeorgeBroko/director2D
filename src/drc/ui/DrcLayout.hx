package drc.ui;

import drc.display.DrcProfile;
import drc.graphics.DrcTile;
import drc.graphics.DrcTileMap;
import drc.part.DrcList;
import openfl.geom.Rectangle;
import openfl.utils.Assets;
import drc.graphics.DrcCharMap;

class DrcLayout 
{
	public var tileMap:DrcTileMap;
	
	public var charMap:DrcCharMap;
	
	private var __controls:DrcList<DrcControl> = new DrcList<DrcControl>();
	
	private var __profile:DrcProfile;
	
	public function new() 
	{
		__profile = new DrcProfile("profiles/ui.json");
		
		tileMap = new DrcTileMap(new DrcProfile("profiles/default.json"), Assets.getBitmapData("textures/ui.png"));
		
		tileMap.regions.push(new Rectangle(0, 0, 64, 24));
		
		charMap = new DrcCharMap(__profile, Assets.getText("fonts/openSans.json"));
	}
	
	public function init():Void
	{
		
	}
	
	public function release():Void
	{
		
	}
	
	public function addControl(control:DrcControl):DrcControl
	{
		//control.__parent = this;
		
		for (tile in 0...control.__tiles.length)
		{
			tileMap.addTile(control.__tiles[tile]);
		}
		
		return __controls.add(control);
	}
	
	public function removeControl(control:DrcControl):Void
	{
		__controls.remove(control);
	}
}