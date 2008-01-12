package
{
	import flash.display.*;
	import flash.text.*; TextField;
	import flash.events.*;
	import flash.utils.*;
	import flash.filters.GlowFilter;
	import com.nitoyon.as3query.*;

	import test.Circle; Circle;
	import test.Rect; Rect;
	import test.RoundRect; RoundRect;
	import test.Polygon; Polygon;
	import test.Star; Star;

	public class CssSelectorDemo extends Sprite
	{
		public function CssSelectorDemo() {
			$(stage).attr({scaleMode: "noScale", align: "TL"});

			// construct children by XML
			$(xml).appendTo(this);

			// construct CSS Test List
			as3Query.each(cssTest, function(i:int, css:String):void {
				$(TextField)   // $(ClassName) == $(new ClassName())
					.attr({    // set attributes by Object
						text: css,
						width: Number($("#ex").attr("width")) - 1, 
						height: 20,
						x: 1,
						y: i * 20 + 1,
						selectable: false,
						backgroundColor: 0xaaaaff
					})
					.hover(    // hover event
						function(event:Event):void {
							this.background = true;
						},
						function(event:Event):void {
							this.background = false;
						}
					)
					.click(    // click event
						function(event:Event):void {
							$("#q").text(this.text);
							changeHandler(null);
						}
					)
					.appendTo($("#ex"));
			});

			// match filter
			$("TextField").bind("change", changeHandler);
			changeHandler(null);
		}

		private function changeHandler(event:Event):void {
			var f:GlowFilter = new GlowFilter();
			$("*").attr("filters", []);
			$($("#q").text()).not(":root").attr("filters", [f]);
		}

		// CSS Test List
		private var cssTest:Array = [
			"RoundRect", "Star[corner = 5]", "TextField[text $= t]", 
			"Rect", "Rect:empty", "Rect:parent", 
			"Rect Rect", "Rect * Rect", "Rect > Rect", "Rect + *", "Rect ~ *", 
			"Circle", "Circle:nth-child(3)", "Circle:last-child", 
			"Circle:nth(1)", "Circle:first", "Circle:even"
		];

		// View XML
		private var xml:XML = 
			<test.Rect width="400" height="410" x="10" y="10">
				<!--input space-->
				<flash.text.TextField 
					id="q" type="input"
					text="RoundRect"
					x="10" y="10" width="380" height="20" border="true"/>

				<!--shapes-->
				<test.Rect x="20"  y="50" width="100" height="100" color="0xcccccc">
					<test.Star x="10" y="10" width="30" height="30" color="0xccffcc" corner="12" ratio="0.8"/>
					<test.Rect x="60" y="10" width="30" height="30" color="0xcceedd"/>
					<test.Circle x="10" y="60" width="30" height="30" color="0xccddee"/>
					<test.Rect x="60" y="60" width="30" height="30" color="0xccccff"/>
				</test.Rect>
				<test.RoundRect x="140"  y="50" ellipseWidth="20" ellipseHeight="20" width="100" height="100" color="0xcccccc">
					<test.Rect x="10" y="10" width="30" height="30" color="0xffcccc"/>
					<test.Polygon x="60" y="10" width="30" height="30" color="0xeeddcc" corner="3"/>
					<test.Rect x="10" y="60" width="30" height="30" color="0xccffcc"/>
					<test.Circle x="60" y="60" width="30" height="30" color="0xddeecc"/>
				</test.RoundRect>
				<test.Rect  x="20" y="170" width="100" height="100" color="0xcccccc">
					<test.Star x="10" y="10" width="30" height="30" color="0xccffcc"/>
					<test.Rect x="60" y="10" width="30" height="30" color="0xcceedd"/>
					<test.Circle x="10" y="60" width="30" height="30" color="0xccddee"/>
					<test.Rect x="60" y="60" width="30" height="30" color="0xccccff"/>
				</test.Rect>
				<test.Rect x="140" y="170" width="100" height="100" color="0xcccccc">
					<test.Rect x="10" y="10" width="30" height="30" color="0xccffcc"/>
					<test.Star x="60" y="10" width="30" height="30" color="0xffeeee" corner="6" ratio="0.7"/>
					<test.Rect x="10" y="60" width="30" height="30" color="0xffccdd"/>
					<test.Polygon x="60" y="60" width="30" height="30" color="0xffccff" corner="5"/>
				</test.Rect>
				<test.RoundRect x="20"  y="290" ellipseWidth="20" ellipseHeight="20" width="100" height="100" color="0xcccccc">
					<test.Rect x="10" y="10" width="30" height="30" color="0xffcccc"/>
					<test.Polygon x="60" y="10" width="30" height="30" color="0xeeddcc" corner="3"/>
					<test.Rect x="10" y="60" width="30" height="30" color="0xccffcc"/>
					<test.Circle x="60" y="60" width="30" height="30" color="0xddeecc"/>
				</test.RoundRect>
				<test.RoundRect x="140" y="290" ellipseWidth="20" ellipseHeight="20" width="100" height="100" color="0xcccccc">
					<test.Circle x="10" y="10" width="30" height="30" color="0xccffcc"/>
					<test.Circle x="60" y="10" width="30" height="30" color="0xffeeee"/>
					<test.Circle x="10" y="60" width="30" height="30" color="0xffccdd"/>
					<test.Circle x="60" y="60" width="30" height="30" color="0xffccff"/>
				</test.RoundRect>

				<!--examples-->
				<test.Rect
					id="ex"
					x="280" y="50" width="100" height="340" color="0xeeeeff"/>
			</test.Rect>;
	}
}
