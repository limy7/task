package utils
{
	/**
	 * 文件与xml的互转 
	 * @author limy 
	 */	
	public class XMLUtil
	{
		public static const HEAD:String = '<?xml version="1.0" encoding="utf-8" ?>';

		
		/**
		 * 转为XML 格式
		 * @param value 文件值列表
		 * @param isNew 是否为新的文件 
		 * @titleID 0：总任务 1：提交策划  2：提交测试 3：测试完成
		 * @return  
		 */		
		public static function toXMLString(value:Array,isNew:Boolean=true,titleID:int=0):String
		{
			var xml:XML;
		
			isNew ? xml = <config></config> : xml = <map></map>;
			
			var title:String = "";
			switch(titleID)
			{
				case 0: title = "总任务"; break;
				case 1: title = "提交策划"; break;
				case 2: title = "提交测试"; break;
				case 3: title = "测试完成"; break;
			}
			
			isNew ? xml.appendChild(<map title={title}/>) : xml.@title = title;
	
			for each(var item:Object in value)
			{
				if(isNew)
				{
					xml.map.appendChild(<item name={item.name} />);
				}else{
					xml.appendChild(<item name={item.name} />);
				}
				
			}
			
			var str:String = "";
			if(isNew)
			{
				str = HEAD+"\r\n"+ xml.toXMLString();
			}else{
				str = xml.toXMLString();
			}
			
			var pattern:RegExp = /\n/g;			
			str = str.replace(pattern, "\r\n");	
			
			return str;
		}
		
		/**
		 * 解析xml 
		 * @param value
		 * @return 
		 */		
		public static function analysis(xml:XML):Array
		{
			var arr:Array = [];
			
			for each(var map:XML in xml.*)
			{
				var obj:Object = {};
				obj.title = map.@title.toXMLString();
				obj.data = [];
			
				for each(var item:XML in map.*)
				{
					obj.data.push({name : (item.@name).toXMLString()});
				}
				
				arr.push(obj);
			}
			
			return arr;
		}
		
		//
	}
}