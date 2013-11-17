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
		 * 转为XML 
		 * @param value 文件值列表
		 * @return  
		 */		
		public static function toXML(value:Array):String
		{
			var xml:XML = new XML();
			xml=<config></config>;
			xml.appendChild(<map title={"总任务"}/>);
			
			for each(var item:Object in value)
			{
				xml.map.appendChild(<item name={item} />)
			}
			
			var str:String = HEAD+"\r\n"+ xml.toXMLString();
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
				obj.title = map.@title;
				obj.data = [];
			
				for each(var item:XML in map.*)
				{
					obj.data.push({name : item.@name});
				}
				
				arr.push(obj);
			}
			
			return arr;
		}
		
		//
	}
}