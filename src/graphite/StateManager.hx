package graphite;
import graphite.State;

/**
 * ...
 * @author qwerber
 */

class StateManager 
{

	public var currentState:State;
	
	/**
	 * supply an initial state
	 * @param	_initialState
	 */
	public function new(_initialState:State) 
	{	
		currentState = _initialState;
		currentState.load();
	}
	
	/**
	 * request that the current state change over, may not approve. 
	 * @param	_state
	 */
	public function requestStateChange(_state:State):Void
	{	
		currentState.requestChange(_state);
	}
	
	/**
	 * calling this without calling requestStateChange instead my force the state to change and may have unexpected results. Only use this if 
	 * you know what you are doing!
	 * @param	_state
	 */
	public function setState(_state:State):Void
	{	
		currentState.unload();
		currentState = _state;
		currentState.load();
	}
	
}