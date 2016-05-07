package graphite.ui;
import flash.events.MouseEvent;

/**
 * ...
 * @author worldedit
 */

class KC8Pane extends KC8Frame
{

	public function new(_label = "default", _width = 400, _height:Int = 300, _closeButton:Bool = true)
	{
		super(_label, _width, _height);
		if (_closeButton)
		{
			var closeButton:KC8Button = new KC8Button("X", 20, 20, KC8PaneUnload);
			addKC8Object(closeButton);
			closeButton.x = _width - 22;
			closeButton.y = 2;
		}
		background.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		background.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
	}
	
	private function KC8PaneUnload(b:KC8Button):Void
	{
		unload();
	}
	
	override public function unload():Void 
	{
		background.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		background.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		
		super.unload();
	}
	
	private function mouseUp(e:MouseEvent):Void 
	{
		stopDrag();
	}
	
	private function mouseDown(e:MouseEvent):Void 
	{
		startDrag(false);
	}
	
}