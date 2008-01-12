package test
{
	public class Polygon extends Base
	{
		private var _corner:int = 3;
		public function get corner():int{return _corner;}
		public function set corner(value:int):void
		{
			_corner = value;
			draw();
		}

		internal override function drawShape():void
		{
			graphics.moveTo(width / 2, 0);
			for(var i:int = 1; i < corner; i++)
			{
				var rad:Number = 2 * Math.PI / corner * i;
				graphics.lineTo(width  / 2 * (1 + Math.sin(rad)), 
				                height / 2 * (1 - Math.cos(rad)));
			}
		}
	}
}

