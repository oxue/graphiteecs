package graphite;

/**
 * ...
 * @author qwerber
 */

class State 
{
	private var targetState:State;
	
	public function new() 
	{
		
	}
	
	public function load():Void
	{
		
	}
	
	public function update():Void
	
	{
		
	}
	
	public function unload():Void
	{
		
	}
	
	/**
	 * this function is called by the state management when a request for state vhange is submitted. This may or may not be approved. Call
	 * setState to finally approve and switch over after cleaning up/transition is complete.
	 * @param	_state
	 */
	public function requestChange(_state:State):Void
	{	
		targetState = _state;
	}
}