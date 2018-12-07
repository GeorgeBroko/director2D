package drc.graphics;

import drc.part.DrcList;
import drc.graphics.DrcPoly;
import drc.display.DrcProfile;
import openfl.display.BitmapData;
import drc.graphics.DrcMesh;

class DrcPolyMap extends DrcMesh
{
	public var meshes:DrcList<DrcPoly> = new DrcList<DrcPoly>();
	
	public function new(profile:DrcProfile, bitmapData:BitmapData) 
	{
		super(profile);
		
		texture.upload(bitmapData);
	}
	
	public function addMesh(mesh:DrcPoly):DrcPoly
	{
		meshes.add(mesh);
		
		return mesh;
	}
	
	public function removeTile(mesh:DrcPoly):Void
	{
		meshes.remove(mesh);
	}
	
	override function render():Void
	{
		//** Dispose of the vertices.
		
		vertices.dispose();
		
		//** Dispose of the indices.
		
		indices.dispose();
		
		meshes.forEachActive(__renderTile);
	}
	
	private function __renderTile(mesh:DrcPoly):Void
	{
		//** Render the tile.
		
		mesh.render();
		
		//** For each vertex data in the mesh...
		
		for (vertex in 0...mesh.vertices.innerData.length)
		{
			//** Push the vertex data in the mesh map.
			
			vertices.innerData.push(mesh.vertices.innerData[vertex]);
		}
		
		//** For each index data in the mesh...
		
		for (index in 0...mesh.indices.innerData.length)
		{
			//** Push the index data in the mesh map.
			
			indices.innerData.push(mesh.indices.innerData[index]);
		}
	}
}