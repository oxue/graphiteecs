package graphite;
import flash.Vector;
import graphite.collections.ObjectPool;
import graphite.std.StdComp;
/**
 * ...
 * @author qwerber
 */

class Sub
{
	public var priority:Int;
	public var remove:Bool;
	public var id:StdComp;
	
	/**
	 * higher priority = lower value
	 * @param	_priority higher priority = lower value, does not have to be dense
	 * @param	_id 
	 */
	public function new(_priority:Int, _id:StdComp) 
	{	
		_priority = priority;
		remove = false;
		id = _id;
	}
	
	/**
	 * create an instance of the relevant component
	 * must override this function as it is critical, recommended to call add in here as well
	 * @return
	 */
	public function get():Comp
	{	
		return null;
	}
	
	/**
	 * please override this function to add logic, including component removal policies
	 */
	public function update():Void

	{
	}
	
	/**
	 * removes all components and clears the sub
	 */
	public function wipe():Void
	{	

	}
	
}