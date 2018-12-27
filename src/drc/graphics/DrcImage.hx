package drc.graphics;
import drc.graphics.DrcMesh;
import drc.display.DrcProfile;
import openfl.display.BitmapData;
import openfl.Vector;

class DrcImage extends DrcMesh
{
	public function new(profile:DrcProfile, bitmapData:BitmapData) 
	{
		super(profile);
		
		texture.upload(bitmapData);
		
		vertices.upload(new Vector<Float>(
		[0, 0, 0, 0, 1, 
		0, -480, 0, 0, 0, 
		640, -480, 0, 1, 0,
		640, 0, 0, 1, 1]));
		
		//vertices.upload(new Vector<Float>(
		//[0, 0, 0, 0, 1, 
		//0, -0.3, 0, 0, 0, 
		//0.3, -0.3, 0, 1, 0,
		//0.3, 0, 0, 1, 1]));
		
		vertices.upload(new Vector<Float>(
		[0, 0, 0, 0, 0, 0, 
		0, 960, 0, 0, 0, 2,  
		1280, 0, 0, 0, 2, 0]));
		
		indices.upload(new Vector<UInt>([0, 1, 2, 0, 2, 3]));
	}
}