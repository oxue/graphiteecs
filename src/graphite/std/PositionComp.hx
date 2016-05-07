package graphite.std;
import graphite.Comp;

/**
 * ...
 * @author qwerber
 */

class PositionComp extends Comp
{	
	public var x:Float;
	public var y:Float;
	public var velX:Float;
	public var velY:Float;
	public var accX:Float;
	public var accY:Float;
	public var dampX:Float;
	public var dampY:Float;
	
	public function new(_x:Float = 0, _y:Float = 0) 
	{	
		x = _x;
		y = _y;
		velX = velY = accX = accY = 0;
		dampX = dampY = 1;
		super(POSITION);
	}
	
}