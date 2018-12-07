package;

import cont.TestGraphics;
import cont.Test;
import cont.UiTest;
import cont.BunnyMark;
import src.drc.core.DrcView;

class Main extends DrcView
{
	public function new() 
	{
		super();
	}
	
	override public function init():Void 
	{
		super.init();
		
		addScene(new BunnyMark());
	}
}
