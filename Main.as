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
		hotkey_left.onPress = onPressedLeft;
		hotkey_right.onPress = onPressedRight;

		// addItems([
		// 	{name: "Item 1", value: 1},
		// 	{name: "Item 2", value: 2},
		// 	{name: "Item 3", value: 3},
		// 	{name: "Item 4", value: 4},
		// 	{name: "Item 5", value: 5},
		// 	{name: "Item 6", value: 6}
		// ]);
	}

	public function addItems(items:Array)
	{
		for (var i = 0; i < items.length; i++)
		{
			item_list.items.push(items[i]);
		}
		no_connection._visible = item_list.items.length == 0;
		item_list.update();
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