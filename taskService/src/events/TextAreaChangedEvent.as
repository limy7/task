package events
{
	import flash.events.Event;
	/**
	 * 文本发生变化 
	 * @author limy
	 */	
	public class TextAreaChangedEvent extends Event
	{
		public static const TEXT_CHANGED:String = "events.TextAreaChangedEvent";
		public var index:int;
		public var curText:String;
		public function TextAreaChangedEvent(type:String, index:int, curText:String)
		{
			super(type,true);
			this.index = index;
			this.curText = curText;
		}
	}
}