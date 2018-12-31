package drc.graphics;

import drc.graphics.DrcParticle;
import drc.graphics.DrcTileMap;
import drc.objects.DrcObject;
import drc.objects.DrcScene;
import drc.utils.DrcCommon;
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
	
	public function emit(x:Float, y:Float, angle:Float, angleRange:Float):Void
	{
		var particle:DrcParticle = new DrcParticle();
		
		var radian = angle * (Math.PI / -180);
		
		var radianRage = angleRange * (Math.PI / -180);
		
		particle.duration = 2;
		
		particle.x = x;
		
		particle.y = y;
		
		particle.velocityX = Math.cos(radian + radianRage * DrcCommon.random());
		
		particle.velocityY = Math.sin(radian + radianRage * DrcCommon.random());
		
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