package {
	import flash.display.*;
	import flash.events.Event;
	import com.nitoyon.as3query.*;
	import test.RoundRect;

	// Import 'Tweener' and force the class to be linked.
	import caurina.transitions.Tweener; Tweener;

	public class Box25withTweener extends Sprite {
		public function Box25withTweener() {
			$(stage).attr({
				scaleMode: "noScale", 
				align: "TL"
			});

			// create 25 boxes
			for(var i:int = 0; i < 25; i++) {
				$(RoundRect)   // $(ClassName) equals $(new ClassName())
					.attr({    // Set properties
						x: (i % 5) * 50,
						y: Math.floor(i / 5) * 50,
						width: 40,
						height: 40
					})
					.appendTo(this);
			}

			function animate(f:Boolean):void {
				// Select 'RoundRect' elements using CSS selector
				$("RoundRect:" + (f ? "odd" : "even"))
					.addTween({
						rotation: 90,
						scaleX: 0.5,
						scaleY: 0.5,
						time: 0.6,
						delay: 0.3,
						transition: "easeOutCubic"
					})
					.addTween({
						scaleX: 1,
						scaleY: 1,
						time: 0.5,
						delay: 0.9,
						transition: "easeOutElastic",
						onComplete: function():void {
							// restore the rotation and call again.
							this.rotation = 0;
							animate(!f);
						}
					});
			}
			animate(false);
		}
	}
}
