package graphite;
import flash.sampler.NewObjectSample;
import flash.Vector;
import graphite.collections.Cons;
import graphite.collections.Cons;
import graphite.collections.Cons;
import graphite.collections.Cons;
import graphite.collections.Cons;
import graphite.collections.Cons;
import graphite.std.StdComp;

/**
 * ...
 * @author qwerber
 */

class SubManager 
{
	private var subHash:Map<StdComp,Sub>;
	private var subs:Cons<Sub>;
	
	public function new() 
	{	
		subs = null;
		subHash = new Map<StdComp, Sub>();
	}
	
	public function get(_id:StdComp):Sub
	{
		return subHash.get(_id);
	}
	
	public function addSub(_sub:Sub):Void
	{	
		subs = addsub_h(_sub, subs);
	}
	
	private function addsub_h(_sub:Sub, _lst:Cons<Sub>):Cons<Sub>
	{
		if (_lst == null) {
			subHash.set(_sub.id, _sub);
			return new Cons<Sub>(_sub, null);
		}else if (_sub.priority > _lst.first.priority) {
			subHash.set(_sub.id, _sub);
			return new Cons<Sub>(_sub, _lst);
		}else 
			return new Cons<Sub>(_lst.first, addsub_h(_sub, _lst.rest));
	}
	
	public function update():Void
	{	
		update_h(subs);
	}
	
	public function update_h(_lst:Cons<Sub>):Cons<Sub>
	{
		if (_lst == null)
			return null;
		else if (_lst.first.remove == true)
		{
			subHash.set(_lst.first.id, null);
			_lst.first.wipe();
			return _lst.rest;
		}else
		{
			_lst.first.update();
			return new Cons<Sub>(_lst.first, update_h(_lst.rest));
		}
	}
	
}