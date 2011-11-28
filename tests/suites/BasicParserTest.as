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
		
	}

}