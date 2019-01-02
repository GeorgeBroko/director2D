package drc.core;

import drc.display.DrcProfile;
import drc.geom.DrcMatrix;
import drc.graphics.DrcMesh;
import drc.objects.DrcCamera;
import drc.utils.DrcCommon;
import openfl.Vector;
import openfl.display3D.Context3D;
import openfl.display3D.Context3DBlendFactor;
import openfl.display3D.Context3DMipFilter;
import openfl.display3D.Context3DProgramType;
import openfl.display3D.Context3DTextureFilter;
import openfl.display3D.Context3DTriangleFace;
import openfl.display3D.Context3DWrapMode;
import openfl.display3D.IndexBuffer3D;
import openfl.display3D.VertexBuffer3D;

class DrcScreen extends DrcMesh
{
	//** Publics.
	
	/**
	 * The number of objects that has been drawn to the screen.
	 */
	public var drawCalls(get, null):UInt;
	
	/**
	 * The camera of the screen.
	 */
	public var camera:DrcCamera = new DrcCamera();
	
	/**
	 * The number of objects that has been drawn to the screen.
	 */
	public var programChanges(get, null):UInt;
	
	//** Privates.
	
	/** @private */ private var __context:Context3D;
	
	/** @private */ private var __drawCalls:UInt = 0;
	
	/** @private */ private var __lastProgram:String = "";
	
	/** @private */ private var __programChanges:UInt = 0;
	
	/** @private */ private var __vertexBuffer:VertexBuffer3D;
	
	/** @private */ private var __indexBuffer:IndexBuffer3D;
	
	public function new(profile:DrcProfile) 
	{
		//** Super...
		
		super(profile);
		
		//** Pass the context to a private variable.
		
		__context = DrcCommon.view.context;
		
		vertices.upload(new Vector<Float>(
		[0, 0, 0, 0, 1, 
		0, 960, 0, 0, -1,  
		1280, 0, 0, 2, 1]));
		
		indices.upload(new Vector<UInt>([0, 1, 2]));
		
		//** Create an empty texture.
		
		texture.create(640, 480);
		
		//** Append matrix translation to center the screen.
		
		matrix.appendTranslation(-320, -240, 0);
		
		//** Render the camera.
		
		camera.render(matrix, true);
		
		//__context.setPointsEnabled();
	}
	
	/**
	 * Draw a graphic into the screen.
	 * 
	 * @param	graphic: The graphic to draw.
	 * 
	 * @param	matrix: The view matrix.
	 */
	public function draw(mesh:DrcMesh, matrix:DrcMatrix):Void
	{
		//** Draw the triangle of the graphic.
		
		__drawTriangles(mesh, matrix);
		
		//** Increment the value of draw calls by 1.
		
		__drawCalls ++;
	}
	
	/**
	 * Set this screen to be drawn next.
	 */
	public function setToDraw():Void
	{
		//** Set context to render to texture.
		
		__context.setRenderToTexture(texture.getInnerData(), false);
		
		//** Clear the screen.
		
		__context.clear(0, 0, 0, 1);
	}
	
	/**
	 * Present the screen to the back buffer.
	 */
	public function present():Void
	{
		//** Draw the screen.
		
		__drawTriangles(this, camera.modelViewMatrix);
		
		//** Set draw calls to 0.
		
		__drawCalls = 0;
		
		//** Set program changes to 0.
		
		__programChanges = 0;
	}
	
	private function __drawTriangles(mesh:DrcMesh, matrix:DrcMatrix):Void
	{
		//** Check if there is anything to render.
		
		if (mesh.vertices.innerData.length == 0)
		{
			trace("Nothing to render!");
			
			return;
		}
		
		//trace(graphic.vertices.innerData);
		
		//** Set the blender factors of the context.
		
		__context.setBlendFactors(Context3DBlendFactor.ONE, Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
		
		//** Create a vertex buffer based on the graphics profile.
		
		__vertexBuffer = __context.createVertexBuffer(mesh.vertices.count, mesh.profile.dataPerVertex);
		
		//** Upload the vertices from the vector to the vertex buffer.
		
		__vertexBuffer.uploadFromVector(mesh.vertices.innerData, 0, mesh.vertices.count);
		
		//** Create a index buffer based on the graphics profile.
		
		__indexBuffer = __context.createIndexBuffer(mesh.indices.count);
		
		//** Upload the indices from the vector to the index buffer.
		
		__indexBuffer.uploadFromVector(mesh.indices.innerData, 0, mesh.indices.count);
		
		//** Set the vertex attributes.
		
		for (vertexAttributeCount in 0...mesh.profile.attributes.length) 
		{
			//** Set a vertex attribute based on the graphics profile.
			
			__context.setVertexBufferAt(vertexAttributeCount, __vertexBuffer, mesh.profile.attributes[vertexAttributeCount].position, mesh.profile.attributes[vertexAttributeCount].format);
		}
		
		//** Check if the last program used matches with the new.
		
		if (__lastProgram != mesh.profile.program.name)
		{
			//** Set the new program.
			
			__context.setProgram(mesh.profile.program.getInnerData());
			
			//** Set the program that has been used as last.
			
			__lastProgram = mesh.profile.program.name;
			
			//** Increment of program changes.
			
			//trace(mesh.profile.program.name);
			
			__programChanges ++;
		}
		
		__context.setSamplerStateAt(0, Context3DWrapMode.CLAMP, Context3DTextureFilter.NEAREST, Context3DMipFilter.MIPNONE);
		
		//** Set matrix of the graphic as constant.
		
		//** Set the texture of the graphic.
		
		__context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, mesh.profile.constants[0].__location, matrix, false);
		
		__context.setTextureAt(0, mesh.texture.getInnerData());
		
		for (constantCount in 1...mesh.profile.constants.length)
		{
			__context.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, mesh.profile.constants[constantCount].__location, mesh.profile.constants[constantCount].__innerData, 1);
		}
		
		__context.setCulling(Context3DTriangleFace.NONE);
		
		//** Draw the triangles.
		
		__context.drawTriangles(__indexBuffer);
	}
	
	// ** Getters and setters.
	
	private function get_drawCalls():UInt
	{
		return __drawCalls;
	}
	
	private function get_programChanges():UInt
	{
		return __programChanges;
	}
}