package
{
	import flash.display.*;
	import flash.text.*; TextField;
	import flash.events.*;
	import flash.utils.*;
	import test.Circle; Circle;
	import test.Circle2; Circle2;
	import com.nitoyon.as3query.*;
	
	public class Test extends Sprite
	{
		public function Test()
		{
			$(stage);

			for(var i:int = 0; i < 25; i++) {
				$(TextField)
					.text(i)
					.attr({
						x : (i % 5) * 20, 
						y : Math.floor(i / 5) * 20,
						selectable : false
					})
					.appendTo(this);
			}

			$("TextField:odd").hide();
			$(this).bind("click", function(event:*):void{
				$("TextField:odd").toggle();
			});

			var s1:Sprite = new Sprite();
			addChild(s1);
			s1.graphics.beginFill(0xffffff);
			s1.graphics.drawRect(0, 0, 100, 100);
			s1.graphics.endFill();
			s1.name = "s1";

			var s2:Sprite = new Sprite();
			addChild(s2);
			s2.graphics.beginFill(0xffffff);
			s2.graphics.drawRect(0, 0, 100, 100);
			s2.graphics.endFill();
			s2.name = "s2";

			var s3:Sprite = new Sprite();
			s3.graphics.beginFill(0xff0000);
			s3.graphics.drawRect(0, 0, 10, 10);
			s3.graphics.endFill();
			s3.name = "s3";
			
			$(s1).attr({alpha : 0.8, x : 30, y : 40});
			$(s2).attr({alpha : 0.5, x : 60, y : 50});
			$(s1).prepend(s3);
			$(new Circle()).appendTo(s1).attr({x : 20, y : 20});
			$(new Circle()).appendTo(s1).attr({x : 50, y : 50});

			$(<test.Circle><test.Circle2/><test.Circle2 x="20" y='20'/></test.Circle>)
				.attr({x : 20, y : 20})
				.appendTo(s1);

			$([s1, s2, s3])
				.filter(":nth-child(odd)")
					.attr("scaleX", 2);

			var t1:TextField = new TextField();
			var t2:TextField = new TextField();
			$([t1, t2]).appendTo(s1).text("hoge");
			$(t1).attr("y", 30);

			$(s2).one("click", function(event:Event):void {
				s1.x += 10;
				$(t1).remove();
			});

			$(stage);
			$("Circle2").hide();
		}
	}
}
