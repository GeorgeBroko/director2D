package src.drc.core;

import drc.core.DrcInput;
import drc.core.DrcScript;
import drc.debug.DrcConsole;
import drc.display.DrcProfile;
import drc.core.DrcScreen;
import drc.objects.DrcScene;
import drc.part.DrcList;
import drc.utils.DrcCommon;
import haxe.Timer;
import openfl.display.Sprite;
import openfl.display3D.Context3D;
import openfl.display3D.Context3DProfile;
import openfl.display3D.Context3DRenderMode;
import openfl.events.ErrorEvent;
import openfl.events.Event;
import openfl.display.FPS;

class DrcView extends Sprite
{
	/**
	 * The 3D context of the view.
	 */
	public var context:Context3D;
	
	/**
	 * The input class of the view.
	 */
	public var input:DrcInput;
	
	/**
	 * A list of every scene in the view.
	 */
	public var scenes:DrcList<DrcScene> = new DrcList<DrcScene>();
	
	/**
	 * The screen class of the view.
	 */
	public var screen:DrcScreen;
	
	//** Privates.
	
	/** @private */ private var __sourceScript(default, null):String = "view.json";
	
	//** Internal.
	
	/** @private */ private var __dt:Float = 0;
	
	/** @private */ private var __rate:Float = 0.0166; //0.0166666666666667
	
	/** @private */ private var __time:Float;
	
	public function new() 
	{
		//** Super...
		
		super();
		
		addChild(new FPS(10, 10, 0xFFFFFF));
		
		//** Assign view to a static variable.
		
		DrcCommon.view = this;
		
		//** Check if stage is null.
		
		if (this.stage != null)
		{
			//** Call method "__onStage".
			
			__onStage();
		}
		else
		{
			//** Add new "ADDED_TO_STAGE" event.
			
			this.stage.addEventListener(Event.ADDED_TO_STAGE, __onStage);
		}
	}
	
	private function __onStage(?event:Event):Void
	{
		//** Add new "CONTEXT3D_CREATE" event.
		
		this.stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE, __onContextCreate);
		
		//** Add new "ERROR" event.
		
		this.stage.stage3Ds[0].addEventListener(ErrorEvent.ERROR, __onError);
		
		//** Request a new context3D.
		
		this.stage.stage3Ds[0].requestContext3D(Context3DRenderMode.SOFTWARE, Context3DProfile.BASELINE);
		
		//** Add a new function to the "onExit" event of the stage.
		
		this.stage.application.onExit.add(__onExit);
	}
	
	private function __onContextCreate(event:Event):Void
	{
		//** Assign context to a public variable.
		
		context = stage.stage3Ds[0].context3D;
		
		//** Configure the backbuffer of the context.
		
		context.configureBackBuffer(640, 480, 0);
		
		//** Show drivers info.
		
		DrcConsole.showTrace(context.driverInfo);
		
		//** Call init method.
		
		init();
		
		//** Add new "ENTER_FRAME" event.
		
		addEventListener(Event.ENTER_FRAME, __onFrame);
	}
	
	private function __onError(event:ErrorEvent):Void
	{
		#if debug // ------
		
		DrcConsole.showTrace(event.text);
		
		#end // ------
	}
	
	private function __onFrame(event:Event):Void
	{
		var newTime:Float = Timer.stamp();
		
		//trace(newTime);
		
		__dt += newTime - __time;
		
		__time = newTime;
		
		var loops:Int = 0;
		
		while (__dt >= 0) 
		{
			//trace(__dt);
			
			loops ++;
			
			__dt -= __rate;
			
			//** Call update method.
			
			update();
			
			//** Call the post update method of the input.
			
			input.postUpdate();
		}
		
		//** Set the screen to be drawn.
		
		screen.setToDraw();
		
		//** Call render method.
		
		render();
		
		//** Set context to render to back buffer.
		
		context.setRenderToBackBuffer();
		
		//** Clear the screen.
		
		context.clear(1, 1, 1, 1);
		
		//** Present the screen.
		
		screen.present();
		
		//** Present the context.
		
		context.present();
	}
	
	private function __onExit(code:Int):Void
	{
		//** Call release method.
		
		release();
		
		//** Dispose of the context.
		
		context.dispose(false);
		
		#if debug // ------
		
		//** Trace the exit code.
		
		DrcConsole.showTrace("Exit the application with code: " + code + ".");
		
		#end // ------
	}
	
	public function init():Void
	{
		//** Parse the startup script of the view.
		
		var script:DrcScript = new DrcScript("scripts/" + __sourceScript);
		
		//** Create an input class.
		
		input = new DrcInput();
		
		//** Assign input to a static variable.
		
		DrcCommon.input = input;
		
		//** Call init method of input.
		
		input.init();
		
		//** Create a new screen class.
		
		screen = new DrcScreen(new DrcProfile("profiles/screen.json"));
		
		//** Assign screen to a static variable.
		
		DrcCommon.screen = screen;
		
		__time = Timer.stamp();
	}
	
	public function release():Void
	{
		
	}
	
	public function addScene(scene:DrcScene):DrcScene
	{
		//** Assign a layer to the scene.
		
		scene.layer = scenes.count - 1;
		
		//** Add the scene to the view.
		
		return scenes.add(scene);
	}
	
	public function removeScene(scene:DrcScene):Void
	{
		//** Remove the scene from the view.
		
		scenes.remove(scene);
	}
	
	public function render():Void
	{
		//** Call update method for every scene in the list.
		
		scenes.forEachActive(__renderScene);
	}
	
	private function __renderScene(scene:DrcScene):Void
	{
		scene.render();
	}
	
	public function update():Void
	{
		//** Call the update method of the input.
		
		input.update();
		
		//** Call update method for every scene in the list.
		
		scenes.forEachActive(__updateScene);
	}
	
	private function __updateScene(scene:DrcScene):Void
	{
		scene.update();
	}
}