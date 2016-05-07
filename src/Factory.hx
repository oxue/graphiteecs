package ;
import graphite.Ent;
import graphite.KC8;
import graphite.std.CircleComp;
import graphite.std.CoordinateComp;
import graphite.std.LerpComp;
import graphite.std.PositionComp;
import graphite.std.RandomCoordComp;
import graphite.std.StdComp;

/**
 * ...
 * @author qwerber
 */

class Factory 
{

	public static function createCircle(_x:Float = 0, _y:Float = 0, _radius:Int = 10, _color:Int = 0x00):Ent
	{
		var e:Ent = new Ent();
		var p:PositionComp = cast KC8.subManager.get(POSITION).get();
		p.x = _x;
		p.y = _y;
		e.add(p);
		var c:CircleComp = cast KC8.subManager.get(CIRCLE).get();
		c.radius = _radius;
		c.lineColor = _color;
		c.fillColor = _color;
		e.add(c);
		e.add(new CoordinateComp());
		var l:LerpComp = cast KC8.subManager.get(LERP).get();
		e.add(l);
		e.add(KC8.subManager.get(MOUSECOORDS).get());
		c.fillColor = 0xffaa00;
		c.lineColor = 0xffaa00;
		c.redraw();
		
		e.add(KC8.subManager.get(CIRCLECOLLISION).get());
		return e;
	}
	
	public function new() 
	{
		
	}
	
}