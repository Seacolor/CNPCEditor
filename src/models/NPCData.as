package models 
{
	import flash.utils.Dictionary;
	import mx.collections.ArrayCollection;
	[Bindable]
	/**
	 * 定義されたNPCの設定です。
	 * @author Seacolor
	 */
	public class NPCData 
	{
		/**
		 * 作者です。
		 */
		public var author:String;
		/**
		 * 英語名です。
		 */
		public var id:String;
		/**
		 * 日本語名です。
		 */
		public var name:String;
		/**
		 * 種族です。
		 */
		public var race:Object;
		/**
		 * 職業です。
		 */
		public var npcClass:Object;
		/**
		 * 属性です。
		 */
		public var filter:ArrayCollection = new ArrayCollection(["cnpc"]);
		/**
		 * レベルです。
		 */
		public var level:Number = 1;
		/**
		 * 関係です。
		 */
		public var relation:String = "0";
		/**
		 * 性別です。
		 */
		public var sex:String = "-1";
		/**
		 * 生成品質です。
		 */
		public var fixLv:String = "0";
		/**
		 * 生成頻度です。
		 */
		public var rare:Number = 100;
		/**
		 * 生成条件です。
		 */
		public var spawnType:String = "0";
		/**
		 * 待機時です。
		 */
		public var aiCalm:String = "1";
		/**
		 * 移動確率です。
		 */
		public var aiMove:Number = 80;
		/**
		 * 適正距離です。
		 */
		public var aiDist:Number = 1;
		/**
		 * 瀕死時行動です。
		 */
		public var aiHeal:Object = MainModel.ACTION.getItemAt(0);
		/**
		 * 基本行動その1です。
		 */
		public var aiAct1:Object = MainModel.ACTION.getItemAt(0);
		/**
		 * 基本行動その2です。
		 */
		public var aiAct2:Object = MainModel.ACTION.getItemAt(0);
		/**
		 * 基本行動その3です。
		 */
		public var aiAct3:Object = MainModel.ACTION.getItemAt(0);
		/**
		 * 基本行動その4です。
		 */
		public var aiAct4:Object = MainModel.ACTION.getItemAt(0);
		/**
		 * 基本行動その5です。
		 */
		public var aiAct5:Object = MainModel.ACTION.getItemAt(0);
		/**
		 * 特殊行動確率です。
		 */
		public var aiActSubFreq:Number = 0;
		/**
		 * 特殊行動その1です。
		 */
		public var aiActSub1:Object = MainModel.SUB_ACTION.getItemAt(0);
		/**
		 * 特殊行動その2です。
		 */
		public var aiActSub2:Object = MainModel.SUB_ACTION.getItemAt(0);
		/**
		 * 特殊行動その3です。
		 */
		public var aiActSub3:Object = MainModel.SUB_ACTION.getItemAt(0);
		/**
		 * 特殊行動その4です。
		 */
		public var aiActSub4:Object = MainModel.SUB_ACTION.getItemAt(0);
		/**
		 * 特殊行動その5です。
		 */
		public var aiActSub5:Object = MainModel.SUB_ACTION.getItemAt(0);
		/**
		 * 素手攻撃の属性です
		 */
		public var meleeElem:Object = MainModel.ELEMENT.getItemAt(0);
		/**
		 * 素手攻撃の強度です
		 */
		public var meleeElemPow:Number = 100;
		/**
		 * 耐性です。
		 */
		public var regist:ArrayCollection = new ArrayCollection();
		/**
		 * 補正です。
		 */
		public var bitOn:ArrayCollection = new ArrayCollection();
		/**
		 * 透過率です。
		 */
		public var transmissivity:Number = 0;
		/**
		 * 会話イベントの台詞です。
		 */
		public var txtEvent:String;
		/**
		 * 会話時、台詞を順番に表示するか否かです。
		 */
		public var txtTalkOrder:Boolean = false;
		/**
		 * 台詞です。
		 */
		public var talk:Object = {};
	}

}