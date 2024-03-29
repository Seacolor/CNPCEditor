package views 
{
	import enum.Character;
	import flash.events.Event;
	import models.NPCData;
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayCollection;
	import mx.controls.ColorPicker;
	import mx.events.DropdownEvent;
	import mx.events.FlexEvent;
	import mx.utils.StringUtil;
	import spark.components.BorderContainer;
	import spark.components.CheckBox;
	import spark.components.ComboBox;
	import spark.components.Form;
	import spark.components.TextArea;
	import spark.events.TextOperationEvent;
	
	/**
	 * ...
	 * @author Seacolor
	 */
	public class TalkFormModel extends Form 
	{
		/**
		 * 選択可能な血飛沫のタイプです。
		 */
		protected const CHARACTER:ArrayCollection = new ArrayCollection(Character.toArray());
		
		[Bindable]
		/**
		 * NPCの設定です。
		 */
		public var npcData:NPCData;
		
		public var inTxtSelector:ComboBox;
		public var inTxt:TextArea;
		public var inTxtTalkOrder:CheckBox;
		public var inTxtColorPicker:ColorPicker;
		public var inTxtControlBar:BorderContainer;
		public var inCastSelector:ComboBox;
		public var inCharacterSelector:ComboBox;
		
		[Bindable]
		/**
		 * 編集中の台詞です。
		 */
		protected var editingText:String;
		
		public function TalkFormModel() 
		{
			
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
		 * UIコントロールと定義クラスをバインドします。
		 * @param	event	イベントです。
		 */
		protected function txtBinding(event:FlexEvent = null):void {
			// [会話時、台詞を順番に表示するか否か]のフラグをバインド
			inTxtTalkOrder.addEventListener(Event.CHANGE, function(changeEvent:Event):void {
				npcData.txtTalkOrder = changeEvent.currentTarget.selected;
			});
			// 台詞をバインド(複数の入力コントロールが関わるのでここだけ個別に定義)
			inTxt.addEventListener(TextOperationEvent.CHANGE, onTxtChange);
			// npcData.talk を監視し、コントロールを初期化
			ChangeWatcher.watch(npcData, "talk", function():void {
				if (inTxtSelector == null) return;
				resetText();
			});
		}
		/**
		 * 台詞入力コントロールの変更イベントハンドラです。
		 * @param	changeEvent	イベントです。
		 */
		protected function onTxtChange(changeEvent:TextOperationEvent = null):void {
			var selectedKey:String = getSelectedKey();
			if (selectedKey == "") return;
			npcData.talk[selectedKey] = inTxt.text;
		}
		/**
		 * 台詞選択コントロールの変更イベントハンドラです。
		 * @param	event	イベントです。
		 */
		protected function inTxtSelectorChange(event:Event):void {
			// [会話時、台詞を順番に表示するか否か]のコントロールは会話の時のみ表示
			inTxtTalkOrder.visible = inTxtSelector.selectedItem == MainModel.TEXT.getItemAt(5);
			switch (inTxtSelector.selectedItem) {
				// 魔法選択コントロールは詠唱の時のみ表示
				case MainModel.TEXT.getItemAt(69):
					currentState = "cast";
					break
				case MainModel.TEXT.getItemAt(70):
					currentState = "pornobook";
					break
				default:
					currentState = "default";
			}
			resetText();
		}
		/**
		 * 魔法選択コントロールの変更イベントハンドラです。
		 * @param	event	イベントです。
		 */
		protected function inCastSelectorChange(event:Event):void {
			resetText();
		}
		/**
		 * 選択された台詞で台詞入力コントロールを初期化します。
		 * @param	selectedItem	選択された台詞
		 */
		protected function resetText():void {
			var selectedKey:String = getSelectedKey();
			if (selectedKey == "" || npcData.talk[selectedKey] == undefined) {
				editingText = "";
				inTxt.text = editingText;
			} else {
				editingText = npcData.talk[selectedKey];
			}
		}
		/**
		 * 台詞色コントロールの閉じるイベントハンドラです。
		 * @param	closeEvent	イベントです。
		 */
		protected function inTxtColorPickerClose(closeEvent:DropdownEvent):void {
			if (inTxt.selectionActivePosition == -1 || inTxt.selectionAnchorPosition == -1) return;
			// 選択された色を16進数表現で取得
			var selectedColor:String = inTxtColorPicker.selectedColor.toString(16);
			// RGB表現にする為、6文字以下の場合は先頭に0を付加
			while (selectedColor.length < 6) {
				selectedColor = "0" + selectedColor;
			}
			// 10進数のRGB表現に変換
			var color:String = "[" + parseInt(selectedColor.substring(0, 2), 16).toString() + "," + parseInt(selectedColor.substring(2, 4), 16).toString() + "," + parseInt(selectedColor.substring(4, 6), 16).toString() + "]";
			var txt:String = inTxt.text;
			// 色定義に変換(指定位置の文字列を変換している為、文字列置換は使わない)
			inTxt.text = txt.substring(0, inTxt.selectionActivePosition) + "|" + color + txt.substring(inTxt.selectionActivePosition, inTxt.selectionAnchorPosition) + "|" + txt.substring(inTxt.selectionAnchorPosition);
			onTxtChange();
		}
		
		/**
		 * 現在編集中の台詞のキーを返します。
		 * @return	今どの台詞が選択されているかを示す文字列です。
		 */
		protected function getSelectedKey():String {
			if (inTxtSelector.selectedItem == null) return "";
			var selectedKey:String = inTxtSelector.selectedItem.value;
			if ( inTxtSelector.selectedItem == MainModel.TEXT.getItemAt(69) ) {
				if (inCastSelector.selectedItem == null) return "";
				selectedKey = StringUtil.substitute(selectedKey, inCastSelector.selectedItem.value);
			}
			if ( inTxtSelector.selectedItem == MainModel.TEXT.getItemAt(70) ) {
				if (inCharacterSelector.selectedItem == null) return "";
				selectedKey = StringUtil.substitute(selectedKey, inCharacterSelector.selectedItem.value);
			}
			return selectedKey;
		}
		
		/**
		 * キャラクター選択コントロールの変更イベントハンドラです。
		 * @param	event	イベントです。
		 */
		protected function inCharacterSelectorChange(event:Event):void {
			resetText();
		}
	}

}