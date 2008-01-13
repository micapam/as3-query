package {
	import flash.display.*;
	import flash.events.Event;
	import com.nitoyon.as3query.*;
	import test.RoundRect;

	public class Box25 extends Sprite {
		public function Box25() {
			$(stage).attr({
				scaleMode: "noScale", 
				align: "TL",
				frameRate: 2
			});

			for(var i:int = 0; i < 25; i++) {
				$(RoundRect)
					.attr({
						x: (i % 5) * 50,
						y: Math.floor(i / 5) * 50,
						width: 40,
						height: 40
					})
					.appendTo(this);
			}

			$(stage).enterFrame(function(event:Event):void {
				$("RoundRect").attr("color", function(...args):uint {
					return Math.random() * 0xffffff;
				});
			});
		}
	}
}
