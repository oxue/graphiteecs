package graphite.std;
import flash.Vector;
import graphite.collections.ObjectPool;
import graphite.Comp;
import graphite.Sub;

/**
 * ...
 * @author qwerber
 */

class CircleSub extends Sub
{

	private var circles:Vector<CircleComp>;
	private var pool:ObjectPool<CircleComp>;
	
	public function new() 
	{
		super(10, CIRCLE);
		circles = new Vector<CircleComp>();
		pool = new ObjectPool<CircleComp>(10);
	}
	
	override public function get():Comp 
	{
		var circle:CircleComp = pool.get();
		if (circle == null)
		{
			circle = new CircleComp(10, 0, 0);
		}
		circles.push(circle);
		return circle;
	}
	
	override public function update():Void 
	{
		var i:Int = circles.length;
		var l:Int = i;
		while (i-->0)
		{
			var circle:CircleComp = circles[i];
			if (circle.remove == true)
			{
				circles[i] = circles[--l];
				pool.alloc(circle);
				continue;
			}
			circle.shape.x = circle.position.x;
			circle.shape.y = circle.position.y;
		}
		circles.length = l;
	}
	
}