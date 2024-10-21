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

	// TODO: decide what to do exactly with hotkey button stuff

	public function Main()
	{
		trace("Main ctor")
		port.name.text = "PORT:";
		ip_addr.name.text = "IP:";
	}

	public function onLoad()
	{
		hotkey_left.addEventListener("pressed", this, "onPressedLeft");
		hotkey_right.addEventListener("pressed", this, "onPressedRight");
	}

	private function onPressLeft()
	{
		trace("onPressLeft")
	}

	private function onPressRight()
	{
		trace("onPressRight")
	}
}