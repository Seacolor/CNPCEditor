package enum 
{
	/**
	 * ...
	 * @author Kazushi Tominaga (Seacolor)
	 */
	public final class AttributeBonus extends EnumBase
	{
		public static const NONE:AttributeBonus = new AttributeBonus("皆無(0)", "0");
		public static const BEST_15:AttributeBonus = new AttributeBonus("最高(15)", "15");
		public static const BEST_14:AttributeBonus = new AttributeBonus("最高(14)", "14");
		public static const GREAT_13:AttributeBonus = new AttributeBonus("理想的(13)", "13");
		public static const GREAT_12:AttributeBonus = new AttributeBonus("理想的(12)", "12");
		public static const GOOD_11:AttributeBonus = new AttributeBonus("高い(11)", "11");
		public static const GOOD_10:AttributeBonus = new AttributeBonus("高い(10)", "10");
		public static const NOT_BAD_9:AttributeBonus = new AttributeBonus("やや高い(9)", "9");
		public static const NOT_BAD_8:AttributeBonus = new AttributeBonus("やや高い(8)", "8");
		public static const NORMAL_7:AttributeBonus = new AttributeBonus("普通(7)", "7");
		public static const NORMAL_6:AttributeBonus = new AttributeBonus("普通(6)", "6");
		public static const LITTLE_5:AttributeBonus = new AttributeBonus("少し(5)", "5");
		public static const LITTLE_4:AttributeBonus = new AttributeBonus("少し(4)", "4");
		public static const SLIGHT_3:AttributeBonus = new AttributeBonus("微々(3)", "3");
		public static const SLIGHT_2:AttributeBonus = new AttributeBonus("微々(2)", "2");
		public static const SLIGHT_1:AttributeBonus = new AttributeBonus("微々(1)", "1");
		
		/**
		 * @private
		 */
		public function AttributeBonus(label:String, value:String) 
		{
			super(label, value);
		}
		
		/**
		 * 列挙を配列に変換し、返します。
		 * @return	列挙を要素とする配列
		 */
		public static function toArray():Array
		{
			return [
				AttributeBonus.NONE,
				AttributeBonus.SLIGHT_1,
				AttributeBonus.SLIGHT_2,
				AttributeBonus.SLIGHT_3,
				AttributeBonus.LITTLE_4,
				AttributeBonus.LITTLE_5,
				AttributeBonus.NORMAL_6,
				AttributeBonus.NORMAL_7,
				AttributeBonus.NOT_BAD_8,
				AttributeBonus.NOT_BAD_9,
				AttributeBonus.GOOD_10,
				AttributeBonus.GOOD_11,
				AttributeBonus.GREAT_12,
				AttributeBonus.GREAT_13,
				AttributeBonus.BEST_14,
				AttributeBonus.BEST_15,
			];
		}
	}

}