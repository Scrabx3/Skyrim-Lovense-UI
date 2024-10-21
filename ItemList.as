class ItemList extends MovieClip
{
	/* STAGE */
	var background:MovieClip;
	var arrow_up:MovieClip;
	var arrow_down:MovieClip;
	var anchor_top:MovieClip;
	var anchor_down:MovieClip;

	/* VARS */
	var items:Array;
	var itemClips:Array;
	var minIndex:Number;
	var maxClips:Number;

	/* PROPERTIES */
	var offsetY:Number = 15;
	var offestX:Number = 10;
	var itemHeight:Number = 35;
	var itemClass:String = "ListEntry";

	public function ItemList()
	{
		items = new Array();
		itemClips = new Array();
		minIndex = 0;

		var clipRange = anchor_down._y - anchor_top._y;
		maxClips = Math.floor(clipRange / itemHeight);

		arrow_up.onPress = function()
		{
			_parent.minIndex = Math.max(0, _parent.minIndex - _parent.maxClips);
			_parent.update();
		};

		arrow_down.onPress = function()
		{
			_parent.minIndex = Math.min(_parent.items.length - _parent.maxClips, _parent.minIndex + _parent.maxClips);
			_parent.update();
		};
	}

	public function update():Void
	{
		// clear old items
		for (var i = 0; i < itemClips.length; i++)
		{
			itemClips[i].removeMovieClip();
		}
		itemClips = new Array();

		// add new items
		var idx = 0;
		for (var i = minIndex; i < items.length && idx < maxClips; i++)
		{
			var itemClip = attachMovie(itemClass, "item" + i, getNextHighestDepth());
			itemClip._x = offestX;
			itemClip._y = offsetY + anchor_top._y + idx * itemHeight;
			itemClip.name.text = items[i].name;
			itemClips.push(itemClip);
			idx++;
		}

		// update scroll
		arrow_up._visible = minIndex > 0 && items;
		arrow_down._visible = minIndex + itemClips.length < items.length;
	}
}