package graphite.std;
import graphite.Comp;

/**
 * ...
 * @author qwerber
 */

class CircleCollisionComp extends Comp
{

	public var position:PositionComp;
	public var circle:CircleComp;
	
	public function new() 
	{
		super(CIRCLECOLLISION);
	}
	
	override public function cache():Void 
	{
		position = cast getComponentCache(POSITION);
		circle = cast getComponentCache(CIRCLE);
	}
	
}