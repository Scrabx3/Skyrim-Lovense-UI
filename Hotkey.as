import gfx.events.EventDispatcher;
import com.greensock.TweenLite;

class Hotkey extends MovieClip
{
	/* STAGE */
	var name:TextField;

	/* VARS */
	private var __height:Number;
	private var __width:Number;
	private var _disabled:Boolean;
	private var _alphaDEFAULT:Number = 80;
	private var _alphaDISABLED:Number = 40;

	// @mixin by gfx.events.EventDispatcher
	public var dispatchEvent: Function;
	public var dispatchQueue: Function;
	public var hasEventListener: Function;
	public var addEventListener: Function;
	public var removeEventListener: Function;
	public var removeAllEventListeners: Function;
	public var cleanUpEvents: Function;

	public function Hotkey()
	{
		__height = _height;
		__width = _width;
		_disabled = false;
		_alpha = _alphaDEFAULT;

		EventDispatcher.initialize(this);
	}

	public function onRollOver() {
		if (_disabled) return;
		TweenLite.to(this,0.2,{_width:__width + 2, _height:__height + 2, _alpha:100});
	};

	public function onRollOut() {
		if (_disabled) return;
		TweenLite.to(this,0.2,{_width:__width, _height:__height, _alpha:80});
	};

	public function onPress() {
		if (_disabled) return;
		dispatchEvent({type:"pressed"});
	};

	public function set disabled(value:Boolean) {
		_disabled = value;
		onRollOut();
		TweenLite.to(this, 0.2, {_alpha: value ? _alphaDISABLED : _alphaDEFAULT});
	}
}