package drc.core;

import drc.display.DrcProfile;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import sys.io.File;
import sys.FileSystem;

class DrcMacros 
{
	public static macro function importRawData():Array<Field>
	{
		var fields:Array<Field> = Context.getBuildFields();
		
		var field = {
				
			  name: "Hello!",
			  
			  doc: null,
			  
			  meta: [],
			  
			  access: [AStatic, APublic],
			  
			  kind: FieldType.FVar(macro:String, null),
			  
			  pos: Context.currentPos()
			  
			};
			
			fields.push(field);
		
		return fields;
	}
	
	 public static macro function build(names : Array<String>) : Array<Field> {
    // The context is the class this build macro is called on
    var fields = Context.getBuildFields();
    // A map is an array of `key => value` expressions
    var map : Array<Expr> = [];
    // We add a `key => value` expression for every name
    for (name in names) {
      // Expression reification generates expression from argument
      map.push(macro $v{name} => $v{haxe.crypto.Sha256.encode(name)});
    }
    // We push the map into the context build fields
    fields.push({
      // The line position that will be referenced on error
      pos: Context.currentPos(),
      // Field name
      name: "namesHashed",
      // Attached metadata (we are not adding any)
      meta: null,
      // Field type is Map<String, String>, `map` is the map
      kind: FieldType.FVar(macro : Map<String, String>, macro $a{map}),
      // Documentation (we are not adding any)
      doc: null,
      // Field visibility
      access: [Access.APublic, Access.AStatic]
    });
    // Return the context build fields to build the type
    return fields;
	 }
}