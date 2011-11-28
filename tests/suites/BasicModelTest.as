package suites 
{
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.array;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.collection.emptyArray;
	import org.hamcrest.collection.everyItem;
	import org.hamcrest.collection.hasItems;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;
	/**
	 * CNPCエディタ実装クラスの基本的なテストのスイートです。
	 * @author Kazushi Tominaga (Seacolor)
	 */
	public class BasicModelTest 
	{
		private var model:MainModel = new MainModel();
		
		[Test]
		/**
		 * コンストラクタの呼び出しでエラーが発生しない事のテストです。
		 */
		public function constructor():void {
			assertThat(model, notNullValue());
		}
	}
}