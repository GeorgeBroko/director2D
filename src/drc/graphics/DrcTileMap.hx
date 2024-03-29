package drc.graphics;

import drc.display.DrcProfile;
import drc.graphics.DrcMesh;
import drc.part.DrcList;
import openfl.Vector;
import openfl.display.BitmapData;
import openfl.geom.Rectangle;

class DrcTileMap extends DrcMesh
{
	//** Publics.
	
	public var regions:Vector<Rectangle> = new Vector<Rectangle>();
	
	public var tiles:DrcList<DrcTile> = new DrcList<DrcTile>();
	
	//** Privates.
	
	private var __vertexPositions:Vector<Float>;
	
	private var __vertexTexture:Vector<Float>;
	
	public function new(profile:DrcProfile, bitmapData:BitmapData, ?rects:Vector<Rectangle>) 
	{
		//** Super...
		
		super(profile);
		
		//** Upload a texture.
		
		texture.upload(bitmapData);
		
		if (rects != null)
		{
			regions = rects;
		}
		
		//__vertexPositions = new Vector<Float>(profile.attributes[0]. * 4, true);
		
		//__vertexTexture = new Vector<Float>(profile.dataPerVertex[1] * 4, true);
	}
	
	public function addTile(tile:DrcTile):DrcTile
	{
		var position:Int = 4 * tiles.activeCount;
		
		tiles.add(tile);
		
		indices.innerData.push(position);
		
		indices.innerData.push(position + 1);
		
		indices.innerData.push(position + 2);
		
		indices.innerData.push(position);
		
		indices.innerData.push(position + 2);
		
		indices.innerData.push(position + 3);
		
		return tile;
	}
	
	public function removeTile(tile:DrcTile):Void
	{
		removeTileAt(tile.index);
	}
	
	public function removeTileAt(index:Int):Void
	{
		tiles.removeAt(index);
		
		indices.innerData.splice(indices.count - 6, 6);
	}
	
	override function render():Void
	{
		vertices.dispose();
		
		tiles.forEachActive(__renderTile);
	}
	
	private function __renderTile(tile:DrcTile):Void
	{
		//** Render the tile.
		
		tile.render();
		
		//** For each vertex data in the tile...
		
		for (vertex in 0...tile.vertices.innerData.length)
		{
			//** Push the vertex data in the tilemap.
			
			vertices.innerData.push(tile.vertices.innerData[vertex]);
		}
	}
}