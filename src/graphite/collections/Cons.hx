package graphite.collections;
import haxe.macro.Type;

/**
 * ...
 * @author qwerber
 */
class Cons<T>
{
	public var first:T;
	public var rest:Cons<T>;
	
	public static inline function list(_values:Array<Dynamic>):Cons<Dynamic>
	{
		var ret:Cons<Dynamic> = new Cons<Dynamic>(_values[_values.length - 1], null);
		var i:Int = _values.length - 1;
		while (i-->0)
		{
			var c:Cons<Dynamic> = new Cons<Dynamic>(_values[i], ret);
			ret = c;
		}
		return ret;
	}

	public function new(_first:T, _rest:Cons<T>) 
	{
		first = _first;
		rest = _rest;
	}
	
	public inline function second():T
	{
		return rest.first;
	}
	
	public inline function third():T
	{
		return rest.second();
	}
	
	public inline function fourth():T
	{
		return rest.third();
	}
	
	public inline function fifth():T
	{
		return rest.fourth();
	}
	
	public inline function sixth():T
	{
		return rest.fifth();
	}
	
	public inline function seventh():T
	{
		return rest.sixth();
	}
	
	public inline function eight():T
	{
		return rest.seventh();
	}
}