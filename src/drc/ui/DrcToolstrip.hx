package drc.ui;

import openfl.Vector;
import drc.graphics.DrcTile;

class DrcToolstrip extends DrcControl
{
	public function new(parent:DrcLayout) 
	{
		super();
		
		__parent = parent;
		
		__tiles = new Vector<DrcTile>();
		
		__tiles[0] = new DrcTile(__parent.tileMap, 0);
		
		__tiles[0].x = 0;
		__tiles[0].y = 0;
		
		__tiles[0].width = 640;
	}
}