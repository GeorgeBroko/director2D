package cont;

import drc.graphics.DrcCharMap;
import drc.graphics.DrcText;
import drc.objects.DrcScene;
import drc.ui.DrcLayout;
import drc.ui.DrcToolstrip;

class UiTest extends DrcScene
{
	private var __layout:DrcLayout;
	
	private var __toolstrip:DrcToolstrip;
	
	private var __textMap:DrcCharMap;
	
	private var __text:DrcText;
	
	public function new() 
	{
		super();
		
		__layout = new DrcLayout();
		
		__toolstrip = new DrcToolstrip(__layout);
		
		__layout.addControl(__toolstrip);
		
		addGraphic(__layout.tileMap);
		
		trace(__layout.charMap.profile.constants.length);
		
		__layout.charMap.profile.constants[1].x = 1;
		__layout.charMap.profile.constants[1].y = 0.5;
		__layout.charMap.profile.constants[1].z = 0.5;
		__layout.charMap.profile.constants[1].w = 0.5;
		
		__layout.charMap.profile.constants[2].y = 0;
		
		addGraphic(__layout.charMap);
		
		__text = new DrcText(__layout.charMap, "File", 6, 2);
	}
	
	override public function update():Void 
	{
		super.update();
	}
}