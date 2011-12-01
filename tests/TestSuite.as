package  
{
	import suites.BasicFormatterTest;
	import suites.BasicModelTest;
	import suites.BasicParserTest;
	
	/**
	 * 全てのテストを実行します。
	 * @author Kazushi Tominaga (Seacolor)
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class TestSuite 
	{
		/**
		 * @private
		 */
		public var t1:BasicModelTest;
		/**
		 * @private
		 */
		public var t2:BasicParserTest;
		/**
		 * @private
		 */
		public var t3:BasicFormatterTest;
	}
	
}