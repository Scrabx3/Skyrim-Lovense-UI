import gfx.events.EventDispatcher;
import gfx.managers.FocusHandler;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
import Shared.GlobalFunc;

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

	/* VARIABLES */
	public function Main()
	{
		FocusHandler.instance.setFocus(this, 0);
		EventDispatcher.initialize(this);
	}

	public function onLoad()
	{
		hotkey_left.name.text = "$SL_Help";
		hotkey_right.name.text = "$SL_Connect";
		ip_addr.setNameAndRestrict("IP:", "", "0-9.");
		port.setNameAndRestrict("PORT:", "30010", "0-9");

		hotkey_left.addEventListener("pressed", this, "onHelp");
		hotkey_right.addEventListener("pressed", this, "onConnect");

		// item_list.categories = ["Category 1", "Category 2", "Category 3", "Category 4", "Category 5", "Category 6"];
		// addItems([
		// 	{name: "Item 1", category: 1},
		// 	{name: "Item 2", category: 2},
		// 	{name: "Item 3", category: 3},
		// 	{name: "Item 4", category: 4},
		// 	{name: "Item 5", category: 5},
		// 	{name: "Item 6", category: 6},
		// 	{name: "Item 7", category: 1},
		// 	{name: "Item 8", category: 2},
		// 	{name: "Item 9", category: 3},
		// 	{name: "Item 10", category: 4},
		// 	{name: "Item 11", category: 5},
		// 	{name: "Item 12", category: 6},
		// 	{name: "Item 13", category: 1}
		// ]);
		// addItems([{name: "Item A", category: 1}]);
	}

	public function onHelp()
	{
		Lovense.Help();
	}

	public function onConnect()
	{
		Lovense.ReConnect(ip_addr.input.text, port.input.text);
		hotkey_right.disabled = true;
	}

	public function setCategories(categories:Array)
	{
		item_list.categories = categories;
	}

	public function addItems(items:Array)
	{
		item_list.items.splice(0);
		for (var i = 0; i < items.length; i++)
		{
			item_list.items.push(items[i]);
		}
		no_connection._visible = item_list.items.length == 0;
		item_list.update();

		hotkey_right.disabled = false;
	}

	// @GFx
	public function handleInput(details: InputDetails, pathToFocus: Array): Boolean
	{
		var nextClip = pathToFocus.shift();
		if (nextClip.handleInput(details, pathToFocus))
			return true;

		if (GlobalFunc.IsKeyPressed(details) && (details.navEquivalent == NavigationCode.TAB || details.navEquivalent == NavigationCode.SHIFT_TAB)) {
			skse.CloseMenu("LovenseMenu");
			return true;
		}

		return false;
	}
}