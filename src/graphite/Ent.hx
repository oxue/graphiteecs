package graphite;
import graphite.std.StdComp;

/**
 * ...
 * @author qwerber
 */

class Ent
{
	public var componentHash:Map<StdComp,Comp>;

	public function new() 
	{	
		componentHash = new Map<StdComp,Comp>();
	}
	
	/**
	 * adds a component to the Entity and and sets up cache via cache calls, then loads
	 * @param	_component
	 * @return
	 */
	public inline function add(_component:Comp):Comp
	{	
		componentHash.set(_component.id, _component);
		_component.entity = this;
		_component.cache();
		_component.load();
		return _component;
	}
	
	/**
	 * swaps out with a new component at run time and reconnects dependencies (now that I think of it this function is kinda pointless
	 * @param	_component
	 */
	public inline function swap(_component:Comp):Void
	{	
		var oldComponent:Comp = componentHash.get(_component.id);
		componentHash.set(_component.id, _component);
		var i:Int = oldComponent.dependencies.length;
		while (i-->0)
		{	
			oldComponent.dependencies[i].cache();
		}
		oldComponent.remove = true;
		oldComponent.unload();
	}
	
	/**
	 * sets up all components within this entity for removal, useful for removing and entire game object
	 */
	public inline function remove():Void
	{	
		for (component in componentHash)
		{	
			component.remove = true;
		}
	}
	
}