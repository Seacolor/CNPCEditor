package suites 
{
	import models.Formatter;
	import org.flexunit.asserts.assertEquals;
	
	/**
	 * ...
	 * @author Kazushi Tominaga (Seacolor)
	 */
	public class BasicFormatterTest 
	{
		[Test]
		public function manyNewLineCodeTest():void {
			var txts:Object = { "%txtCalm,JP": "test1\ntest2\ntest3\n\n\n"};
			assertEquals("%txtCalm,JP\r\ntest1\r\ntest2\r\ntest3\r\n\r\n\r\n", Formatter.formatTxt(txts, false, null));
		}
		
		[Test]
		public function newLineCodeTest():void {
			var txts:Object = { "%txtAggro,JP": "test4\n" };
			assertEquals("%txtAggro,JP\r\ntest4\r\n", Formatter.formatTxt(txts, false, null));
		}
		
		[Test]
		public function endOfNewLineCodeTest():void {
			var txts:Object = { "%txtDead,JP": "test5\ntest6\n" };
			assertEquals("%txtDead,JP\r\ntest5\r\ntest6\r\n", Formatter.formatTxt(txts, false, null));
		}
		
		[Test]
		public function nonNewLineCodeTest():void {
			var txts:Object = { "%txtKilled,JP": "test7" };
			assertEquals("%txtKilled,JP\r\ntest7", Formatter.formatTxt(txts, false, null));
		}
		
		[Test]
		public function separatorTest():void {
			var txts:Object = { "%txtCalm,JP": "test1\ntest2\ntest3\n\n\n", "%txtAggro,JP": "test4\n", "%txtDead,JP": "test5\ntest6\n", "%txtKilled,JP": "test7" };
			assertEquals("%txtCalm,JP\r\ntest1\r\ntest2\r\ntest3\r\n\r\n\r\n\r\n%txtAggro,JP\r\ntest4\r\n\r\n%txtDead,JP\r\ntest5\r\ntest6\r\n\r\n%txtKilled,JP\r\ntest7", Formatter.formatTxt(txts, false, null));
		}
	}

}