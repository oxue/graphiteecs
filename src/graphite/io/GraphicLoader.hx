package graphite.io;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.net.drm.VoucherAccessInfo;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.utils.ByteArray;

/**
 * ...
 * @author qwerber
 */

class GraphicLoader 
{
	public var req:URLRequest;
	public var loader:Loader;
	public var _callback:Void->Void;
	public var data:BitmapData;
	
	public function new() 
	{
		req = new URLRequest();
		loader = new Loader();
	}
	
	public function load(_url:String, __callback:Void->Void):Void
	{
		req.url = _url;
		_callback = __callback;
		loader.contentLoaderInfo.addEventListener(Event.COMPLETE, done);
		loader.load(req);
	}
	
	private function done(e:Event):Void 
	{
		data = (cast(loader.content, Bitmap)).bitmapData;
		_callback();
	}
	
}