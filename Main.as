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

		// item_list.categories = ["Category 1", "Category 2", "Category 3", "Category 4", "Category 5", "Category 6"];
		// addItems([
		// 	{name: "Item 1", category: 1},
		// 	{name: "Item 2", category: 2},
		// 	{name: "Item 3", category: 3},
		// 	{name: "Item 4", category: 4},
		// 	{name: "Item 5", category: 5},
		// 	{name: "Item 6", category: 6}
		// ]);
	}

	public function setCategories(categories:Array)
	{
		item_list.categories = categories;
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