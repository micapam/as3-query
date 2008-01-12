package test
{
	public class Rect extends Base
	{
		internal override function drawShape():void
		{
			graphics.drawRect(0, 0, width, height);
		}
	}
}

