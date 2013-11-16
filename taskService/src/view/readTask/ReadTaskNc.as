package view.readTask
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.net.FileReference;
	
	import spark.components.NavigatorContent;
	import spark.components.TextInput;
	
	/**
	 * 读取文件 
	 * @author limy
	 */	
	public class ReadTaskNc extends NavigatorContent
	{
		/**路径文本*/
		public var pathIT:TextInput;
		public function ReadTaskNc()
		{
			super();
		}
		
		protected function scan_clickHandler(event:MouseEvent):void
		{
			var file:File = new File();
			
			file.addEventListener(Event.SELECT,onSingleSelect);  
			file.browseForOpen("请选择一个文件");
			
		}
		
		private function onSingleSelect(event:Event):void
		{
			pathIT.text = event.target.nativePath;
		}
		
		
		//
	}
}