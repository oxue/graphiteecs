package graphite.ui;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.Vector;

/**
 * ...
 * @author worldedit
 */

class KC8ObjectContainer extends KC8Object
{
	public var children:Vector<KC8Object>;
	
	public function new() 
	{
		children = new Vector<KC8Object>();
		super();
	}
	
	public override function load():Void
	{
		
	}
	
	public function addKC8Object(_o:KC8Object, _x:Int = 0, _y = 0):KC8Object
	{
		addChild(cast(_o, DisplayObject));
		children.push(_o);
		_o.load();
		_o.x = _x;
		_o.y = _y;
		return _o;
	}
	
	public override function unload():Void
	{
		for (c in children)
		{
			c.unload();
		}
		super.unload();
	}
	
}