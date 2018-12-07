package drc.graphics;

import openfl.Vector;

class DrcText 
{
	//** Publics.
	
	/**
	 * The height of the text.
	 */
	@:isVar
	public var height(get, null):Int; //** Define metadata isVar.
	
	/**
	 * The space between lines.
	 */
	public var leading:Int = 16;
	
	/**
	 * The number of lines the text has.
	 */
	@:isVar
	public var lines(get, null):Int; //** Define metadata isVar.
	
	/**
	 * The space between words.
	 */
	public var spacing:Int = 4;
	
	/**
	 * The string value of the text.
	 */
	@:isVar
	public var text(get, set):String; //** Define metadata isVar.
	
	/**
	 * The space between letters.
	 */
	public var tracking:Int = 1;
	
	/**
	 * The width of the text.
	 */
	@:isVar
	public var width(get, null):Int; //** Define metadata isVar.
	
	/**
	 * The x position of the text in space.
	 */
	@:isVar
	public var x(get, set):Float; //** Define metadata isVar.
	
	/**
	 * The y position of the text in space.
	 */
	@:isVar
	public var y(get, set):Float; //** Define metadata isVar.
	
	//** Privates.
	
	/** @private */ private var __height:Int = 0;
	
	/** @private */ private var __lines:Int = 0;
	
	/** @private */ private var __characters:Vector<Int> = new Vector<Int>();
	
	/** @private */ private var __parent:DrcCharMap;
	
	/** @private */ private var __text:String = "";
	
	/** @private */ private var __width:Int = 0;
	
	/** @private */ private var __x:Float;
	
	/** @private */ private var __y:Float;
	
	public function new(parent:DrcCharMap, value:String, x:Float = 0, y:Float = 0) 
	{
		__parent = parent;
		
		__x = x;
		
		__y = y;
		
		text = value;
	}
	
	//** Getters and setters.
	
	private function get_height():Int
	{
		return __height;
	}
	
	private function get_lines():Int
	{
		return __lines;
	}
	
	private function get_width():Int
	{
		return __width;
	}
	
	private function get_text():String
	{
		return __text;
	}
	
	private function set_text(text:String):String
	{
		__text = text;
		
		for (count in 0...__characters.length)
		{
			__parent.removeTileAt(__characters[count]);
		}
		
		__characters.splice(0, __characters.length);
		
		__lines = 1;
		
		var last:Float = 0;
		
		var offsetY:Float = 0;
		
		var space:Int = 0;
		
		var overallWidth:Int = 0;
		var overallHeight:Int = 0;
		
		for (count in 0...__text.length) 
		{
			if (__text.charCodeAt(count) == 10)
			{
				__lines ++;
				
				offsetY += leading;
				
				last = 0;
				
				space = 0;
				
				continue;
			}
			
			if (__text.charCodeAt(count) == 32)
			{
				last += spacing;
				
				overallWidth += spacing;
				
				continue;
			}
			
			var tile:DrcTile = new DrcTile(__parent, __text.charCodeAt(count));
			
			tile.offsetX = __x + (space + last);
			tile.offsetY = __y + offsetY;
			
			last += tile.width;
			
			space += tracking;
			
			__characters.push(count);
			
			__parent.addTile(tile);
		}
		
		__width = overallWidth;
		
		return __text;
	}
	
	private function get_x():Float
	{
		return __x;
	}
	
	private function set_x(value:Float):Float
	{
		for (count in 0...__characters.length) 
		{
			__parent.tiles.members[__characters[count]].x = value;
		}
		
		return __x = value;
	}
	
	private function get_y():Float
	{
		return __y;
	}
	
	private function set_y(value:Float):Float
	{
		for (count in 0...__characters.length) 
		{
			__parent.tiles.members[__characters[count]].y = value;
		}
		
		return __y;
	}
}