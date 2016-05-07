package ;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.Lib;
import flash.Vector;
import graphite.collections.Cons;
import graphite.Comp;
import graphite.KC8;
import graphite.std.PositionComp;
import graphite.Sub;
import graphite.ui.KC8Button;
import graphite.ui.KC8Pane;
import graphite.ui.KC8UI;

/**
 * ...
 * @author qwerber
 */

class Main 
{
	
	private static var debugPanel:KC8Pane;
	
	static function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// entry point
		KC8UI.init(done);
	}
	
	static private function done() 
	{
		KC8.init(new GameState());
		debugPanel = new KC8Pane("debug controls");
		debugPanel.addKC8Object(new KC8Button("reload", 100, 20, reload), 10, 3);
		
	}
	
	static private function reload(_b:KC8Button) 
	{
		KC8.init(new GameState());
	}
	
}