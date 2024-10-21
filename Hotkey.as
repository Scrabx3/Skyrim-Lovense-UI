import gfx.events.EventDispatcher;
import com.greensock.TweenLite;

class Hotkey extends MovieClip
{
	/* STAGE */
	var name:TextField;

	/* VARS */
	private var __height:Number;
	private var __width:Number;

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
		_alpha = 80;

		EventDispatcher.initialize(this);

		this.onRollOver = function()
		{
			TweenLite.to(this,0.2,{_width:__width + 2, _height:__height + 2, _alpha:100});
		};

		this.onRollOut = function()
		{
			TweenLite.to(this,0.2,{_width:__width, _height:__height, _alpha:80});
		};

		this.onPress = function()
		{
			dispatchEvent({type:"pressed"});
		};
	}
}