package test
{
	public class Star extends Base
	{
		private var _corner:int = 5;
		public function get corner():int{return _corner;}
		public function set corner(value:int):void
		{
			_corner = value;
			draw();
		}

		private var _ratio:Number = 0.5;
		public function get ratio():Number{return _ratio;}
		public function set ratio(value:Number):void
		{
			_ratio = value;
			draw();
		}

		internal override function drawShape():void
		{
			graphics.moveTo(width / 2, 0);
			for(var i:int = 0; i < corner; i++)
			{
				var rad:Number = Math.PI / corner * (2 * i + 1);
				graphics.lineTo(width  / 2 * (1 + Math.sin(rad) * ratio), 
				                height / 2 * (1 - Math.cos(rad) * ratio));
				rad = Math.PI / corner * (2 * i + 2);
				graphics.lineTo(width  / 2 * (1 + Math.sin(rad)), 
				                height / 2 * (1 - Math.cos(rad)));
			}
		}
	}
}

