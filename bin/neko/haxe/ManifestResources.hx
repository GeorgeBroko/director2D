package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Dynamic):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "rootPath")) {
			
			rootPath = Reflect.field (config, "rootPath");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_nokiafc22_ttf);
		
		#end
		
		var data, manifest, library;
		
		#if kha
		
		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);
		
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");
		
		#else
		
		Assets.libraryPaths["default"] = rootPath + "manifest/default.json";
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
		#end
		
	}
	
	
}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__armatures_specs_json extends null { }
@:keep @:bind #if display private #end class __ASSET__armatures_test_ske_json extends null { }
@:keep @:bind #if display private #end class __ASSET__armatures_test_tex_json extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_charcodes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__fonts_nokiafc22_json extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_opensans_fnt extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_opensans_json extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_opensans_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__profiles_debug_json extends null { }
@:keep @:bind #if display private #end class __ASSET__profiles_default_json extends null { }
@:keep @:bind #if display private #end class __ASSET__profiles_screen_json extends null { }
@:keep @:bind #if display private #end class __ASSET__profiles_ui_json extends null { }
@:keep @:bind #if display private #end class __ASSET__scripts_gamepad_json extends null { }
@:keep @:bind #if display private #end class __ASSET__scripts_input_json extends null { }
@:keep @:bind #if display private #end class __ASSET__scripts_view_json extends null { }
@:keep @:bind #if display private #end class __ASSET__music_cutthefat_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__shaders_default_frag extends null { }
@:keep @:bind #if display private #end class __ASSET__shaders_default_vert extends null { }
@:keep @:bind #if display private #end class __ASSET__shaders_screen_frag extends null { }
@:keep @:bind #if display private #end class __ASSET__shaders_screen_vert extends null { }
@:keep @:bind #if display private #end class __ASSET__shaders_ui_frag extends null { }
@:keep @:bind #if display private #end class __ASSET__shaders_ui_vert extends null { }
@:keep @:bind #if display private #end class __ASSET__textures_bunny_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_cats_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_debug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_dragonboy_texture_1_json extends null { }
@:keep @:bind #if display private #end class __ASSET__textures_dragonboy_texture_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_grid_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_icons_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_particle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_particle2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_rect_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_sprites_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_sprites2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures_ui_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__textures__textures_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)


@:keep #if display private #end class __ASSET__fonts_nokiafc22_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "fonts/nokiafc22.ttf"; name = "Nokia Cellphone FC Small"; super (); }}


#else

@:keep @:expose('__ASSET__fonts_nokiafc22_ttf') #if display private #end class __ASSET__fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "fonts/nokiafc22.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Nokia Cellphone FC Small"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__fonts_nokiafc22_ttf') #if display private #end class __ASSET__OPENFL__fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { name = "Nokia Cellphone FC Small"; super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__fonts_nokiafc22_ttf') #if display private #end class __ASSET__OPENFL__fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "fonts/nokiafc22.ttf"; name = "Nokia Cellphone FC Small"; super (); }}

#end

#end
#end

#end