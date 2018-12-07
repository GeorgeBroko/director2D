package drc.display;

import drc.utils.DrcCommon;
import openfl.display.BitmapData;
import openfl.display3D.Context3DTextureFormat;
import openfl.display3D.textures.Texture;

class DrcTexture 
{
	//** Publics.
	
	/**
	 * The width of the texture.
	 */
	public var width(get, null):Int;
	
	/**
	 * The height of the texture.
	 */
	public var height(get, null):Int;
	
	//** Privates.
	
	/** @private */ private var __width:Int;
	
	/** @private */ private var __height:Int;
	
	/** @private */ private var __texture:Texture;
	
	public function new() 
	{
		
	}
	
	/**
	 * Create a new empty texture through the view's context.
	 * 
	 * @param	width	The width of the texture.
	 * 
	 * @param	height	The height of the texture.
	 */
	public function create(width:Int, height:Int):Void
	{
		//** Assign the width to a variable.
		
		__width = width;
		
		//** Assign the height to a variable.
		
		__height = height;
		
		//** Create the texture.
		
		__texture = DrcCommon.view.context.createTexture(width, height, Context3DTextureFormat.BGRA, true);
	}
	
	/**
	 * Frees all resources associated with this texture.
	 */
	public function dispose():Void
	{
		//** Dispose of the texture data.
		
		__texture.dispose();
	}
	
	/**
	 * Upload a new bitmapdata into the texture.
	 * 
	 * @param	bitmapData	The bitmapdata to be as a texture.
	 */
	public function upload(bitmapData:BitmapData):Void
	{
		//** Create a new texture.
		
		create(bitmapData.width, bitmapData.height);
		
		//** Upload a new bitmapdata.
		
		__texture.uploadFromBitmapData(bitmapData);
	}
	
	/**
	 * Returns the inner data of the texture.
	 * 
	 * @return	Texture
	 */
	public function getInnerData():Texture
	{
		return __texture;
	}
	
	// ** Getters and setters.
	
	private function get_width():Int
	{
		return __width;
	}
	
	private function get_height():Int
	{
		return __height;
	}
}