package view.newTask
{
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	
	import mx.collections.ArrayList;
	
	import spark.components.List;
	import spark.components.NavigatorContent;

	/**
	 * 新建任务界面
	 * @author limy
	 */	
	public class NewTaskNc extends NavigatorContent
	{
		[Bindable]
		public var newTaskAl:ArrayList = new ArrayList();
		public var taskList:List;
		public function NewTaskNc()
		{
			super();
		}
		
		/**
		 * 添加一个任务项 
		 * @param event
		 */	
		protected function addBtn_clickHandler(event:MouseEvent):void
		{			
			newTaskAl.addItem({});			
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
			// TODO Auto-generated method stub
			
		}
		
		//
	}
}