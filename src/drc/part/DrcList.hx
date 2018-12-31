package drc.part;

import drc.objects.DrcObject;
import openfl.Vector;

class DrcList<T:DrcObject>
{
	//** Publics.
	
	/**
	 * The count of the active members inside the list.
	 */
	public var activeCount(get, null):Int;
	
	/**
	 * The count of all members inside the list.
	 */
	public var count(get, null):Int;
	
	/**
	 * The count of the inactive members inside the list.
	 */
	public var inactiveCount(get, null):Int;
	
	/**
	 * A vector array of all the members.
	 */
	public var members:Vector<T>;
	
	//** Privates.
	
	/** @private */ private var __inactiveMembers:Vector<T>;
	
	public function new(?lenght:Int, ?fixed:Bool) 
	{
		//** Create a new members vector.
		
		members = new Vector<T>(lenght, fixed);
		
		//** Create a new inactive members vector.
		
		__inactiveMembers = new Vector<T>(lenght, fixed);
	}
	
	public function add(object:T):T
	{
		//** Call init method.
		
		object.init();
		
		//** Push a new sprite with a new index into members.
		
		object.__index = members.push(object) - 1;
		
		//** Return.
		
		return object;
	}
	
	public function remove(object:T):Void
	{
		removeAt(object.__index);
	}
	
	public function removeAt(index:Int):Void
	{
		//** Call release method.
		
		members[index].release();
		
		//** If index is lesser than the lenght of the members... 
		
		if (index < members.length - 1)
		{
			//trace(index);
			
			//** Assign the last sprite on the list to the index.
			
			members[index] = members[members.length - 1];
			
			//** Assign the index to the sprite.
			
			members[index].__index = index;
			
			//** Return.
			
			//return;
		}
		
		//** Splice the last sprite on the list.
		
		members.splice(members.length - 1, 1);
	}
	
	public function forEach(func:T -> Void):Void
	{
		for (activeMemberIndex in 0...activeCount) 
		{
			func(members[activeMemberIndex]);
		}
		
		for (inactiveMemberIndex in 0...inactiveCount) 
		{
			func(members[inactiveMemberIndex]);
		}
	}
	
	public function forEachActive(func:T -> Void):Void
	{
		//for (activeMemberIndex in 0...activeCount) 
		//{
			//func(members[activeMemberIndex]);
		//}
		
		for (activeMemberIndex in members)
		{
			func(activeMemberIndex);
		}
	}
	
	public function forEachInactive(func:T -> Void):Void
	{
		for (inactiveMemberIndex in 0...inactiveCount) 
		{
			func(members[inactiveMemberIndex]);
		}
	}
	
	//** Getters and Setters.
	
	private function get_activeCount():Int
	{
		return members.length;
	}
	
	private function get_count():Int
	{
		return members.length + __inactiveMembers.length;
	}
	
	private function get_inactiveCount():Int
	{
		return __inactiveMembers.length;
	}
}