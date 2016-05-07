package graphite.std;
import flash.display.Shape;
import flash.Lib;
import graphite.std.PositionComp;

/**
 * ...
 * @author qwerber
 */

class CircleComp extends Comp
{
	public var radius:Int;
	public var lineColor:Int;
	public var fillColor:Int;
	
	public var position:PositionComp;
	public var shape:Shape;
	
	public function new(_radius:Int, _lineColor:Int, _fillColor:Int) 
	{
		radius = _radius;
		lineColor = _lineColor;
		fillColor = _fillColor;
		super(CIRCLE);
	}
	
	override public function cache():Void 
	{
		position = cast getComponentCache(POSITION);
	}
	
	public function redraw():Void
	{
		shape.graphics.lineStyle(1, lineColor);
		shape.graphics.beginFill(fillColor);
		shape.graphics.drawCircle(0, 0, radius);
	}
	
	override public function load():Void 
	{
		shape = new Shape();
		redraw();
		Lib.current.stage.addChild(shape);
	}
	
	override public function unload():Void 
	{
		Lib.current.stage.removeChild(shape);
	}

}