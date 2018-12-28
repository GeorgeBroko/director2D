package drc.objects;

import drc.graphics.DrcMesh;
import drc.objects.DrcEntity;
import drc.objects.DrcObject;
import drc.part.DrcList;
import drc.utils.DrcCommon;

#if debug // ------

import drc.debug.DrcConsole;

#end // ------

class DrcScene extends DrcObject
{
	//** Publics.
	
	/**
	 * The camera of the scene.
	 */
	public var camera:DrcCamera = new DrcCamera();
	
	/**
	 * A list of every entity in the scene.
	 */
	public var entities:DrcList<DrcEntity> = new DrcList<DrcEntity>();
	
	/**
	 * A list of every graphic in the scene.
	 */
	public var graphics:DrcList<DrcMesh> = new DrcList<DrcMesh>();
	
	/**
	 * The layer of the scene.
	 */
	public var layer:Int;
	
	/**
	 * The X position of the mouse in the scene. Cannot be set.
	 */
	public var mouseX(get, null):Float;
	
	/**
	 * The Y position of the mouse in the scene. Cannot be set.
	 */
	public var mouseY(get, null):Float;
	
	#if debug // ------
	
	private var __console:DrcConsole;
	
	#end // ------
	
	public function new() 
	{
		super();
		
		//camera.viewMatrix.appendTranslation(-320, -240, 0);
		
		#if debug // ------
		
		__console = new DrcConsole();
		
		#end // ------
	}
	
	public function addEntity(entity:DrcEntity):DrcEntity
	{
		return entities.add(entity);
	}
	
	public function addGraphic(graphic:DrcMesh):DrcMesh
	{
		graphic.z = layer;
		
		return graphics.add(graphic);
	}
	
	public function removeEntity(entity:DrcEntity):Void
	{
		entities.remove(entity);
	}
	
	public function removeGraphic(graphic:DrcMesh):Void
	{
		graphics.remove(graphic);
	}
	
	public function render():Void
	{
		graphics.forEachActive(__renderGraphics);
	}
	
	private function __renderGraphics(graphic:DrcMesh):Void
	{
		//** Render the graphic.
		
		graphic.render();
		
		//** Render the camera.
		
		camera.render(graphic.matrix, false);
		
		//** Draw the graphic on the screen.
		
		DrcCommon.screen.draw(graphic, camera.modelViewMatrix);
	}
	
	public function update():Void
	{
		entities.forEachActive(__updateEntities);
	}
	
	private function __updateEntities(entity:DrcEntity):Void
	{
		entity.update();
	}
	
	//** Getters and setters.
	
	private function get_mouseX():Float
	{
		return DrcCommon.view.mouseX - camera.viewMatrix.position.x;
	}
	
	private function get_mouseY():Float
	{
		return  DrcCommon.view.mouseY - camera.viewMatrix.position.y;
	}
}