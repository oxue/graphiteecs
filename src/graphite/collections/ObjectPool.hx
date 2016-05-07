package graphite.collections;
import flash.Vector;

/**
 * ...
 * @author qwerber
 */

class ObjectPool<T>
{

	public var size:Int;
	public var pool:Vector<T>;
	public var incremental:Int;
	
	/**
	 * creates an object pool
	 * @param	_initialSize initial bound of the pool
	 * @param	_incremental the length increase each time the pool fills
	 */
	public function new(_initialSize:Int, _incremental:Int = 10) 
	{	pool = new Vector<T>(_initialSize);
		incremental = _incremental;
	}
	
	/**
	 * gives a instance of the object is available, else null and must have the caller resolve
	 * @return
	 */
	public function get():T
	{	if (size == 0)
		return null;
		else
		return pool[--size];
	}
	
	/**
	 * returns/puts an object into the pool 
	 * @param	_o
	 */
	public function alloc(_o:T):Void
	{	pool[size++];
		if (size == pool.length)
		pool.length += incremental;
	}
	
}