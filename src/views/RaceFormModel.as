package views 
{
	import enum.Skill;
	import flash.events.MouseEvent;
	import models.NPCData;
	import models.RaceData;
	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;
	import spark.components.ComboBox;
	import spark.components.Form;
	import spark.components.NumericStepper;
	
	/**
	 * ...
	 * @author Kazushi Tominaga (Seacolor)
	 */
	public class RaceFormModel extends Form 
	{
		/**
		 * 選択可能な格闘スタイルです。
		 */
		public static const MELEE_STYLE:ArrayCollection = new ArrayCollection(RaceData.MELEE_STYLE);
		/**
		 * 選択可能な格闘スタイルです。
		 */
		public static const CAST_STYLE:ArrayCollection = new ArrayCollection(RaceData.CAST_STYLE);
		/**
		 * 選択可能な耐性タイプです。
		 */
		public static const REGIST_TYPE:ArrayCollection = new ArrayCollection(RaceData.REGIST_TYPE);
		/**
		 * 選択可能な血飛沫のタイプです。
		 */
		public static const BLOOD_TYPE:ArrayCollection = new ArrayCollection(RaceData.BLOOD_TYPE);
		/**
		 * 選択可能な血飛沫のタイプです。
		 */
		public static const SKILL:ArrayCollection = new ArrayCollection(Skill.toArray());
		
		[Bindable]
		/**
		 * NPCの設定です。
		 */
		public var npcData:NPCData;
		
		public var inSkillId:ComboBox
		public var inSkillBonus:NumericStepper
		
		public function RaceFormModel() 
		{
			
		}
		
		/**
		 * UIコントロールと定義クラスをバインドします。
		 * @param	event	イベントです。
		 */
		protected function binding(event:FlexEvent = null):void {
		}
		/**
		 * 選択コントローラのユーザ入力関数です。
		 * @param	value	入力された値です。
		 * @return	入力された値に基き生成されたコントローラの要素です。
		 */
		protected function inputToValue(value:String):* {
			return { label: value, value: value };
		}
		
		/**
		 * 獲得技能追加コントローラのクリックイベントハンドラです。
		 * @param	clickEvent	イベントです。
		 */
		protected function inSkillAddClick(clickEvent:MouseEvent):void {
			var e:models.Skill = new models.Skill();
			e.id = inSkillId.selectedItem;
			e.bonus = inSkillBonus.value;
			var i:int = 0;
			npcData.raceData.skill.addItem(e);
		}
		/**
		 * 獲得技能削除コントローラのクリックイベントハンドラです。
		 * @param	clickEvent	イベントです。
		 */
		public function inSkillDeleteClick(clickEvent:MouseEvent):void {
			npcData.raceData.skill.removeItemAt(npcData.raceData.skill.getItemIndex(clickEvent.currentTarget.parent.data));
		}
	}

}