package drc.graphics;

import drc.display.DrcGraphic;
import openfl.Vector;
import openfl.geom.Rectangle;
import haxe.ds.StringMap;
import Map;

class DrcTile extends DrcGraphic //** Define metadata allow.
{
	//** Publics.
	
	public var id(get, set):UInt;
	
	public var layer(get, set):Int;
	
	/**
	 * The parent class of the tile. Cannot be set.
	 */
	public var parent(get, null):DrcTileMap;
	
	//** Privates.
	
	/** @private */ private var __id:UInt = 0;
	
	/** @private */ private var __layer:Int = 0;
	
	/** @private */ private var __parent:DrcTileMap;
	
	public function new(parent:DrcTileMap, id:UInt = 0, x:Float = 0, y:Float = 0) 
	{
		super();
		
		__parent = parent;
		
		__x = x;
		
		__y = y;
		
		//for (vertex in 0...4)
		//{
			//vertices.insert(__parent.profile.dataPerVertex);
		//}
		
		vertices.insert(__parent.profile.dataPerVertex * 4);
		
		this.id = id;
	}
	
	override public function init():Void 
	{
		
	}
	
	override public function release():Void 
	{
		
	}
	
	override public function remove():Void 
	{
		__parent.removeTile(this);
	}
	
	override function set_x(value:Float):Float 
	{
		__x = value;
		
		return __x;
	}
	
	override function set_y(value:Float):Float 
	{
		__y = value;
		
		return __y;
	}
	
	override public function render():Void 
	{
		var radian = angle * (Math.PI / -180);
		
		var cosT = Math.cos(radian);
		
		var sinT = Math.sin(radian);
		
		var scaledWidth:Float = width * scaleX;
        var scaledHeight:Float = height * scaleY;
		
		var centerX:Float = originX;
        var centerY:Float = originX;
		//
		//vertices.innerData[0] = (__x + offsetX) - (cosT * centerX) - (sinT * centerY);
		//
		//vertices.innerData[6] = (__x + offsetX) - (cosT * centerX) + (sinT * (scaledHeight - centerY)); 
		//
		//vertices.innerData[12] = (__x + offsetX) + (cosT * (scaledWidth - centerX)) + (sinT * (scaledHeight - centerY));
		//
		//vertices.innerData[18] =  (__x + offsetX) + (cosT * (scaledWidth - centerX)) - (sinT * centerY);
		//
		//vertices.innerData[1] = (__y + offsetY) + (sinT * centerX) - (cosT * centerY);
		//
		//vertices.innerData[7] = (__y + offsetY) + (sinT * centerX) + (cosT * (scaledHeight - centerY));
		//
		//vertices.innerData[13] = (__y + offsetY) - (sinT * (scaledWidth - centerX)) + (cosT * (scaledHeight - centerY));
		//
		//vertices.innerData[19] = (__y + offsetY) - (sinT * (scaledWidth - centerX)) - (cosT * centerY);
		
		
		vertices.innerData[__parent.profile.attributes[0].pointers[0].locations[0]] = (__x + offsetX) - (cosT * centerX) - (sinT * centerY);
		
		vertices.innerData[__parent.profile.attributes[0].pointers[0].locations[1]] = (__x + offsetX) - (cosT * centerX) + (sinT * (scaledHeight - centerY)); 
		
		vertices.innerData[__parent.profile.attributes[0].pointers[0].locations[2]] = (__x + offsetX) + (cosT * (scaledWidth - centerX)) + (sinT * (scaledHeight - centerY));
		
		vertices.innerData[__parent.profile.attributes[0].pointers[0].locations[3]] =  (__x + offsetX) + (cosT * (scaledWidth - centerX)) - (sinT * centerY);
		
		vertices.innerData[__parent.profile.attributes[0].pointers[1].locations[0]] = (__y + offsetY) + (sinT * centerX) - (cosT * centerY);
		
		vertices.innerData[__parent.profile.attributes[0].pointers[1].locations[1]] = (__y + offsetY) + (sinT * centerX) + (cosT * (scaledHeight - centerY));
		
		vertices.innerData[__parent.profile.attributes[0].pointers[1].locations[2]] = (__y + offsetY) - (sinT * (scaledWidth - centerX)) + (cosT * (scaledHeight - centerY));
		
		vertices.innerData[__parent.profile.attributes[0].pointers[1].locations[3]] = (__y + offsetY) - (sinT * (scaledWidth - centerX)) - (cosT * centerY);
	}
	
	//** Getters and setters.
	
	override private function set_angle(value:Float):Float
	{
		//** Clamp the angle between 0 and 359.
		
		__angle = (value %= 360) >= 0 ? value : (value + 360);
		
		return value;
	}
	
	private function get_id():UInt
	{
		return __id;
	}
	
	private function set_id(value:UInt):UInt
	{
		//** Set the id.
		
		__id = value;
		
		//** Get the rectangle based on the id.
		
		var rect:Rectangle = __parent.regions[__id];
		
		//** Set the y of the UV.
		
		vertices.innerData[4] = rect.x / parent.texture.width;
		vertices.innerData[5] = rect.y / parent.texture.height; //y
		
		vertices.innerData[10] = rect.x / parent.texture.width;	//down
		vertices.innerData[11] = (rect.y + rect.height) / parent.texture.height;
		
		vertices.innerData[16] = (rect.x + rect.width) / parent.texture.width; //Width
		vertices.innerData[17] = (rect.y + rect.height) / parent.texture.height; //Height
		
		vertices.innerData[22] = (rect.x + rect.width) / parent.texture.width; //up
		vertices.innerData[23] = rect.y / parent.texture.height;
		
		//** Set the width of the tile.
		
		//width = __parent.texture.width * rectangle.width;
		width = rect.width;
		
		//** Set the height of the tile.
		
		//height = __parent.texture.height * rectangle.height;
		height = rect.height;
		
		//** Return...
		
		return __id;
	}
	
	private function get_layer():Int
	{
		return __layer;
	}
	
	private function set_layer(value:Int):Int
	{
		__layer = value;
		
		return __layer;
	}
	
	override function set_scaleX(value:Float):Float 
	{
		__scaleX = value;
		
		return __scaleX;
	}
	
	
	override function set_scaleY(value:Float):Float 
	{
		__scaleY = value;
		
		return __scaleY;
	}
	
	private function get_parent():DrcTileMap
	{
		return __parent;
	}
}