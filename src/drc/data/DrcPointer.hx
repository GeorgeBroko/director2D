package drc.data;

import openfl.Vector;

class DrcPointer 
{
	public var locations:Vector<Int>;
	
	public var name:String;
	
	public function new(name:String, locations:Vector<Int>)
	{
		this.name = name;
		
		this.locations = locations;
	}
}