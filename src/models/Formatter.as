package models 
{
	import flash.filesystem.File;
	/**
	 * ...
	 * @author Seacolor
	 */
	public class Formatter 
	{
		
		public function Formatter() 
		{
			
		}
		/**
		 * 台詞オブジェクトを出力できる形式の文字列に整形します。
		 * @param	txts	台詞オブジェクト
		 * @param	txtTalkOrder	[会話時、台詞を順番に表示するか否か]のフラグ
		 * @param	txtUcnpcEv	特別品質のCNPCのイベント台詞
		 * @return	出力可能な文字列です。
		 */
		public static function formatTxt(txts:Object, txtTalkOrder:Boolean, txtUcnpcEv:String = null):String {
			var txt:Array = [];
			if (txtUcnpcEv) txt.push("%txt_ucnpc_ev_b", txtUcnpcEv, "%txt_ucnpc_ev_e");
			if (txtTalkOrder) txt.push("%txt_talk_order");
			MainModel.TEXT.source.forEach(function(e:Object, index:int, array:Array):void {
				if (txts[e.value] == undefined) return;
				txt.push(e.value);
				txt.push(txts[e.value]);
			});
			
			return txt.join(File.lineEnding);
		}
	}

}