package graphite.std;

import flash.Vector;
import graphite.collections.ObjectPool;
import graphite.Sub;
import graphite.Comp;

/**
 * ...
 * @author qwerber
 */

class PositionSub extends Sub
{
	
	private var positions:Vector<PositionComp>;
	private var pool:ObjectPool<PositionComp>;

	public function new() 
	{
		super(3, POSITION);
		positions = new Vector<PositionComp>();
		pool = new ObjectPool<PositionComp>(10);
	}
	
	override public function get():Comp 
	{
		var position:PositionComp = pool.get();
		if (position == null)
		{
			position = new PositionComp();
		}
		positions.push(position);
		return position;
	}
	
	override public function update():Void 
	{
		var i:Int = positions.length;
		var l:Int = i;
		while (i-->0)
		{
			var position:PositionComp = positions[i];
			if (position.remove == true)
			{
				positions[i] = positions[--l];
				pool.alloc(position);
				continue;
			}
			position.velX += position.accX;
			position.velY += position.accY;
			position.velX *= position.dampX;
			position.velY *= position.dampY;
			position.x += position.velX;
			position.y += position.velY;
		}
		positions.length = l;
	}
	
}