package graphite.ui;
import flash.display.Sprite;

/**
 * ...
 * @author worldedit
 */

class KC8Object extends Sprite
{
	
	public function new()
	{
		super();
	}
	
	public function load():Void
	{
		
	}
	
	public function unload():Void
	{
		var gparent:KC8ObjectContainer = cast(parent, KC8ObjectContainer);
		var index:Int = gparent.children.lastIndexOf(this);
		gparent.children[index] = gparent.children[gparent.children.length - 1];
		gparent.children.length--;
		parent.removeChild(this);
	}
	
}