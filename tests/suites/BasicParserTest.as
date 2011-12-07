package suites 
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import models.Parser;
	import org.flexunit.asserts.assertEquals;
	/**
	 * CNPCエディタ実装クラスの読み込みテストのスイートです。
	 * @author Kazushi Tominaga (Seacolor)
	 */
	public class BasicParserTest 
	{
		[Test]
		public function noTransmissivity():void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("miku1.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			assertEquals(0, Parser.parseTransmissivity(fileContent));
		}
		
		[Test]
		public function useTransmissivity():void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("miku2.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			assertEquals(100, Parser.parseTransmissivity(fileContent));
		}
		
		[Test]
		public function noDropShadowType():void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("miku1.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			assertEquals(0, Parser.parseDropShadowType(fileContent));
		}
		
		[Test]
		public function useDropShadowType():void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("miku2.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			assertEquals(40, Parser.parseDropShadowType(fileContent));
		}
		
		[Test]
		public function noCSetPos():void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("miku1.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			assertEquals(16, Parser.parseCSetPos(fileContent));
		}
		
		[Test]
		public function useCSetPos():void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("miku2.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			assertEquals(24, Parser.parseCSetPos(fileContent));
		}
		
		[Test]
		public function noNoFoodOrDrink():void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("miku1.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			assertEquals("0", Parser.parseNoFoodOrDrink(fileContent));
		}
		
		[Test]
		public function useNoFoodOrDrink():void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("miku2.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			assertEquals("1", Parser.parseNoFoodOrDrink(fileContent));
		}
		
		[Test]
		public function noCnpcRole():void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("miku1.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			assertEquals(MainModel.ROLE.getItemAt(0), Parser.parseCnpcRole(fileContent));
		}
		
		[Test]
		public function useCnpcRole():void {
			var stream:FileStream = new FileStream();
			// 書き出しテンプレートファイルの読み込み
			stream.open(File.applicationDirectory.resolvePath("miku2.txt"), FileMode.READ);
			var fileContent:String = stream.readMultiByte(stream.bytesAvailable, "shift_jis");
			stream.close();
			assertEquals(MainModel.ROLE.getItemAt(3), Parser.parseCnpcRole(fileContent));
		}
		
	}

}