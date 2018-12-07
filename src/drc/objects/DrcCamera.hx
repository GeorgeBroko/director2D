package drc.objects;

import drc.geom.DrcMatrix;
import drc.geom.DrcProjection;

class DrcCamera 
{
	//** Publics.
	
	public var modelViewMatrix:DrcMatrix = new DrcMatrix();
	
	public var viewMatrix:DrcMatrix = new DrcMatrix();
	
	public var projection:DrcProjection = new DrcProjection();
	
	//** Privates.
	
	/** @private */ private var __far:Float;
	
	/** @private */ private var __near:Float;
	
	/** @private */ private var __width:Float;
	
	/** @private */ private var __height:Float;
	
	public function new() 
	{
		
	}
	
	public function render(modelMatrix:DrcMatrix, flip:Bool):Void
	{
		modelViewMatrix.identity();
		
		modelViewMatrix.append(modelMatrix);
		
		//viewMatrix.appendTranslation(-1, 0, 0);
		
		modelViewMatrix.append(viewMatrix);
		
		//projection.perspectiveLH(640, 480, 0.1, 100);
		
		if (flip)
		{
			projection.orthographicFlipped(640, 480, 0.1, 10);
		}
		else 
		{
			//projection.perspectiveLH(640, 480, 0.1, 100);
			
			//projection.orthographicTest(0, 640, 0, 480, -1000, 1000);
			
			projection.orthographic(640, 480, 0.1, 10);
		}
		
		//projection.orthographic(640, 480, 0.1, 1000);
		
		modelViewMatrix.append(projection);
	}
}