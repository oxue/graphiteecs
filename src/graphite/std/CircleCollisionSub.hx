package graphite.std;
import flash.geom.Point;
import flash.Vector;
import graphite.collections.ObjectPool;
import graphite.Comp;
import graphite.Sub;

/**
 * ...
 * @author qwerber
 */

class CircleCollisionSub extends Sub
{

	private var circleCollisions:Vector<CircleCollisionComp>;
	private var pool:ObjectPool<CircleCollisionComp>;
	
	public function new() 
	{
		circleCollisions = new Vector<CircleCollisionComp>();
		pool = new ObjectPool<CircleCollisionComp>(10);
		super(6, CIRCLECOLLISION);
	}
	
	override public function get():Comp 
	{
		var circleCollision:CircleCollisionComp = pool.get();
		if (circleCollision == null)
		{
			circleCollision = new CircleCollisionComp();
		}
		circleCollisions.push(circleCollision);
		return circleCollision;
	}
	
	public function resolve():Void
	{
		var i:Int = circleCollisions.length;
		var l:Int = i;
		while (i-->0)
		{
			var circleCollision:CircleCollisionComp = circleCollisions[i];
			if (circleCollision.remove == true)
			{
				circleCollisions[i] = circleCollisions[--l];
				pool.alloc(circleCollision);
				continue;
			}
			var k:Int = circleCollisions.length;
			while (k-->0)
			{
				var circleCollision2:CircleCollisionComp = circleCollisions[k];
				if (circleCollision != circleCollision2)
				{
					var dx:Float = circleCollision.position.x - circleCollision2.position.x;
					var dy:Float = circleCollision.position.y - circleCollision2.position.y;
					var r:Float = (circleCollision.circle.radius + circleCollision2.circle.radius);
					if (dx * dx + dy * dy < r * r)
					{
						var p:Point = new Point(dx, dy);
						p.normalize(r - p.length);
						circleCollision.position.x += p.x * 0.5;
						circleCollision.position.y += p.y * 0.5;
						circleCollision2.position.x -= p.x * 0.5;
						circleCollision2.position.y -= p.y * 0.5;
					}
				}
			}
		}
		circleCollisions.length = l;
	}
	
	override public function update():Void 
	{
		var i:Int = 1;
		while (i-->0)
		{
			resolve();
		}
	}
	
}