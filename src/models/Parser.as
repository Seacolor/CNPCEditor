package models 
{
	import mx.utils.StringUtil;
	/**
	 * ...
	 * @author Seacolor
	 */
	public class Parser 
	{
		
		public function Parser() 
		{
			
		}
		
		/**
		 * 文字列から透過率の設定を抽出します。
		 * <p>このメソッドは透過率の設定が存在しなかった場合、エラーではなく0を返却します。</p>
		 * @param	str	ファイルから読み込んだ文字列
		 * @return	透過率の値
		 */
		public static function parseTransmissivity(str:String):Number {
			var result:Array = str.match(/transmissivity\.\s+"(.*?)"/);
			if (!result) return 0;
			return Number(result[1]);
		}
		
		/**
		 * 文字列から影タイプの設定を抽出します。
		 * <p>このメソッドは影タイプの設定が存在しなかった場合、エラーではなく0を返却します。</p>
		 * @param	str	ファイルから読み込んだ文字列
		 * @return	影タイプの値
		 */
		public static function parseDropShadowType(str:String):Number {
			var result:Array = str.match(/dropShadowType\.\s+"(.*?)"/);
			if (!result) return 0;
			return Number(result[1]);
		}
		
		/**
		 * 文字列から地面からの浮き具合の設定を抽出します。
		 * <p>このメソッドは地面からの浮き具合の設定が存在しなかった場合、エラーではなく16を返却します。</p>
		 * @param	str	ファイルから読み込んだ文字列
		 * @return	地面からの浮き具合の値
		 */
		public static function parseCSetPos(str:String):Number {
			var result:Array = str.match(/cSetPos\.\s+"(.*?)"/);
			if (!result) return 16;
			return Number(result[1]);
		}
		
		/**
		 * 文字列から自動飲食を禁止するかどうかの設定を抽出します。
		 * <p>このメソッドは自動飲食を禁止するかどうかの設定が存在しなかった場合、エラーではなく"0"を返却します。</p>
		 * @param	str	ファイルから読み込んだ文字列
		 * @return	自動飲食を禁止するかどうかの値
		 */
		public static function parseNoFoodOrDrink(str:String):String {
			var result:Array = str.match(/noFoodOrDrink\.\s+"(.*?)"/);
			if (!result) return "0";
			return String(result[1]);
		}
		
		/**
		 * 文字列から吟遊詩人、清掃員、娼婦のいずれかとして行動するかどうかの設定を抽出します。
		 * <p>このメソッドは吟遊詩人、清掃員、娼婦のいずれかとして行動するかどうかの設定が存在しなかった場合、エラーではなく0を返却します。</p>
		 * @param	str	ファイルから読み込んだ文字列
		 * @return	吟遊詩人、清掃員、娼婦のいずれかとして行動するかどうかの値
		 */
		public static function parseCnpcRole(str:String):Object {
			var result:Array = str.match(/cnpcRole\.\s+"(.*?)"/);
			if (!result) return MainModel.ROLE.getItemAt(0);
			return MainModel.ROLE.getItemAt(itemSearch(MainModel.ROLE.source, result[1]));
		}
		
		/**
		 * 文字列から種族の別名の設定を抽出します。
		 * <p>このメソッドは種族の別名の設定が存在しなかった場合、エラーではなく空文字列を返却します。</p>
		 * @param	str	ファイルから読み込んだ文字列
		 * @return	種族の別名
		 */
		public static function parseRaceAlias(str:String):String {
			var result:Array = str.match(/raceAlias\.\s+"(.*?)"/);
			if (!result) return "";
			return String(result[1]);
		}
		
		/**
		 * 文字列から職業の別名の設定を抽出します。
		 * <p>このメソッドは職業の別名の設定が存在しなかった場合、エラーではなく空文字列を返却します。</p>
		 * @param	str	ファイルから読み込んだ文字列
		 * @return	職業の別名
		 */
		public static function parseClassAlias(str:String):String {
			var result:Array = str.match(/classAlias\.\s+"(.*?)"/);
			if (!result) return "";
			return String(result[1]);
		}
		
		/**
		 * 配列内の要素の値と入力値を比較し、要素のインデックスを返却します。
		 * @param	array	検索対象の配列です。
		 * @param	value	検索する値です。
		 * @return	インデックスです。　該当する要素が無かった場合、-1です。
		 */
		protected static function itemSearch(array:Array, value:Object):int {
			var i:int = 0;
			if (array.some(function(item:*, index:int, array:Array):Boolean {
				i = index;
				return item.value == value;
			})) {
				return i;
			} else {
				return -1;
			}
		}
		
		public static function parseTxt(str:String):Object {
			var talkPattern:RegExp = /^(%txt\S+)\r?\n(?!^%)(.*?)\r?\n(?=^%)/msg;
			var talk:Object = talkPattern.exec(str);
			var txts:Object = {};
			while (talk != null) {
				txts[talk[1]] = talk[2];
				talk = talkPattern.exec(str);
			}
			
			return txts;
		}
		
		/**
		 * 文字列からカスタム種族の定義の設定を抽出します。
		 * <p>このメソッドはカスタム種族の定義の設定が存在しなかった場合、エラーではなく空文字列を返却します。</p>
		 * @param	str	ファイルから読み込んだ文字列
		 * @return	カスタム種族の定義
		 */
		public static function parseUserRace(str:String):String {
			var result:Array = str.match(/userRace\.\s+"(.*?)"/);
			if (!result) return "";
			return String(result[1]);
		}
		
		/**
		 * 文字列からカスタム職業の定義の設定を抽出します。
		 * <p>このメソッドはカスタム職業の定義の設定が存在しなかった場合、エラーではなく空文字列を返却します。</p>
		 * @param	str	ファイルから読み込んだ文字列
		 * @return	カスタム職業の定義
		 */
		public static function parseUserClass(str:String):String {
			var result:Array = str.match(/userClass\.\s+"(.*?)"/);
			if (!result) return "";
			return String(result[1]);
		}
	}

}