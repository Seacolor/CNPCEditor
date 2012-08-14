package enum 
{
	/**
	 * ...
	 * @author Kazushi Tominaga (Seacolor)
	 */
	public class EnumBase 
	{
		private var _value:String;
		private var _label:String;
		
		public function EnumBase(label:String, value:String) 
		{
			_label = label;
			_value = value;
		}
		
		public function get value():String 
		{
			return _value;
		}
		
		public function get label():String 
		{
			return _label;
		}
		
	}

}