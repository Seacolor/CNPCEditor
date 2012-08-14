package models 
{
	import enum.Skill;
	import mx.collections.ArrayCollection;
	import views.RaceFormModel;
	[Bindable]
	/**
	 * 定義されたカスタム種族の設定です。
	 * @author Kazushi Tominaga (Seacolor)
	 */
	public class RaceData 
	{
		/**
		 * 格闘スタイルです。
		 */
		public static const MELEE_STYLE:Array = [
			{label: "殴る", value: "0"},
			{label: "引っ掻く", value: "1"},
			{label: "噛み付く", value: "3"},
			{label: "睨む", value: "4"},
			{label: "刺す", value: "5"},
			{label: "触る", value: "6"},
			{label: "胞子を撒き散らす", value: "7"},
		];
		/**
		 * 詠唱スタイルです。
		 */
		public static const CAST_STYLE:Array = [
			{label: "魔法を詠唱する", value: "0"},
			{label: "糸を吐く", value: "1"},
			{label: "体液をまき散らす", value: "2"},
			{label: "触手を伸ばす", value: "3"},
			{label: "鋭く睨す", value: "4"},
			{label: "胞子を飛ばす", value: "5"},
			{label: "細かく振動する", value: "6"},
		];
		/**
		 * 耐性タイプです。
		 */
		public static const REGIST_TYPE:Array = [
			{label: "無し", value: "0"},
			{label: "リッチ型", value: "1"},
			{label: "妖精型", value: "2"},
			{label: "メタル型", value: "3"},
		];
		/**
		 * 血飛沫のタイプです。
		 */
		public static const BLOOD_TYPE:Array = [
			{label: "標準", value: "0"},
			{label: "無機物系", value: "1"},
		];
		
		/**
		 * 日本語名です。
		 */
		public var name:String;
		/**
		 * 識別子です。
		 */
		public var id:String;
		/**
		 * 男性になる確率です。
		 */
		public var sex:Number = 50;
		/**
		 * 回避率の補正値です。
		 */
		public var dv:Number = 0;
		/**
		 * ダメージ軽減率の補正値です。
		 */
		public var pv:Number = 0;
		/**
		 * 体力の補正値です。
		 */
		public var hp:Number = 100;
		/**
		 * マナの補正値です。
		 */
		public var mp:Number = 100;
		/**
		 * 筋力の補正値です。
		 */
		public var str:Number = 6;
		/**
		 * 耐久の補正値です。
		 */
		public var end:Number = 6;
		/**
		 * 器用の補正値です。
		 */
		public var dex:Number = 6;
		/**
		 * 意思の補正値です。
		 */
		public var per:Number = 6;
		/**
		 * 習得の補正値です。
		 */
		public var ler:Number = 6;
		/**
		 * 感覚の補正値です。
		 */
		public var wil:Number = 6;
		/**
		 * 魔力の補正値です。
		 */
		public var mag:Number = 6;
		/**
		 * 魅力の補正値です。
		 */
		public var chr:Number = 6;
		/**
		 * 速度の補正値です。
		 */
		public var spd:Number = 70;
		/**
		 * 格闘スタイルです。
		 */
		public var meleeStyle:Object = MELEE_STYLE[0];
		/**
		 * 詠唱スタイルです。
		 */
		public var castStyle:Object = CAST_STYLE[0];
		/**
		 * 耐性タイプ
		 */
		public var resist:Object = REGIST_TYPE[0];
		/**
		 * 年齢加算乱数値です。
		 */
		public var ageRnd:Number = 20;
		/**
		 * 最低年齢です。
		 */
		public var age:Number = 16;
		/**
		 * 血飛沫のタイプです。
		 */
		public var blood:Object = BLOOD_TYPE[0];
		/**
		 * 繁殖力です。
		 */
		public var breeder:Number = 100;
		/**
		 * 身長です。
		 */
		public var height:Number = 165;
		/**
		 * 獲得技能です。
		 */
		public var skill:ArrayCollection = new ArrayCollection();
	}

}