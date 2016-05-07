package ;
import flash.display.Bitmap;
import flash.Lib;
import graphite.Ent;
import graphite.KC8;
import graphite.io.GraphicLoader;
import graphite.State;
import graphite.std.CircleCollisionSub;
import graphite.std.CircleComp;
import graphite.std.CircleSub;
import graphite.std.CoordinateComp;
import graphite.std.LerpSub;
import graphite.std.MouseCoordSub;
import graphite.std.PositionSub;
import graphite.std.RandomCoordSub;

/**
 * ...
 * @author qwerber
 */

class GameState extends State
{
	
	public function new() 
	{
		super();
	}
	
	private var l:GraphicLoader;
	
	override public function load():Void 
	{
		trace("hello Graphite!");
		
		KC8.subManager.addSub(new PositionSub());
		KC8.subManager.addSub(new CircleSub());
		KC8.subManager.addSub(new LerpSub());
		KC8.subManager.addSub(new MouseCoordSub());
		KC8.subManager.addSub(new CircleCollisionSub());
		KC8.subManager.addSub(new RandomCoordSub());
		
		Factory.createCircle(0, 0, 100, 0xff00ff);
		
		l = new GraphicLoader();
		l.load("graphite_logo.png", done);
	}
	
	private function done()
	{
		Lib.current.addChild(new Bitmap(l.data));
	}
	
}