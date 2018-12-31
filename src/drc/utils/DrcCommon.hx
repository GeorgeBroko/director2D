package drc.utils;

import drc.core.DrcInput;
import drc.core.DrcScreen;
import src.drc.core.DrcView;

class DrcCommon 
{
	//** Publics.
	
	public static inline var CONST_FOLDER_SCRIPTS:String = "scripts/";
	
	public static var input:DrcInput;
	
	public static var screen:DrcScreen;
	
	public static var view:DrcView;
	
	//** Privates.
	
	public static function random():Float
	{
		return Math.random();
	}
}