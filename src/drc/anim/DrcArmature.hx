package drc.anim;

import drc.anim.DrcArmatureData;
import drc.graphics.DrcTile;
import drc.graphics.DrcTileMap;
import openfl.Vector;
import cont.Test;

class DrcArmature
{
	//** Publics.
	
	public var data:DrcArmatureData;
	
	public var tiles:Vector<DrcTile> = new Vector<DrcTile>();
	
	public var tilemap:DrcTileMap;
	
	//** Privates.
	
	public function new() 
	{
		
	}
	
	public function init():Void
	{
		for (slot in data.__slots)
		{
			var tile:DrcTile = new DrcTile(tilemap);
			
			slot.displays[0].tile = tile;
			
			tilemap.addTile(tile);
		}
	}
	
	public function play(indexes:Array<Int>):Void
	{
		data.play(indexes);
	}
	
	public function update():Void
	{
		data.step();
		
		for (slot in data.__slots)
		{
			//slot.displays[0].tile.x = slot.parentBone.x;
			//
			//slot.displays[0].tile.y = slot.parentBone.y;
			//
			Test.__image.x = slot.parentBone.x;
			
			Test.__image.y = slot.parentBone.y;
		}
	}
}