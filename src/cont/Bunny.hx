package cont;

import drc.graphics.DrcTile;
import drc.graphics.DrcTileMap;

class Bunny extends DrcTile
{
	public var speedX:Float;
	
	public var speedY:Float;
	
	public function new(parent:DrcTileMap, id:UInt = 0, x:Float = 0, y:Float = 0) 
	{
		super(parent, id, x, y);
	}
	
	public function update():Void
	{
		
	}
}