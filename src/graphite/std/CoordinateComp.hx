package graphite.std;
import graphite.Comp;

/**
 * ...
 * @author qwerber
 */

class CoordinateComp extends Comp
{
	
	public var x:Float;
	public var y:Float;

	public function new(_x:Float = 0, _y:Float = 0) 
	{
		super(COORDINATES);
		x = _x;
		y = _y;
	}
	
}