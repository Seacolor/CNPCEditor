package models 
{
	/**
	 * ...
	 * @author Kazushi Tominaga (Seacolor)
	 */
	public class Skill 
	{
		public var id:Object;
		public var bonus:Number;
		
		public function toString():String {
			return id.value + digit(bonus);
		}
		
		protected function digit(value:Number):String {
			var _bonus:String = value.toString()
			while (_bonus.length < 4) {
				_bonus = "0" + _bonus
			}
			return _bonus
		}
		
	}

}