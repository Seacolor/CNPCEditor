package enum 
{
	/**
	 * ...
	 * @author Kazushi Tominaga (Seacolor)
	 */
	public final class Skill extends EnumBase 
	{
		public static const LONG_SWORD:Skill = new Skill("長剣", "100");
		public static const SHORT_SWORD:Skill = new Skill("短剣", "101");
		public static const AXE:Skill = new Skill("斧", "102");
		public static const BLUNT:Skill = new Skill("鈍器", "103");
		public static const POLEARM:Skill = new Skill("槍", "104");
		public static const STAVE:Skill = new Skill("杖", "105");
		public static const SCYTHE:Skill = new Skill("鎌", "107");
		public static const BOW:Skill = new Skill("弓", "108");
		public static const CROSSBOW:Skill = new Skill("クロスボウ", "109");
		public static const FIREARM:Skill = new Skill("銃器", "110");
		public static const THROWING:Skill = new Skill("投擲", "111");
		public static const MARTIAL_ARTS:Skill = new Skill("格闘", "106");
		public static const SHIELD:Skill = new Skill("盾", "168");
		public static const EVASION:Skill = new Skill("回避", "173");
		public static const DUAL_WIELD:Skill = new Skill("二刀流", "166");
		public static const TWO_HAND:Skill = new Skill("両手持ち", "167");
		public static const WEIGHT_LIFTING:Skill = new Skill("重量挙げ", "153");
		public static const TACTICS:Skill = new Skill("戦術", "152");
		public static const MARKSMAN:Skill = new Skill("射撃", "189");
		public static const HEALING:Skill = new Skill("治癒", "154");
		public static const MINING:Skill = new Skill("採掘", "163");
		public static const CARPENTRY:Skill = new Skill("大工", "176");
		public static const HEAVY_ARMOR:Skill = new Skill("重装備", "169");
		public static const MEDIUM_ARMOR:Skill = new Skill("中装備", "170");
		public static const LIGHT_ARMOR:Skill = new Skill("軽装備", "171");
		public static const LOCK_PICKING:Skill = new Skill("鍵開け", "158");
		public static const DISARM_TRAP:Skill = new Skill("罠解体", "175");
		public static const TAILORING:Skill = new Skill("裁縫", "177");
		public static const JEWELER:Skill = new Skill("宝石細工", "179");
		public static const STEALTH:Skill = new Skill("隠密", "157");
		public static const DETECTION:Skill = new Skill("探知", "159");
		public static const SENSE_QUALITY:Skill = new Skill("自然鑑定", "162");
		public static const EYE_OF_MIND:Skill = new Skill("心眼", "186");
		public static const FISHING:Skill = new Skill("釣り", "185");
		public static const GREATER_EVASION:Skill = new Skill("見切り", "187");
		public static const ANATOMY:Skill = new Skill("解剖学", "161");
		public static const LITERACY:Skill = new Skill("読書", "150");
		public static const MEMORIZATION:Skill = new Skill("暗記", "165");
		public static const ALCHEMY:Skill = new Skill("錬金術", "178");
		public static const GARDENING:Skill = new Skill("栽培", "180");
		public static const GENE_ENGINEER:Skill = new Skill("遺伝子学", "151");
		public static const COOKING:Skill = new Skill("料理", "184");
		public static const MEDITATION:Skill = new Skill("瞑想", "155");
		public static const MAGIC_DEVICE:Skill = new Skill("魔道具", "174");
		public static const CASTING:Skill = new Skill("詠唱", "172");
		public static const CONTROL_MAGIC:Skill = new Skill("魔力制御", "188");
		public static const MAGIC_CAPACITY:Skill = new Skill("魔力の限界", "164");
		public static const FAITH:Skill = new Skill("信仰", "181");
		public static const TRAVELING:Skill = new Skill("旅歩き", "182");
		public static const NEGOTIATION:Skill = new Skill("交渉", "156");
		public static const INVESTING:Skill = new Skill("投資", "160");
		public static const PERFORMER:Skill = new Skill("演奏", "183");
		public static const PICKPOCKET:Skill = new Skill("窃盗", "300");
		public static const RIDING:Skill = new Skill("乗馬", "301");
		
		/**
		 * 列挙を配列に変換し、返します。
		 * @return	列挙を要素とする配列
		 */
		public static function toArray():Array
		{
			return [
				Skill.LONG_SWORD,
				Skill.SHORT_SWORD,
				Skill.AXE,
				Skill.BLUNT,
				Skill.POLEARM,
				Skill.STAVE,
				Skill.SCYTHE,
				Skill.BOW,
				Skill.CROSSBOW,
				Skill.FIREARM,
				Skill.THROWING,
				Skill.MARTIAL_ARTS,
				Skill.SHIELD,
				Skill.EVASION,
				Skill.DUAL_WIELD,
				Skill.TWO_HAND,
				Skill.WEIGHT_LIFTING,
				Skill.TACTICS,
				Skill.MARKSMAN,
				Skill.HEALING,
				Skill.MINING,
				Skill.CARPENTRY,
				Skill.HEAVY_ARMOR,
				Skill.MEDIUM_ARMOR,
				Skill.LIGHT_ARMOR,
				Skill.LOCK_PICKING,
				Skill.DISARM_TRAP,
				Skill.TAILORING,
				Skill.JEWELER,
				Skill.STEALTH,
				Skill.DETECTION,
				Skill.SENSE_QUALITY,
				Skill.EYE_OF_MIND,
				Skill.FISHING,
				Skill.GREATER_EVASION,
				Skill.ANATOMY,
				Skill.LITERACY,
				Skill.MEMORIZATION,
				Skill.ALCHEMY,
				Skill.GARDENING,
				Skill.GENE_ENGINEER,
				Skill.COOKING,
				Skill.MEDITATION,
				Skill.MAGIC_DEVICE,
				Skill.CASTING,
				Skill.CONTROL_MAGIC,
				Skill.MAGIC_CAPACITY,
				Skill.FAITH,
				Skill.TRAVELING,
				Skill.NEGOTIATION,
				Skill.INVESTING,
				Skill.PERFORMER,
				Skill.PICKPOCKET,
				Skill.RIDING,
			];
		}
		
		/**
		 * @private
		 */
		public function Skill(label:String, value:String) 
		{
			super(label, value);
		}
	}

}