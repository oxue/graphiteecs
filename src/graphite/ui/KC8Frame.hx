package graphite.ui;
import flash.display.Shape;
import flash.display.Sprite;
import flash.text.TextField;

/**
 * ...
 * @author worldedit
 */

class KC8Frame extends KC8ObjectContainer
{
	private var background:Sprite;
	private var label:TextField;
	
	public function new(_label:String = "default", _width:Int = 400, _height:Int = 300) 
	{
		background = new Sprite();
		background.graphics.lineStyle(1, KC8UI.configOptions.chrome_color_3);
		background.graphics.beginFill(KC8UI.configOptions.chrome_color_2);
		background.graphics.drawRect(0, 0, _width, _height);
		this.filters = [KC8UI.glowFilter];
		addChild(background);
		
		label = new TextField();
		label.defaultTextFormat = KC8UI.textFormatLeft;
		label.text = _label;
		label.mouseEnabled = false;
		label.selectable = false;
		label.width = _width;
		label.x = 5;
		label.y = 10 - label.textHeight * 0.5;
		addChild(label);
		super();
	}
	
}