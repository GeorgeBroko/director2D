package cont;

import drc.display.DrcProfile;
import drc.graphics.DrcTile;
import drc.graphics.DrcTileMap;
import drc.objects.DrcScene;
import openfl.display.BitmapData;
import openfl.geom.Rectangle;
import openfl.utils.Assets;
import cont.Bunny;

class BunnyMark extends DrcScene
{
	private var __bunnies:Array<Bunny> = new Array();
	
	private var __bitmapData:BitmapData;
	
	private var __tilemap:DrcTileMap;
	
	private var gravity:Float;
	private var minX:Int;
	private var minY:Int;
	private var maxX:Int;
	private var maxY:Int;
	
	public function new() 
	{
		super();
		
		minX = 0;
		maxX = 640;
		minY = 0;
		maxY = 480;
		gravity = 0.5;
		
		__bitmapData = Assets.getBitmapData("textures/bunny.png");
		
		__tilemap = new DrcTileMap(new DrcProfile("profiles/default.json"), __bitmapData);
		
		__tilemap.regions.push(new Rectangle(0, 0, 25, 35));
		
		addGraphic(__tilemap);
		
		for (i in 0...4000)
		{
			addBunny();
		}
		
		//addBunny();
	}
	
	public function addBunny():Void
	{
		var bunny:Bunny = new Bunny(__tilemap, 0, 0, 0);
		
		bunny.speedX = Math.random () * 5;
		bunny.speedY = (Math.random () * 5) - 2.5;
		
		__bunnies.push(bunny);
		
		__tilemap.addTile(bunny);
	}
	
	override public function update():Void 
	{
		super.update();
		
		for (bunny in __bunnies)
		{
			bunny.x += bunny.speedX;
			bunny.y += bunny.speedY;
			bunny.speedY += gravity;

			if (bunny.x > maxX)
			{

				bunny.speedX *= -1;
				bunny.x = maxX;

			}
			else if (bunny.x < minX)
			{

				bunny.speedX *= -1;
				bunny.x = minX;

			}

			if (bunny.y > maxY)
			{

				bunny.speedY *= -0.8;
				bunny.y = maxY;

				if (Math.random () > 0.5)
				{

					bunny.speedY -= 3 + Math.random () * 4;

				}

			}
			else if (bunny.y < minY)
			{

				bunny.speedY = 0;
				bunny.y = minY;

			}
		}
	}
}