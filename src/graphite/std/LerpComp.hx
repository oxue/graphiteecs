package graphite.std;
import graphite.Comp;

/**
 * ...
 * @author qwerber
 */

class LerpComp extends Comp
{
	
	public var factor:Float;
	public var position:PositionComp;
	public var destination:CoordinateComp;
	
	public function new(_factor:Float = 0.25) 
	{
		super(LERP);
		factor = _factor;
	}
	
	override public function cache():Void 
	{
		destination = cast getComponentCache(COORDINATES);
		position = cast getComponentCache(POSITION);
	}
	
	override public function load():Void 
	{
		position.dampX = factor;
		position.dampY = factor;
	}
	
}