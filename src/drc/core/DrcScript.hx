package drc.core;

import openfl.utils.Assets;
import haxe.Json;

abstract DrcScript(Dynamic) from String to Dynamic
{
	public inline function new(path:String) 
	{
		this = Json.parse(Assets.getText(path));
	}
	
	@:arrayAccess
	public inline function set(key:String, value:Dynamic):Void
	{
		Reflect.setField(this, key, value);
	}
	
	@:arrayAccess
	public inline function get(key:String):DrcScript 
	{
		return Reflect.field(this, key);
	}
	
	@:arrayAccess
	public inline function forEach(key:String, func:String -> Void):Void 
	{
		var data:Dynamic = Reflect.field(this, key);
		
		for (i in 0...data.length)
		{
			func(data[i]);
		}
	}
}