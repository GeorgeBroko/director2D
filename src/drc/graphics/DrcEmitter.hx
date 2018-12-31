package drc.graphics;

import drc.graphics.DrcParticle;
import drc.graphics.DrcTileMap;
import drc.objects.DrcObject;
import drc.objects.DrcScene;
import openfl.Vector;

@:allow(drc.objects.DrcScene)
class DrcEmitter extends DrcObject
{
	//** Publics.
	
	/**
	 * The parent class of the emitter. Cannot be set.
	 */
	public var parent(get, null):DrcTileMap;
	
	/**
	 * A list of all active particles.
	 */
	public var particles:Vector<Int> = new Vector<Int>();
	
	/**
	 * The parent scene which the emitter belongs to.
	 */
	public var scene(get, null):DrcScene;
	
	//** Privates.
	
	private var __parent:DrcTileMap;
	
	private var __scene:DrcScene;
	
	public function new(parent:DrcTileMap) 
	{
		super();
		
		__parent = parent;
	}
	
	override public function init():Void
	{
		
	}
	
	override public function release():Void
	{
		
	}
	
	public function emit(x:Float, y:Float):Void
	{
		var particle:DrcParticle = new DrcParticle();
		
		particle.x = x;
		
		particle.y = y;
		
		particle.velocityX = Math.random() * 7 + 1;
		
		particle.velocityY = Math.random() * 7 + 1;
		
		particle.graphic = parent.addTile(new DrcTile(parent, 0, 0, 0));
		
		particles.push(__scene.addEntity(particle).index);
	}
	
	//** Getters and setters.
	
	private function get_parent():DrcTileMap
	{
		return __parent;
	}
	
	private function get_scene():DrcScene
	{
		return __scene;
	}
}