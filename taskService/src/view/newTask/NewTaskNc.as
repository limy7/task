package view.newTask
{
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mx.collections.ArrayList;
	import mx.events.FlexEvent;
	
	import spark.components.List;
	import spark.components.NavigatorContent;
	
	import utils.XMLUtil;
	import view.TaskItemRenderer;

	/**
	 * 新建任务界面
	 * @author limy
	 */	
	public class NewTaskNc extends NavigatorContent
	{
		public var taskList:List;
		[Bindable]
		public var newTaskAl:ArrayList = new ArrayList();;
		public var readOnlyArr:Array;
		[Event(name="toolTipShow", type="mx.events.ToolTipEvent")]

		public function NewTaskNc()
		{
			super();
			
		}
		
		protected function creationCompleteHandler(event:FlexEvent):void
		{
			init();
			
		}
		
		private function init():void
		{
			newTaskAl.removeAll();			
			readOnlyArr = [];			
		}
		
	
		
		/**
		 * 添加一个任务项 
		 * @param event
		 */	
		protected function addBtn_clickHandler(event:MouseEvent):void
		{			
			newTaskAl.addItem({name : ""});	
		}
		
		/**
		 * 删除一个任务项 
		 * @param event
		 */		
		protected function removeTaskItem(event:MouseEvent):void
		{
			newTaskAl.removeItem(taskList.selectedItem);
			
		}
		
		/**
		 * 保存该文件 
		 * @param event
		 */		
		protected function saveBtn_clickHandler(event:MouseEvent):void
		{
			for(var i:int=0; i<taskList.dataProvider.length; i++)
			{
				var item:TaskItemRenderer = taskList.dataGroup.getChildAt(i) as TaskItemRenderer;
				readOnlyArr[i] = item.taskNameText.text;
			}
			var str:String = XMLUtil.toXML(readOnlyArr);
			
			
			var file:File = new File(File.applicationDirectory.nativePath);
			file = file.resolvePath("task.xml");
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);		
			
					
			stream.writeUTFBytes(str);			
			stream.close();
		}
		
	
		
		//
	}
}