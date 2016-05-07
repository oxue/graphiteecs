package graphite.std;
import flash.Vector;
import graphite.collections.ObjectPool;
import graphite.Comp;
import graphite.Sub;

/**
 * ...
 * @author qwerber
 */

class LerpSub extends Sub
{

	private var lerps:Vector<LerpComp>;
	private var pool:ObjectPool<LerpComp>;
	
	public function new() 
	{
		super(2, LERP);
		lerps = new Vector<LerpComp>();
		pool = new ObjectPool<LerpComp>(10);
	}
	
	override public function get():Comp 
	{
		var lerp:LerpComp = pool.get();
		if (lerp == null)
		{
			lerp = new LerpComp(0.02);
		}
		lerps.push(lerp);
		return lerp;
	}
	
	override public function update():Void 
	{
		var i:Int = lerps.length;
		var l:Int = i;
		while (i-->0)
		{
			var lerp:LerpComp = lerps[i];
			if (lerp.remove == true)
			{
				lerps[i] = lerps[--l];
				pool.alloc(lerp);
				continue;
			}
			lerp.position.velX = lerp.destination.x - lerp.position.x;
			lerp.position.velY = lerp.destination.y - lerp.position.y;
		}
		lerps.length = l;
	}
	
}