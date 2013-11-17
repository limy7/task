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
		public function TextAreaChangedEvent(type:String)
		{
			super(type,true);
		}
	}
}