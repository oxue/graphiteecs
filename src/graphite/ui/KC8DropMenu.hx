package graphite.ui;
import flash.display.Shape;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.Vector;

/**
 * ...
 * @author worldedit
 */

class KC8DropMenu extends KC8ObjectContainer
{
	private var mainButton:KC8Button;
	private var menuButtonWidth:Int;
	private var seperators:Vector<Shape>;
	private var closed:Bool;
	private var orientation:String;
	
	public function new(_label:String = "default", _mainButtonWidth:Int = 100, _menuButtonsWidth:Int = 100, _orientation:String = "left") 
	{
		menuButtonWidth = _menuButtonsWidth;	
		seperators = new Vector<Shape>();
		super();
		mainButton = new KC8Button(_label, _mainButtonWidth, 20, openMenu);
		addEventListener(MouseEvent.ROLL_OUT, mouseOut);
		closed = true;
		orientation = _orientation;
		addEventListener(MouseEvent.MOUSE_UP, mouseOut);
		addKC8Object(mainButton);
	}
	
	private function mouseOut(e:MouseEvent):Void 
	{
		if (closed)
			return;
			
		closed = true;
			
		var i:Int = children.length;
		while (i-->1)
		{
			if (children[i].stage != null)
			cast(children[i], KC8Button).release(null);
			removeChild(children[i]);
		}
		i = seperators.length;
		while (i-->0)
		{
			seperators[i].visible = false;
		}
	}
	
	public function addMenuItem(_label:String = "default", _callback:KC8Button->Void = null):Void
	{
		var b:KC8Button = new KC8Button(_label, menuButtonWidth, 20, _callback);
		addKC8Object(b);
		b.y = (children.length - 1) * 20;
		if (orientation == "right")
		{
			b.x = mainButton.width - b.width;
		}
		removeChild(b);
	}
	
	override public function unload():Void 
	{
		removeEventListener(MouseEvent.ROLL_OUT, mouseOut);
		super.unload();
	}
	
	public function addSeperator():Void
	{
		var l:Shape = new Shape();
		l.graphics.lineStyle(3, GraphiteEngine.configOptions.chrome_color_1);
		l.graphics.moveTo(1.5,0);
		l.graphics.lineTo(menuButtonWidth-1.5, 0);
		l.y = children.length * 20;
		addChild(l);
		if (orientation == "right")
		{
			l.x = mainButton.width - l.width;
		}
		seperators.push(l);
		l.visible = false;
	}
	
	private function openMenu(b:KC8Button) 
	{
		parent.addChild(this);
		var i:Int = children.length;
		while (i-->1)
		{
			addChild(children[i]);
		}
		i = seperators.length;
		while (i-->0)
		{
			seperators[i].visible = true;
			addChild(seperators[i]);
		}
		closed = false;
	}
	
}