package graphite.std;
import graphite.Comp;

/**
 * ...
 * @author qwerber
 */

class MouseCoordComp extends Comp
{
	public var coordinates:CoordinateComp;

	public function new() 
	{
		super(MOUSECOORDS);
	}
	
	override public function cache():Void 
	{
		coordinates = cast getComponentCache(COORDINATES);
	}
	
}