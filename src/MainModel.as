package  
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileFilter;
	import models.Formatter;
	import models.NPCData;
	import models.Parser;
	import models.Regist;
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.controls.ColorPicker;
	import mx.core.IVisualElement;
	import mx.events.CollectionEvent;
	import mx.events.DropdownEvent;
	import mx.events.FlexEvent;
	import mx.utils.StringUtil;
	import spark.components.BorderContainer;
	import spark.components.CheckBox;
	import spark.components.ComboBox;
	import spark.components.FormItem;
	import spark.components.NumericStepper;
	import spark.components.RadioButtonGroup;
	import spark.components.TextArea;
	import spark.components.TextInput;
	import spark.components.WindowedApplication;
	import spark.events.IndexChangeEvent;
	import spark.events.TextOperationEvent;
	
	/**
	 * CNPC定義ファイルエディタの実装クラスです。
	 * @author Seacolor
	 */
	public class MainModel extends WindowedApplication 
	{
		/**
		 * 選択可能なタブです。
		 */
		public static const TAB:ArrayCollection = new ArrayCollection([
			{label: "性能", value: "default"},
			{label: "台詞", value: "talk"},
		]);
		/**
		 * 選択可能な種族です。
		 */
		public static const RACE:ArrayCollection = new ArrayCollection([
			{label: "コボルト", value: "kobolt"},
			{label: "オーク", value: "orc"},
			{label: "トロール", value: "troll"},
			{label: "リザードマン", value: "lizardman"},
			{label: "ミノタウロス", value: "minotaur"},
			{label: "イェルス", value: "yerles"},
			{label: "ノーランド", value: "norland"},
			{label: "エウダーナ", value: "eulderna"},
			{label: "妖精", value: "fairy"},
			{label: "阿修羅", value: "asura"},
			{label: "スライム", value: "slime"},
			{label: "狼", value: "wolf"},
			{label: "丘の民", value: "dwarf"},
			{label: "ジューア", value: "juere"},
			{label: "ゾンビ", value: "zombie"},
			{label: "エレア", value: "elea"},
			{label: "ウサギ", value: "rabbit"},
			{label: "羊", value: "sheep"},
			{label: "蛙", value: "frog"},
			{label: "ムカデ", value: "centipede"},
			{label: "かたつむり", value: "snail"},
			{label: "マンドレイク", value: "mandrake"},
			{label: "昆虫", value: "beetle"},
			{label: "きのこ", value: "mushroom"},
			{label: "コウモリ", value: "bat"},
			{label: "エント", value: "ent"},
			{label: "リッチ", value: "lich"},
			{label: "猟犬", value: "hound"},
			{label: "幽霊", value: "ghost"},
			{label: "精霊", value: "spirit"},
			{label: "目", value: "eye"},
			{label: "ワイバーン", value: "wyvern"},
			{label: "ワスプ", value: "wasp"},
			{label: "巨人", value: "giant"},
			{label: "インプ", value: "imp"},
			{label: "手", value: "hand"},
			{label: "蛇", value: "snake"},
			{label: "ドレイク", value: "drake"},
			{label: "ゴブリン", value: "goblin"},
			{label: "熊", value: "bear"},
			{label: "鎧", value: "armor"},
			{label: "メデューサ", value: "medusa"},
			{label: "キューピット", value: "cupid"},
			{label: "ファントム", value: "phantom"},
			{label: "ハーピー", value: "harpy"},
			{label: "ドラゴン", value: "dragon"},
			{label: "恐竜", value: "dinosaur"},
			{label: "ケルベロス", value: "cerberus"},
			{label: "蜘蛛", value: "spider"},
			{label: "ゴーレム", value: "golem"},
			{label: "岩", value: "rock"},
			{label: "蟹", value: "crab"},
			{label: "骸骨", value: "skeleton"},
			{label: "駒", value: "piece"},
			{label: "猫", value: "cat"},
			{label: "犬", value: "dog"},
			{label: "ローラン", value: "roran"},
			{label: "ねずみ", value: "rat"},
			{label: "やどかり", value: "shell"},
			{label: "猫の神", value: "catgod"},
			{label: "機械の神", value: "machinegod"},
			{label: "死霊の神", value: "undeadgod"},
			{label: "機械", value: "machine"},
			{label: "ウィスプ", value: "wisp"},
			{label: "鶏", value: "chicken"},
			{label: "ストーカー", value: "stalker"},
			{label: "妹猫", value: "catsister"},
			{label: "カオスシェイプ", value: "mutant"},
			{label: "イーク", value: "yeek"},
			{label: "イス", value: "yith"},
			{label: "神の化身", value: "servant"},
			{label: "馬", value: "horse"},
			{label: "神", value: "god"},
			{label: "クイックリング", value: "quickling"},
			{label: "メタル", value: "metal"},
			{label: "バイク", value: "bike"}
		]);
		/**
		 * 選択可能な職業です。
		 */
		public static const CLASS:ArrayCollection = new ArrayCollection([
			{label: "戦士", value: "warrior"},
			{label: "遺跡荒らし", value: "thief"},
			{label: "魔法使い", value: "wizard"},
			{label: "農民", value: "farmer"},
			{label: "プレデター", value: "predator"},
			{label: "狩人", value: "archer"},
			{label: "魔法戦士", value: "warmage"},
			{label: "ピアニスト", value: "pianist"},
			{label: "機工兵", value: "gunner"},
			{label: "神官", value: "priest"},
			{label: "クレイモア", value: "claymore"},
			{label: "観光客", value: "tourist"},
			{label: "無職", value: ""},
		]);
		/**
		 * 選択可能な属性です。
		 */
		public static const FILTER:ArrayCollection = new ArrayCollection([
			{label: "人", value: "man"},
			{label: "ドラゴン", value: "dragon"},
			{label: "アンデッド", value: "undead"},
			{label: "スライム", value: "slime"},
			{label: "炎", value: "fire"},
			{label: "ＳＦ", value: "sf"},
			{label: "イーク", value: "yeek"},
			{label: "ミノタウロス", value: "mino"},
			{label: "野生", value: "wild"},
			{label: "駒", value: "pawn"},
			{label: "傭兵", value: "shopguard"},
			{label: "ごろつき", value: "rogue"},
			{label: "ネコ", value: "cat"},
			{label: "エーテル", value: "ether"},
			{label: "馬", value: "horse"},
		]);
		/**
		 * 選択可能な行動です。
		 */
		public static const ACTION:ArrayCollection = new ArrayCollection([
			{label: "何もしない", value: "0"},
			{label: "近接攻撃", value: "-1"},
			{label: "遠隔攻撃", value: "-2"},
			{label: "接近待ち", value: "-3"},
			{label: "ランダムな方向に移動", value: "-4"},
			{label: "軽傷治癒", value: "400"},
			{label: "致命傷治癒", value: "401"},
			{label: "エリスの癒し", value: "402"},
			{label: "ジュアの癒し", value: "403"},
			{label: "治癒の雨", value: "404"},
			{label: "癒しの手", value: "405"},
			{label: "清浄なる光", value: "406"},
			{label: "全浄化", value: "407"},
			{label: "テレポート", value: "408"},
			{label: "テレポートアザー", value: "409"},
			{label: "ショートテレポート", value: "410"},
			{label: "鑑定", value: "411"},
			{label: "解呪", value: "412"},
			{label: "神託", value: "413"},
			{label: "魔法の矢", value: "414"},
			{label: "地獄の吐息", value: "415"},
			{label: "麻痺の矢", value: "416"},
			{label: "混沌の瞳", value: "417"},
			{label: "暗黒の矢", value: "418"},
			{label: "アイスボルト", value: "419"},
			{label: "ファイアボルト", value: "420"},
			{label: "ライトニングボルト", value: "421"},
			{label: "暗黒の光線", value: "422"},
			{label: "幻影の光線", value: "423"},
			{label: "モンスター召喚", value: "424"},
			{label: "野生召喚", value: "425"},
			{label: "炎召喚", value: "426"},
			{label: "駒召喚", value: "427"},
			{label: "帰還", value: "428"},
			{label: "魔法の地図", value: "429"},
			{label: "物質感知", value: "430"},
			{label: "アイスボール", value: "431"},
			{label: "ファイアボール", value: "432"},
			{label: "混沌の渦", value: "433"},
			{label: "轟音の波動", value: "434"},
			{label: "蜘蛛の巣", value: "436"},
			{label: "闇の霧", value: "437"},
			{label: "壁生成", value: "438"},
			{label: "肉体復活", value: "439"},
			{label: "精神復活", value: "440"},
			{label: "聖なる盾", value: "442"},
			{label: "沈黙の霧", value: "443"},
			{label: "リジェネレーション", value: "444"},
			{label: "元素保護", value: "445"},
			{label: "加速", value: "446"},
			{label: "鈍足", value: "447"},
			{label: "英雄", value: "448"},
			{label: "脆弱の霧", value: "449"},
			{label: "元素の傷跡", value: "450"},
			{label: "ホーリーヴェイル", value: "451"},
			{label: "ナイトメア", value: "452"},
			{label: "知者の加護", value: "453"},
			{label: "自己の変容", value: "454"},
			{label: "酸の海", value: "455"},
			{label: "炎の壁", value: "456"},
			{label: "ドア生成", value: "457"},
			{label: "インコグニート", value: "458"},
			{label: "魔力の集積", value: "459"},
			{label: "魔力の嵐", value: "460"},
			{label: "復活", value: "461"},
			{label: "契約", value: "462"},
			{label: "四次元ポケット", value: "463"},
			{label: "メテオ", value: "465"},
			{label: "グラビティ", value: "466"},
			{label: "吸血の牙(1)", value: "601"},
			{label: "炎のブレス(6)", value: "602"},
			{label: "冷気のブレス(6)", value: "603"},
			{label: "電撃のブレス(6)", value: "604"},
			{label: "暗黒のブレス(6)", value: "605"},
			{label: "混沌のブレス(6)", value: "606"},
			{label: "轟音のブレス(6)", value: "607"},
			{label: "地獄のブレス(6)", value: "608"},
			{label: "神経のブレス(6)", value: "609"},
			{label: "毒のブレス(6)", value: "610"},
			{label: "幻惑のブレス(6)", value: "611"},
			{label: "強力なブレス(6)", value: "612"},
			{label: "弱体化の手", value: "613"},
			{label: "飢餓の手", value: "614"},
			{label: "毒の手", value: "615"},
			{label: "麻痺の手", value: "616"},
			{label: "恐怖の手", value: "617"},
			{label: "眠りの手", value: "618"},
			{label: "接近(6)", value: "619"},
			{label: "異次元の手(6)", value: "620"},
			{label: "マナ回復", value: "621"},
			{label: "神罰(7)", value: "622"},
			{label: "ジュアの祈り", value: "623"},
			{label: "魔力の吸収", value: "624"},
			{label: "ルルウィの憑依", value: "625"},
			{label: "自己認識", value: "626"},
			{label: "空間歪曲", value: "627"},
			{label: "他者変容(7)", value: "628"},
			{label: "魔力の抽出", value: "629"},
			{label: "魔力の充填", value: "630"},
			{label: "スウォーム", value: "631"},
			{label: "変容の眼差し(3)", value: "632"},
			{label: "エーテルの眼差し(3)", value: "633"},
			{label: "エーテルの海", value: "634"},
			{label: "スリの指", value: "635"},
			{label: "狂気の眼差し(3)", value: "636"},
			{label: "狂気治癒の雨", value: "637"},
			{label: "朦朧の眼差し(3)", value: "638"},
			{label: "猫召喚", value: "639"},
			{label: "イーク召喚", value: "640"},
			{label: "駒召喚", value: "641"},
			{label: "炎召喚", value: "642"},
			{label: "妹召喚", value: "643"},
			{label: "自爆", value: "644"},
			{label: "呪いの言葉(5)", value: "645"},
			{label: "死の宣告(7)", value: "646"},
			{label: "ブースト", value: "647"},
			{label: "罵倒(5)", value: "648"},
			{label: "遠距離打撃(5)", value: "649"},
			{label: "遠距離打撃(7)", value: "650"},
			{label: "食い漁り", value: "651"},
			{label: "マナの眼差し(3)", value: "652"},
			{label: "退却", value: "653"},
			{label: "寄生(2)", value: "654"},
			{label: "グレネード", value: "655"},
			{label: "鼓舞", value: "656"},
			{label: "首狩り(2)", value: "658"},
			{label: "地雷投下", value: "659"},
		]);
		/**
		 * 選択可能な特殊行動です。
		 */
		public static const SUB_ACTION:ArrayCollection = new ArrayCollection(ACTION.toArray().concat(
			{label: "塩投擲", value: "-9996"},
			{label: "ポーション投擲・大", value: "-9997"},
			{label: "ポーション投擲・中", value: "-9998"},
			{label: "ポーション投擲・小", value: "-9999"}
		));
		/**
		 * 選択可能な攻撃属性です。
		 */
		public static const ELEMENT:ArrayCollection = new ArrayCollection([
			{label: "無", value: "64"},
			{label: "火炎", value: "50"},
			{label: "冷気", value: "51"},
			{label: "電撃", value: "52"},
			{label: "暗黒", value: "53"},
			{label: "幻惑", value: "54"},
			{label: "毒", value: "55"},
			{label: "地獄", value: "56"},
			{label: "音", value: "57"},
			{label: "神経", value: "58"},
			{label: "混沌", value: "59"},
			{label: "魔法", value: "60"},
			{label: "切り傷", value: "61"},
			{label: "エーテル", value: "62"},
			{label: "酸", value: "63"},
		]);
		/**
		 * 選択可能な耐性強度です。
		 */
		public static const REGIST_POWER:ArrayCollection = new ArrayCollection([
			{label: "致命的な弱点", value: "-2"},
			{label: "弱点", value: "-1"},
			{label: "耐性なし", value: "0"},
			{label: "弱い耐性", value: "1"},
			{label: "普通の耐性", value: "2"},
			{label: "強い耐性", value: "3"},
			{label: "素晴らしい耐性", value: "4"},
			{label: "素晴らしい耐性", value: "5"},
			{label: "素晴らしい耐性", value: "6"},
			{label: "素晴らしい耐性", value: "7"},
			{label: "完全な免疫", value: "8"},
		]);
		/**
		 * 選択可能な補正です。
		 */
		public static const BIT:ArrayCollection = new ArrayCollection([
			{label: "浮遊", value: "5"},
			{label: "透明", value: "6"},
			{label: "透明な物を見る", value: "7"},
			{label: "混乱を無効", value: "8"},
			{label: "盲目を無効", value: "9"},
			{label: "恐怖とそれによる逃亡を無効", value: "10"},
			{label: "睡眠を無効", value: "11"},
			{label: "麻痺を無効", value: "12"},
			{label: "毒を無効", value: "13"},
			{label: "腐った物を難なく消化する", value: "14"},
			{label: "アイテムを盗まれなくする", value: "15"},
			{label: "変装中", value: "16"},
			{label: "死亡時に必ず所持金を落とす", value: "17"},
			{label: "自爆生物", value: "18"},
			{label: "死の宣告持ち", value: "19"},
			{label: "連続魔法持ち", value: "20"},
			{label: "レイハンド持ち", value: "21"},
			{label: "適正騎乗生物", value: "22"},
			{label: "分裂生物", value: "23"},
			{label: "自動発動型エンチャント装備中", value: "24"},
			{label: "非適正騎乗生物(非力すぎる)", value: "25"},
			{label: "魔法以外の属性ダメージに強い", value: "26"},
			{label: "分裂生物(キューブ)", value: "27"},
			{label: "金属生物", value: "28"},
			{label: "出血を抑える", value: "29"},
			{label: "バッシュの発生率アップ", value: "30"},
			{label: "地雷無効", value: "31"},
		]);
		/**
		 * 編集可能な台詞の一覧です。
		 */
		public static const TEXT:ArrayCollection = new ArrayCollection([
			{label: "通常の待機状態", value: "%txtCalm,JP"},
			{label: "交戦する", value: "%txtAggro,JP"},
			{label: "ミンチにされた", value: "%txtDead,JP"},
			{label: "ミンチにした", value: "%txtKilled,JP"},
			{label: "出迎え", value: "%txtWelcome,JP"},
			{label: "話しかけた", value: "%txtDialog,JP"},
			{label: "罵倒する", value: "%txtabuse,JP"},
			{label: "婚約を申し込まれた", value: "%txtmarriage,JP"},
			{label: "遺伝子を残す", value: "%txtanata,JP"},
			{label: "遺伝子を残すのを断る", value: "%txtiyayo,JP"},
			{label: "気持ちいいことを受ける時（デフォだと「なかなかの身体つきだ、買った」みたいなやつ）", value: "%txtnakanaka,JP"},
			{label: "気持ちいいことを受ける時2（デフォだと上の直後の「いくよ！」みたいなやつ）", value: "%txtikuyo,JP"},
			{label: "気持ちいいことをするで「やめる」を選んだ時（デフォだと「冷やかしか？」みたいなやつ）", value: "%txtkiyameru,JP"},
			{label: "気持ちいいことをしている最中", value: "%txtkuyasii,JP"},
			{label: "気持ちいいことの事後", value: "%txtjigo,JP"},
			{label: "乗馬される", value: "%txtnoru,JP"},
			{label: "乗馬状態を解除される", value: "%txtoriru,JP"},
			{label: "媚薬入りの食べ物を食べた", value: "%txtbiyaku,JP"},
			{label: "媚薬で乳や卵を産む", value: "%txttiti,JP"},
			{label: "媚薬を渡されて叩き割る", value: "%txtsaite,JP"},
			{label: "サンドバッグに吊るされている", value: "%txtsand,JP"},
			{label: "気が狂っている", value: "%txtnikorose,JP"},
			{label: "聴診器を当てた", value: "%txtkya,JP"},
			{label: "聴診器を外した", value: "%txttyohazusu,JP"},
			{label: "紐で縛った", value: "%txtsibaru,JP"},
			{label: "紐をほどいた", value: "%txthodoku,JP"},
			{label: "サンドバッグに吊るされる", value: "%txtturusu,JP"},
			{label: "サンドバッグから降ろされる", value: "%txtsorosu,JP"},
			{label: "サンドバッグに吊るされて殴られている", value: "%txtsnaguru,JP"},
			{label: "おみやげを渡された", value: "%txtomiyage,JP"},
			{label: "結婚指輪、首輪を渡された時（「顔を赤らめた」のあと）", value: "%txtyubikubi,JP"},
			{label: "結婚指輪、首輪を取り上げようとした時（「飲み込んだ」のあと）", value: "%txttoriage,JP"},
			{label: "ペットを冒険者にしたあと話しかけた", value: "%txtpbou,JP"},
			{label: "ペットを冒険者にしたあとアイテム交換をした", value: "%txtexthank,JP"},
			{label: "ペットを冒険者にしたあとアイテム交換を持ちかけて、見合うアイテムを持っていないor交換をやめた", value: "%txtexhiya,JP"},
			{label: "ペットを冒険者にしたあと護衛の依頼を持ちかけた", value: "%txtgoei,JP"},
			{label: "ペットを冒険者にしたあと護衛を依頼した", value: "%txtyatou,JP"},
			{label: "ペットを冒険者にしたあと護衛の依頼を持ちかけてやめた", value: "%txthihiya,JP"},
			{label: "ペットを冒険者にしたあと仲間に誘って承諾された", value: "%txtumaku,JP"},
			{label: "ペットを冒険者にしたあと仲間に誘ってお断りされた時（力の差がありすぎる場合）", value: "%txttikara,JP"},
			{label: "ペットを冒険者にしたあと仲間に誘ってお断りされた時（ペット枠が空いていない場合）", value: "%txt0free,JP"},
			{label: "ペットを冒険者にしたあと仲間に誘ってお断りされた時（友好度が足りないor雇用回数が足りない場合）", value: "%txtokoto,JP"},
			{label: "腐った物を食べた", value: "%txtsibui,JP"},
			{label: "生肉を食べた", value: "%txtnamaniku,JP"},
			{label: "生の小麦粉を食べた", value: "%txtkona,JP"},
			{label: "生麺を食べた", value: "%txtnamamen,JP"},
			{label: "その他の未調理の物を食べた", value: "%txtheibon,JP"},
			{label: "ランク1～2の料理（失敗料理）を食べた", value: "%txt1_2,JP"},
			{label: "ランク3～4の料理を食べた", value: "%txt3_4,JP"},
			{label: "ランク5～6の料理を食べた", value: "%txt5_6,JP"},
			{label: "ランク7～8の料理を食べた", value: "%txt7_8,JP"},
			{label: "ランク9（最高級）の料理を食べた", value: "%txt9saiko,JP"},
			{label: "気持ちいいことが中断された", value: "%txtkaradake,JP"},
			{label: "婚約を断る", value: "%txtyanwari,JP"},
			{label: "訓練所に行こうとして訓練費用がなかった", value: "%txtkunren,JP"},
			{label: "自動食事をしようとして手元に食べ物がなかった", value: "%txtonaka,JP"},
			{label: "瀕死", value: "%txthinsi,JP"},
			{label: "子供を作る", value: "%txtkodukuri,JP"},
			{label: "レイハンドを使う", value: "%txtlayhand,JP"},
			{label: "演奏を聞かされて飽きた", value: "%txtakita,JP"},
			{label: "演奏を聞かされて投石する", value: "%txturusai,JP"},
			{label: "演奏を聞かされた際にデフォルトだと「○○は石を投げた」となる部分", value: "%txtthrowrock,JP"},
			{label: "演奏を聞かされて褒める", value: "%txtbravo,JP"},
			{label: "デフォルトだと「○○は××を罵倒した」となる部分", value: "%txtbatou,JP"},
			{label: "寄生された", value: "%txtparasite,JP"},
			{label: "寄生されている時（デフォルトだと「なにかが産まれそうだよ！」の部分）", value: "%txtumare,JP"},
			{label: "何かが腹を破って飛び出した", value: "%txttobidasi,JP"},
			{label: "エイリアンを溶かした", value: "%txttoketa,JP"},
		]);
		/**
		 * 選択可能な役割です。
		 */
		public static const ROLE:ArrayCollection = new ArrayCollection([
			{label: "通常", value: "0"},
			{label: "吟遊詩人", value: "1"},
			{label: "清掃員", value: "2"},
			{label: "娼婦", value: "3"},
		]);
		
		/**
		 * 台詞における会話を示す定数です。
		 */
		public static const TXT_DIALOG:Object = TEXT.getItemAt(5);
		
		/**
		 * NPCの設定ファイルです。
		 */
		public var npcFile:File;
		[Bindable]
		/**
		 * NPCの設定です。
		 */
		public var npcData:NPCData = new NPCData();
		
		public var inAuthor:TextInput;
		public var inId:TextInput;
		public var inName:TextInput;
		public var inRace:ComboBox;
		public var inClass:ComboBox;
		public var inFilter:FormItem;
		public var inMan:CheckBox;
		public var inDragon:CheckBox;
		public var inUndead:CheckBox;
		public var inSlime:CheckBox;
		public var inFire:CheckBox;
		public var inSf:CheckBox;
		public var inYeek:CheckBox;
		public var inMino:CheckBox;
		public var inWild:CheckBox;
		public var inPawn:CheckBox;
		public var inShopguard:CheckBox;
		public var inRogue:CheckBox;
		public var inCat:CheckBox;
		public var inEther:CheckBox;
		public var inHorse:CheckBox;
		public var inLevel:NumericStepper;
		public var inRelation:RadioButtonGroup;
		public var inSex:RadioButtonGroup;
		public var inFixLv:RadioButtonGroup;
		public var inRare:NumericStepper;
		public var inSpawnType:RadioButtonGroup;
		public var inAiCalm:RadioButtonGroup;
		public var inAiMove:NumericStepper;
		public var inAiDist:NumericStepper;
		public var inAiHeal:ComboBox;
		public var inAiAct1:ComboBox;
		public var inAiAct2:ComboBox;
		public var inAiAct3:ComboBox;
		public var inAiAct4:ComboBox;
		public var inAiAct5:ComboBox;
		public var inAiActSubFreq:NumericStepper;
		public var inAiActSub1:ComboBox;
		public var inAiActSub2:ComboBox;
		public var inAiActSub3:ComboBox;
		public var inAiActSub4:ComboBox;
		public var inAiActSub5:ComboBox;
		public var inMeleeElem:ComboBox;
		public var inMeleeElemPow:NumericStepper;
		public var inRegistElem:ComboBox;
		public var inRegistPow:ComboBox;
		public var inBit:FormItem;
		public var inBit5:CheckBox;
		public var inBit6:CheckBox;
		public var inBit7:CheckBox;
		public var inBit8:CheckBox;
		public var inBit9:CheckBox;
		public var inBit10:CheckBox;
		public var inBit11:CheckBox;
		public var inBit12:CheckBox;
		public var inBit13:CheckBox;
		public var inBit14:CheckBox;
		public var inBit15:CheckBox;
		public var inBit16:CheckBox;
		public var inBit17:CheckBox;
		public var inBit18:CheckBox;
		public var inBit19:CheckBox;
		public var inBit20:CheckBox;
		public var inBit21:CheckBox;
		public var inBit22:CheckBox;
		public var inBit23:CheckBox;
		public var inBit24:CheckBox;
		public var inBit25:CheckBox;
		public var inBit26:CheckBox;
		public var inBit27:CheckBox;
		public var inBit28:CheckBox;
		public var inBit29:CheckBox;
		public var inBit30:CheckBox;
		public var inBit31:CheckBox;
		public var inTransmissivity:NumericStepper;
		public var inDropShadowType:NumericStepper;
		public var inCSetPos:NumericStepper;
		public var inNoFoodOrDrink:RadioButtonGroup;
		public var inCnpcRole:ComboBox;
		/**
		 * 耐性削除コントローラのクリックイベントハンドラです。
		 * @param	clickEvent	イベントです。
		 */
		public function inRegistDeleteClick(clickEvent:MouseEvent):void {
			npcData.regist.removeItemAt(npcData.regist.getItemIndex(clickEvent.currentTarget.parent.data));
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
		 * 耐性一覧コントローラの表示関数です。
		 * @param	item	要素です。
		 * @return	ラベルです。
		 */
		protected function inRegistPowLabelFunction(item:Object):String {
			if (item == null) return "";
			return item.label + "(" + item.value + ")";
		}
		/**
		 * 耐性追加コントローラのクリックイベントハンドラです。
		 * @param	clickEvent	イベントです。
		 */
		protected function inRegistAddClick(clickEvent:MouseEvent):void {
			var e:Regist = new Regist();
			e.elem = inRegistElem.selectedItem;
			e.pow = inRegistPow.selectedItem;
			var i:int = 0;
			if (npcData.regist.source.some(function isRegistAdded(item:Regist, index:int, array:Array):Boolean {
				i = index;
				return item.elem.value == inRegistElem.selectedItem.value;
			})) {
				npcData.regist.setItemAt(e, i);
			} else {
				npcData.regist.addItem(e);
			}
		}
		/**
		 * タブの変更イベントハンドラです。
		 * @param	event	イベントです。
		 */
		protected function inMainTabChange(event:IndexChangeEvent):void {
			currentState = TAB.getItemAt(event.newIndex).value;
		}
		
		/**
		 * 読み込みコントロールのクリックイベントハンドラです。
		 * @param	clickEvent	イベントです。
		 */
		protected function inLoadClick(clickEvent:MouseEvent):void {
			npcFile = new File();
			npcFile.browseForOpen("ファイルを選択してください", [new FileFilter("NPC設定ファイル", "*.txt")]);
			npcFile.addEventListener(Event.SELECT, parse);
		}
		
		/**
		 * NPC設定ファイルを読み込み、NPC設定クラスにセットします。
		 * @param	selectEvent	ファイル選択の選択イベントです。
		 */
		protected function parse(selectEvent:Event):void {
			var stream:FileStream = new FileStream();
			stream.open(npcFile, FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			
			try 
			{
				npcData.author = fileContent.match(/author\.\s+"(.*?)"/)[1];
				var name:String = fileContent.match(/name\.\s+"(.*?)"/)[1];
				var names:Array = name.split(',');
				npcData.id = names[0];
				npcData.name = names[1];
				var race:String = fileContent.match(/race\.\s+"(.*?)"/)[1];
				try {
					npcData.race = RACE.getItemAt(itemSearch(RACE.source, race));
				} catch (e:RangeError) {
					npcData.race = { label:race, value:race };
				}
				var npcClass:String = fileContent.match(/class\.\s+"(.*?)"/)[1];
				try {
					npcData.npcClass = CLASS.getItemAt(itemSearch(CLASS.source, npcClass));
				} catch (e:RangeError) {
					npcData.npcClass = { label:npcClass, value:npcClass };
				}
				var filter:String = fileContent.match(/filter\.\s+"(.*?)"/)[1];
				var filters:Array = filter.split('/');
				npcData.filter.source = filters.filter(function(item:String, index:int, array:Array):Boolean {
					return item != "";
				});
				npcData.level = Number(fileContent.match(/level\.\s+"(.*?)"/)[1]);
				npcData.relation = fileContent.match(/relation\.\s+"(.*?)"/)[1];
				npcData.sex = fileContent.match(/sex\.\s+"(.*?)"/)[1];
				npcData.fixLv = fileContent.match(/fixLv\.\s+"(.*?)"/)[1];
				npcData.rare = Number(fileContent.match(/rare\.\s+"(.*?)"/)[1]);
				npcData.spawnType = fileContent.match(/spawnType\.\s+"(.*?)"/)[1];
				npcData.aiCalm = fileContent.match(/aiCalm\.\s+"(.*?)"/)[1];
				npcData.aiMove = Number(fileContent.match(/aiMove\.\s+"(.*?)"/)[1]);
				npcData.aiDist = Number(fileContent.match(/aiDist\.\s+"(.*?)"/)[1]);
				var aiHeal:String = fileContent.match(/aiHeal\.\s+"(.*?)"/)[1];
				try {
					npcData.aiHeal = ACTION.getItemAt(itemSearch(ACTION.source, aiHeal));
				} catch (e:RangeError) {
					npcData.aiHeal = { label:aiHeal, value:aiHeal };
				}
				var aiAct:String = fileContent.match(/aiAct\.\s+"(.*?)"/)[1];
				var aiActs:Array = aiAct.split(',');
				try {
					npcData.aiAct1 = ACTION.getItemAt(itemSearch(ACTION.source, aiActs[0]));
				} catch (e:RangeError) {
					npcData.aiAct1 = { label:aiActs[0], value:aiActs[0] };
				}
				try {
					npcData.aiAct2 = ACTION.getItemAt(itemSearch(ACTION.source, aiActs[1]));
				} catch (e:RangeError) {
					npcData.aiAct2 = { label:aiActs[1], value:aiActs[1] };
				}
				try {
					npcData.aiAct3 = ACTION.getItemAt(itemSearch(ACTION.source, aiActs[2]));
				} catch (e:RangeError) {
					npcData.aiAct3 = { label:aiActs[2], value:aiActs[2] };
				}
				try {
					npcData.aiAct4 = ACTION.getItemAt(itemSearch(ACTION.source, aiActs[3]));
				} catch (e:RangeError) {
					npcData.aiAct4 = { label:aiActs[3], value:aiActs[3] };
				}
				try {
					npcData.aiAct5 = ACTION.getItemAt(itemSearch(ACTION.source, aiActs[4]));
				} catch (e:RangeError) {
					npcData.aiAct5 = { label:aiActs[4], value:aiActs[4] };
				}
				npcData.aiActSubFreq = Number(fileContent.match(/aiActSubFreq\.\s+"(.*?)"/)[1]);
				var aiActSub:String = fileContent.match(/aiActSub\.\s+"(.*?)"/)[1];
				var aiActSubs:Array = aiActSub.split(',');
				try {
					npcData.aiActSub1 = ACTION.getItemAt(itemSearch(ACTION.source, aiActSubs[0]));
				} catch (e:RangeError) {
					npcData.aiActSub1 = { label:aiActSubs[0], value:aiActSubs[0] };
				}
				try {
					npcData.aiActSub2 = ACTION.getItemAt(itemSearch(ACTION.source, aiActSubs[1]));
				} catch (e:RangeError) {
					npcData.aiActSub2 = { label:aiActSubs[1], value:aiActSubs[1] };
				}
				try {
					npcData.aiActSub3 = ACTION.getItemAt(itemSearch(ACTION.source, aiActSubs[2]));
				} catch (e:RangeError) {
					npcData.aiActSub3 = { label:aiActSubs[2], value:aiActSubs[2] };
				}
				try {
					npcData.aiActSub4 = ACTION.getItemAt(itemSearch(ACTION.source, aiActSubs[3]));
				} catch (e:RangeError) {
					npcData.aiActSub4 = { label:aiActSubs[3], value:aiActSubs[3] };
				}
				try {
					npcData.aiActSub5 = ACTION.getItemAt(itemSearch(ACTION.source, aiActSubs[4]));
				} catch (e:RangeError) {
					npcData.aiActSub5 = { label:aiActSubs[4], value:aiActSubs[4] };
				}
				var meleeElem:String = fileContent.match(/meleeElem\.\s+"(.*?)"/)[1];
				var meleeElems:Array = meleeElem.split(',');
				try {
					npcData.meleeElem = ELEMENT.getItemAt(itemSearch(ELEMENT.source, meleeElems[0]));
				} catch (e:RangeError) {
					npcData.meleeElem = { label:meleeElems[0], value:meleeElems[0] };
				}
				// 素手攻撃の強度
				npcData.meleeElemPow = Number(meleeElems[1]);
				// 耐性
				var resist:String = fileContent.match(/resist\.\s+"(.*?)"/)[1];
				if (resist) {
					var resists:Array = resist.split(',');
					npcData.regist.removeAll();
					for (var i:int = 0; i < resists.length; i++) {
						var e:Regist = new Regist();
						
						try {
							e.elem = ELEMENT.getItemAt(itemSearch(ELEMENT.source, resists[i]));
						} catch (error:RangeError) {
							e.elem = { label:resists[i], value:resists[i] };
						}
						
						i++
						
						try {
							e.pow = REGIST_POWER.getItemAt(itemSearch(REGIST_POWER.source, resists[i]));
						} catch (error:RangeError) {
							e.pow = { label:resists[i], value:resists[i] };
						}
						
						npcData.regist.addItem(e);
					}
				}
				// 補正
				var bitOn:String = fileContent.match(/bitOn\.\s+"(.*?)"/)[1];
				npcData.bitOn.source = bitOn.split(',');
				// 透過率
				npcData.transmissivity = Parser.parseTransmissivity(fileContent);
				// 影タイプ
				npcData.dropShadowType = Parser.parseDropShadowType(fileContent);
				// 地面からの浮き具合
				npcData.cSetPos = Parser.parseCSetPos(fileContent);
				// 自動飲食を禁止するかどうか
				npcData.noFoodOrDrink = Parser.parseNoFoodOrDrink(fileContent);
				// 吟遊詩人、清掃員、娼婦のいずれかとして行動するかどうか
				npcData.cnpcRole = Parser.parseCnpcRole(fileContent);
				// 会話イベント
				var txtEvent:Object = fileContent.match(/%txt_ucnpc_ev_b\r?\n(.*?)\r?\n%txt_ucnpc_ev_e/ms);
				npcData.txtEvent = null;
				if (txtEvent) {
					npcData.txtEvent = txtEvent[1];
				}
				// 会話時、台詞を順番に表示するか否か
				npcData.txtTalkOrder = fileContent.match(/^%txt_talk_order$/m) != null;
				// 台詞の抽出
				npcData.talk = Parser.parseTxt(fileContent);
			} 
			catch (err:Error) 
			{
				Alert.show("ファイルの内容が正しくありません。", "エラー");
			}
		}
		/**
		 * 配列内の要素の値と入力値を比較し、要素のインデックスを返却します。
		 * @param	array	検索対象の配列です。
		 * @param	value	検索する値です。
		 * @return	インデックスです。　該当する要素が無かった場合、-1です。
		 */
		protected function itemSearch(array:Array, value:Object):int {
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
		
		public function MainModel() 
		{
			
		}
		
		/**
		 * UIコントロールと定義クラスをバインドします。
		 * @param	event	イベントです。
		 */
		protected function binding(event:FlexEvent = null):void {
			// Function Closureではthisはrootを指すのでドキュメントへの参照を変数として定義
			var outerDocument:MainModel = this;
			// 作者をバインド
			bindInput(inAuthor, "author");
			// 英語名をバインド
			bindInput(inId, "id");
			// 日本語名をバインド
			bindInput(inName, "name");
			// 種族をバインド
			bindInput(inRace, "race");
			// 職業をバインド
			bindInput(inClass, "npcClass");
			// 属性をバインド
			bindInput(inMan, "filter");
			bindInput(inDragon, "filter");
			bindInput(inUndead, "filter");
			bindInput(inSlime, "filter");
			bindInput(inFire, "filter");
			bindInput(inSf, "filter");
			bindInput(inYeek, "filter");
			bindInput(inMino, "filter");
			bindInput(inWild, "filter");
			bindInput(inPawn, "filter");
			bindInput(inShopguard, "filter");
			bindInput(inRogue, "filter");
			bindInput(inCat, "filter");
			bindInput(inEther, "filter");
			bindInput(inHorse, "filter");
			npcData.filter.addEventListener(CollectionEvent.COLLECTION_CHANGE, function(e:CollectionEvent):void {
				// 入力コントロールの初期化
				for (var i:int = 0; i < inFilter.numElements; i++) {
					var element:IVisualElement = inFilter.getElementAt(i);
					if (element is CheckBox) {
						CheckBox(element).selected = false;
					}
				}
				// NPC設定クラスの値を入力コントロールの値に設定
				npcData.filter.source.forEach(function(e:String, index:int, array:Array):void {
					if (e == "" || e == "cnpc")  return;
					outerDocument["in" + e.substring(0, 1).toUpperCase() + e.substring(1)].selected = true;
				});
			});
			// レベルをバインド
			bindInput(inLevel, "level");
			// 関係をバインド
			bindInput(inRelation, "relation");
			// 性別をバインド
			bindInput(inSex, "sex");
			// 生成品質をバインド
			bindInput(inFixLv, "fixLv");
			// 生成頻度をバインド
			bindInput(inRare, "rare");
			// 生成条件をバインド
			bindInput(inSpawnType, "spawnType");
			// 待機時をバインド
			bindInput(inAiCalm, "aiCalm");
			// 移動確率をバインド
			bindInput(inAiMove, "aiMove");
			// 適正距離をバインド
			bindInput(inAiDist, "aiDist");
			// 瀕死時行動をバインド
			bindInput(inAiHeal, "aiHeal");
			// 基本行動をバインド
			bindInput(inAiAct1, "aiAct1");
			bindInput(inAiAct2, "aiAct2");
			bindInput(inAiAct3, "aiAct3");
			bindInput(inAiAct4, "aiAct4");
			bindInput(inAiAct5, "aiAct5");
			// 特殊行動確率をバインド
			bindInput(inAiActSubFreq, "aiActSubFreq");
			// 特殊行動をバインド
			bindInput(inAiActSub1, "aiActSub1");
			bindInput(inAiActSub2, "aiActSub2");
			bindInput(inAiActSub3, "aiActSub3");
			bindInput(inAiActSub4, "aiActSub4");
			bindInput(inAiActSub5, "aiActSub5");
			// 素手攻撃をバインド
			bindInput(inMeleeElem, "meleeElem");
			bindInput(inMeleeElemPow, "meleeElemPow");
			// 補正をバインド
			bindInput(inBit5, "bitOn", "inBit");
			bindInput(inBit6, "bitOn", "inBit");
			bindInput(inBit7, "bitOn", "inBit");
			bindInput(inBit8, "bitOn", "inBit");
			bindInput(inBit9, "bitOn", "inBit");
			bindInput(inBit10, "bitOn", "inBit");
			bindInput(inBit11, "bitOn", "inBit");
			bindInput(inBit12, "bitOn", "inBit");
			bindInput(inBit13, "bitOn", "inBit");
			bindInput(inBit14, "bitOn", "inBit");
			bindInput(inBit15, "bitOn", "inBit");
			bindInput(inBit16, "bitOn", "inBit");
			bindInput(inBit17, "bitOn", "inBit");
			bindInput(inBit18, "bitOn", "inBit");
			bindInput(inBit19, "bitOn", "inBit");
			bindInput(inBit20, "bitOn", "inBit");
			bindInput(inBit21, "bitOn", "inBit");
			bindInput(inBit22, "bitOn", "inBit");
			bindInput(inBit23, "bitOn", "inBit");
			bindInput(inBit24, "bitOn", "inBit");
			bindInput(inBit25, "bitOn", "inBit");
			bindInput(inBit26, "bitOn", "inBit");
			bindInput(inBit27, "bitOn", "inBit");
			bindInput(inBit28, "bitOn", "inBit");
			bindInput(inBit29, "bitOn", "inBit");
			bindInput(inBit30, "bitOn", "inBit");
			bindInput(inBit31, "bitOn", "inBit");
			npcData.bitOn.addEventListener(CollectionEvent.COLLECTION_CHANGE, function(e:CollectionEvent):void {
				// 入力コントロールの初期化
				for (var i:int = 0; i < inBit.numElements; i++) {
					var element:IVisualElement = inBit.getElementAt(i);
					if (element is CheckBox) {
						CheckBox(element).selected = false;
					}
				}
				npcData.bitOn.source.forEach(function(e:String, index:int, array:Array):void {
					if (e == "")  return;
					outerDocument["inBit" + e].selected = true;
				});
			});
			// 透過率をバインド
			bindInput(inTransmissivity, "transmissivity");
			// 影タイプ
			bindInput(inDropShadowType, "dropShadowType");
			// 地面からの浮き具合
			bindInput(inCSetPos, "cSetPos");
			// 自動飲食を禁止するかどうか
			bindInput(inNoFoodOrDrink, "noFoodOrDrink");
			// 吟遊詩人、清掃員、娼婦のいずれかとして行動するかどうか
			bindInput(inCnpcRole, "cnpcRole");
		}
		
		/**
		 * 入力コントロールの値とNPC設定クラスにバインドします。
		 * @param	source	入力可能なコントロール
		 * @param	property	バインドするNPC設定クラスのプロパティ
		 */
		protected function bindInput(source:*, property:String, suffix:String = "in"):void {
			if (source is TextInput) {
				source.addEventListener(TextOperationEvent.CHANGE, function(changeEvent:TextOperationEvent):void {
					npcData[property] = changeEvent.currentTarget.text;
				});
			} else if (source is ComboBox) {
				source.addEventListener(IndexChangeEvent.CHANGE, function(changeEvent:IndexChangeEvent):void {
					npcData[property] = changeEvent.currentTarget.selectedItem;
				});
			} else if (source is CheckBox) {
				source.addEventListener(Event.CHANGE, function(changeEvent:Event):void {
					var value:String = changeEvent.currentTarget.id.substring(suffix.length, suffix.length + 1).toLowerCase() + changeEvent.currentTarget.id.substring(suffix.length + 1);
					if (changeEvent.currentTarget.selected) {
						npcData[property].addItem(value);
					} else {
						npcData[property].removeItemAt(npcData[property].getItemIndex(value));
					}
				});
			} else if (source is NumericStepper) {
				source.addEventListener(Event.CHANGE, function(changeEvent:Event):void {
					npcData[property] = changeEvent.currentTarget.value;
				});
			} else if (source is RadioButtonGroup) {
				source.addEventListener(Event.CHANGE, function(changeEvent:Event):void {
					npcData[property] = changeEvent.currentTarget.selectedValue;
				});
			}
		}
		
		/**
		 * 書き出しコントロールのクリックイベントハンドラです。
		 * @param	clickEvent	イベントです。
		 */
		protected function inWriteClick(clickEvent:MouseEvent):void {
			// バリデーション
			if (npcData.author == null || npcData.id == null || npcData.name == null || npcData.race == null || npcData.npcClass == null) {
				Alert.show("必須項目が未入力です。", "警告");
				return;
			}
			
			npcFile = new File();
			try 
			{
				npcFile.browseForSave("ファイル名を入力してください");
				npcFile.addEventListener(Event.SELECT, save);
			} 
			catch (err:Error) 
			{
				Alert.show("ファイルの作成に失敗しました。", "エラー");
			}
		}
		
		/**
		 * ファイル保存の選択イベントハンドラです。
		 * @param	selectEvent	イベントです。
		 */
		protected function save(selectEvent:Event):void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("template.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			// 拡張子が無い場合は付与する
			if (npcFile.extension == null) npcFile.nativePath += ".txt";
			// ファイル書き出しを開始
			stream.open(npcFile, FileMode.WRITE);
			stream.writeMultiByte(StringUtil.substitute(fileContent,
				npcData.author,
				npcData.id,
				npcData.name,
				npcData.race.value,
				npcData.npcClass.value,
				npcData.filter.source.join('/'),
				npcData.level,
				npcData.relation,
				npcData.sex,
				npcData.fixLv,
				npcData.rare,
				npcData.spawnType,
				npcData.cnpcRole == ROLE.getItemAt(0) ? npcData.aiCalm : "5",
				npcData.aiMove,
				npcData.aiDist,
				npcData.aiHeal.value,
				npcData.aiAct1.value, npcData.aiAct2.value, npcData.aiAct3.value, npcData.aiAct4.value, npcData.aiAct5.value,
				npcData.aiActSubFreq,
				npcData.aiActSub1.value, npcData.aiActSub2.value, npcData.aiActSub3.value, npcData.aiActSub4.value, npcData.aiActSub5.value,
				npcData.meleeElem.value, npcData.meleeElemPow,
				npcData.regist.source.join(','),
				npcData.bitOn.source.join(','),
				npcData.transmissivity,
				npcData.dropShadowType,
				npcData.cSetPos,
				npcData.noFoodOrDrink,
				npcData.cnpcRole.value,
				Formatter.formatTxt(npcData.talk, npcData.txtTalkOrder, npcData.txtEvent)
			), "shift_jis");
			stream.close();
		}
	}
}