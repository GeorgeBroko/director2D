package drc.graphics;

import drc.display.DrcProfile;
import openfl.geom.Rectangle;
import openfl.utils.Assets;
import haxe.Json;
import openfl.Vector;

class DrcCharMap extends DrcTileMap
{
	//** Publics.
	
	//** Privates.
	
	public function new(profile:DrcProfile, font:Dynamic) 
	{
		var fontData:Dynamic = Json.parse(font);
		
		var rects:Vector<Rectangle> = new Vector<Rectangle>(255, true);
		
		var chars:Dynamic;
		
		if (Reflect.hasField(fontData, "chars"))
		{
			chars = Reflect.field(fontData, "chars");
			
			//var rects:Vector<Rectangle> = new Vector<Rectangle>(255, true);
			
			for (count in 0...chars.length)
			{
				var x:Int = Std.parseInt(chars[count].x);
				
				var y:Int = Std.parseInt(chars[count].y);
				
				var width:Int = Std.parseInt(chars[count].width);
				
				var height:Int = Std.parseInt(chars[count].height);
				
				rects[Std.parseInt(chars[count].id)] = new Rectangle(x, y, width, height);
			}
		}
		
		super(profile, Assets.getBitmapData("fonts/" + fontData.source), rects);
	}
}