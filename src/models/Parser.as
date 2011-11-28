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
	}

}