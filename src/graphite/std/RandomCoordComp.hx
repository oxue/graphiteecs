package graphite.std;
import flash.geom.Rectangle;
import graphite.Comp;

/**
 * ...
 * @author qwerber
 */

class RandomCoordComp extends Comp
{
	public var dimensions:Rectangle;
	public var timer:Int;
	public var t:Int;
	
	public var coordinates:CoordinateComp;

	public function new(_dimensions:Rectangle = null, _timer:Int = 40) 
	{
		dimensions = _dimensions;
		timer = _timer;
		if (dimensions == null)
		{
			dimensions = new Rectangle(0, 0, 800, 600);
		}
		super(RANDOMCOORDS);
	}
	
	override public function cache():Void 
	{
		coordinates = cast getComponentCache(COORDINATES);
	}
	
}