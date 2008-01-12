package test
{
	public class Circle extends Base
	{
		internal override function drawShape():void
		{
			graphics.drawEllipse(0, 0, width, height);
		}
	}
}

