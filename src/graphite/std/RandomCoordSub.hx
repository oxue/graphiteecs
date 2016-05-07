package graphite.std;

import flash.Vector;
import graphite.collections.ObjectPool;
import graphite.Sub;
import graphite.Comp;

/**
 * ...
 * @author qwerber
 */

class RandomCoordSub extends Sub
{
	
	private var randomCoords:Vector<RandomCoordComp>;
	private var pool:ObjectPool<RandomCoordComp>;

	public function new() 
	{
		super(1, RANDOMCOORDS);
		randomCoords = new Vector<RandomCoordComp>();
		pool = new ObjectPool<RandomCoordComp>(10);
	}
	
	override public function get():Comp 
	{
		var randomCoord:RandomCoordComp = pool.get();
		if (randomCoord == null)
		{
			randomCoord = new RandomCoordComp();
		}
		randomCoords.push(randomCoord);
		return randomCoord;
	}
	
	override public function update():Void 
	{
		var i:Int = randomCoords.length;
		var l:Int = i;
		while (i-->0)
		{
			var randomCoord:RandomCoordComp = randomCoords[i];
			if (randomCoord.remove == true)
			{
				randomCoords[i] = randomCoords[--l];
				pool.alloc(randomCoord);
				continue;
			}
			randomCoord.t ++;
			if (randomCoord.t >= randomCoord.timer)
			{
				randomCoord.t = 0;
				randomCoord.coordinates.x = randomCoord.dimensions.x + Math.random() * randomCoord.dimensions.width;
				randomCoord.coordinates.y = randomCoord.dimensions.y + Math.random() * randomCoord.dimensions.height;
			}
		}
		randomCoords.length = l;
	}
	
}