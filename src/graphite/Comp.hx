package graphite;
import flash.Vector;
import graphite.std.StdComp;

/**
 * ...
 * @author qwerber
 */
class Comp
{
	public var entity:Ent;
	public var id:StdComp;
	public var remove:Bool;
	public var dependencies:Vector<Comp>;

	public function new(_id:StdComp) 
	{	
		id = _id;
		dependencies = new Vector();
		remove = false;
	}
	
	/**
	 * retrieves a component from the same entity and let's it know that the current component depends on it
	 * @param	_id a CompType constant
	 * @return
	 */
	public inline function getComponentCache(_id:StdComp):Comp
	{	
		var component:Comp = entity.componentHash.get(_id);
		component.dependencies.push(this);
		return component;
	}
	
	/**
	 * please override this function 
	 */
	public function load():Void
	{
		
	}
	
	/**
	 * override this method and put all getComponentCache calls in here
	 */
	public function cache():Void
	{
		
	}
	
	/**
	 * override this function if you need to run some unloading logic.
	 */
	public function unload():Void
	{
		
	}
	
}