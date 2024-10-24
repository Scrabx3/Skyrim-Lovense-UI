import gfx.managers.FocusHandler;
import gfx.ui.NavigationCode;
import gfx.ui.InputDetails;
import Shared.GlobalFunc;

class InputField extends MovieClip
{
	/* STAGE */
	var name: TextField;
	var input: TextField;

	/* Variables */
	private var _previousFocus: Object;
	private var _active: Boolean = false;

	public function InputField()
	{
		input.text = "";
		
		input.onKillFocus = function(a_newFocus: Object) {
			_parent.endInput();
		};
	}

	public function setNameAndRestrict(name, restrict)
	{
		trace("setNameAndRestrict " + name + restrict);
		this.name.text = name;
		this.input.restrict = restrict;
	}

	public function onPress(a_mouseIndex, a_keyboardOrMouse)
	{
		startInput()
	}

	private function startInput() {
		if (_active)
			return;

		_previousFocus = FocusHandler.instance.getFocus(0);

		input.type = "input";
		input.noTranslate = true;
		input.selectable = true;
		
		Selection.setFocus(input);
		Selection.setSelection(0,0);
		
		_active = true;
		skse.AllowTextInput(true);
	}

	private function endInput() {
		if (!_active)
			return;

		input.type = "dynamic";
		input.noTranslate = false;
		input.selectable = false;
		input.maxChars = null;
		
		var bPrevEnabled = _previousFocus.focusEnabled;
		_previousFocus.focusEnabled = true;
		Selection.setFocus(_previousFocus,0);
		_previousFocus.focusEnabled = bPrevEnabled;

		_active = false;
		skse.AllowTextInput(false);
	}
	
	// @GFx
	public function handleInput(details: InputDetails, pathToFocus: Array): Boolean
	{
		if (GlobalFunc.IsKeyPressed(details)) {
			
			if (details.navEquivalent == NavigationCode.ENTER) {
				endInput();
				
			} else if (details.navEquivalent == NavigationCode.TAB || details.navEquivalent == NavigationCode.ESCAPE) {
				input.SetText("");
				endInput();
			}

			var nextClip = pathToFocus.shift();
			if (nextClip.handleInput(details, pathToFocus))
				return true;
		}
		
		return false;
	}

}
