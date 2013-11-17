package view.readTask
{
	import events.TextAreaChangedEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.net.FileReference;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.collections.ArrayList;
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.List;
	import spark.components.NavigatorContent;
	import spark.components.TextInput;
	
	import utils.XMLUtil;
	
	/**
	 * 读取文件 
	 * @author limy
	 */	
	public class ReadTaskNc extends NavigatorContent
	{
		[Bindable]
		public var readTaskAl:ArrayList;
		/**任务列表*/
		public var readTaskList:List = new List();		
		/**路径文本*/
		public var pathIT:TextInput;
		/**类别文本*/
		public var titleText:Label;
		/**保存按钮*/
		public var saveBtn:Button = new Button();
		
		private var _xml:XML;
		private var _taskArr:Array;
		private var _curIndex:int;//当前类别索引
		private var _isChanged:Boolean; //列表数据是否有变
		
		public function ReadTaskNc()
		{
			super();
		}
		
		protected function creationCompleteHandler(event:FlexEvent):void
		{
			//此处监听
			readTaskList.addEventListener(TextAreaChangedEvent.TEXT_CHANGED, listChanged);
			readTaskList.addEventListener("testE", test);
			init();
		}
		
		private function test(event:Event):void
		{
			trace(event.target);
		}
		
		/**列表有变*/
		private function listChanged(event:TextAreaChangedEvent):void
		{
			_isChanged = true;
			saveBtn.label = "保存*"
		}
		
		private function init():void
		{
			_curIndex = 0;
			_taskArr = [];
			_isChanged = false;
			readTaskAl = new ArrayList();
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
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, loadCompleteHandler);
			urlLoader.load(new URLRequest(event.target.nativePath));		
		}
		
		/**
		 * 加载xml完成 
		 * @param event
		 */		
		private function loadCompleteHandler(event:Event):void
		{
			_xml = new XML(event.target.data);
			_taskArr = XMLUtil.analysis(_xml);			
			_curIndex = 0;
			setViewData(_curIndex);
		}
		
		/**
		 * 填充数据 
		 */		
		private function setViewData(index:int):void
		{
			var curObj:Object = _taskArr[index];
			titleText.text = curObj.title;
			readTaskAl = new ArrayList(curObj.data);
		}
		
		/**
		 * 下一个类别 
		 * @param event
		 */		
		protected function nextBtn_clickHandler(event:MouseEvent):void
		{
			if(_isChanged)
			{
				Alert.show("请保存当前文件后进行下一步");
				return;
			}
			_curIndex ++;
		}
		
		/**
		 * 保存 
		 * @param event
		 */		
		protected function saveBtn_clickHandler(event:MouseEvent):void
		{
			_isChanged = false;
			saveBtn.label = "保存";
		}
		
		
		//
	}
}