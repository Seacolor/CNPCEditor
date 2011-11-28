package views 
{
	import flash.events.Event;
	import models.NPCData;
	import mx.controls.ColorPicker;
	import mx.events.DropdownEvent;
	import mx.events.FlexEvent;
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
			inTxt.addEventListener(TextOperationEvent.CHANGE, function(changeEvent:TextOperationEvent):void {
				if (inTxtSelector.selectedIndex == -1) return;
				npcData.talk[inTxtSelector.selectedItem.value] = changeEvent.currentTarget.text;
			});
			// TODO npcData.talk を監視し、コントロールを初期化
		}
		
		/**
		 * 台詞選択コントロールの変更イベントハンドラです。
		 * @param	event	イベントです。
		 */
		protected function inTxtSelectorChange(event:Event):void {
			resetText(event.currentTarget.selectedItem);
		}
		
		protected function reset(event:Event):void {
			if (inTxtSelector == null) return;
			resetText(inTxtSelector.selectedItem);
		}
		
		protected function resetText(selectedItem:Object):void {
			// [会話時、台詞を順番に表示するか否か]のコントロールは会話の時のみ表示
			inTxtTalkOrder.visible = selectedItem == MainModel.TXT_DIALOG;
			if (selectedItem == null || npcData.talk[selectedItem.value] == undefined) {
				editingText = "";
				inTxt.text = editingText;
			} else {
				editingText = npcData.talk[selectedItem.value];
			}
		}
		
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
			// 色定義に変換(指定位置の文字列を変換している為、文字列置換は使わない)
			inTxt.text = inTxt.text.substring(0, inTxt.selectionActivePosition) + "|" + color + inTxt.text.substring(inTxt.selectionActivePosition, inTxt.selectionAnchorPosition) + "|" + inTxt.text.substring(inTxt.selectionAnchorPosition);
		}
		
	}

}