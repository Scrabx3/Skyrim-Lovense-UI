import gfx.events.EventDispatcher;

class Main extends MovieClip
{
	/* STAGE */
	var background:MovieClip;
	var no_connection:TextField;
	var hotkey_left:MovieClip;
	var hotkey_right:MovieClip;
	var ip_addr:MovieClip;
	var port:MovieClip;
	var item_list:ItemList;

	// @mixin by gfx.events.EventDispatcher
	public var dispatchEvent: Function;
	public var dispatchQueue: Function;
	public var hasEventListener: Function;
	public var addEventListener: Function;
	public var removeEventListener: Function;
	public var removeAllEventListeners: Function;
	public var cleanUpEvents: Function;

	// TODO: decide what to do exactly with hotkey button stuff

	public function Main()
	{
		port.name.text = "PORT:";
		ip_addr.name.text = "IP:";
		
		EventDispatcher.initialize(this);
	}

	public function onLoad()
	{
		hotkey_left.addEventListener("pressed", this, "onPressedLeft");
		hotkey_right.addEventListener("pressed", this, "onPressedRight");
	}

	private function onPressedLeft(event)
	{
		trace("onPressLeft");
	}

	private function onPressedRight(event)
	{
		trace("onPressRight");
	}
}