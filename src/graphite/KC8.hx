package graphite;
import flash.events.Event;
import flash.Lib;

/**
 * ...
 * @author qwerber
 */

class KC8 
{

	public static var subManager:SubManager;
	public static var stateManager:StateManager;
	
	public static function init(_state:State)
	{
		subManager = new SubManager();
		stateManager = new StateManager(_state);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, update);
	}
	
	static private function update(e:Event):Void 
	{
		subManager.update();
		stateManager.currentState.update();
	}
	
}