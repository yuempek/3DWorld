package com 
{
	import org.papervision3d.Papervision3D;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class Polar3D
	{
		public var radius:Number;
		public var alpha:Number;
		public var tetha:Number;
		
		public function Polar3D(radius:Number = 0, alpha:Number = 0, tetha:Number = 0)
		{
			this.alpha = alpha;
			this.radius = radius;
			this.tetha = tetha;
		}
		
		public function toKartezyen3D():Kartezyen3D
		{
			var kartezyen3D:Kartezyen3D = new Kartezyen3D();
			var transform:Number = (Papervision3D.useDEGREES?Globals.toRadian:1);
			
			kartezyen3D.x = radius * Math.cos(Math.PI / 2 - alpha * transform) * Math.cos(Math.PI / 2 - tetha * transform);
			kartezyen3D.y = radius * Math.sin(Math.PI / 2 - alpha * transform);
			kartezyen3D.z = radius * Math.cos(Math.PI / 2 - alpha * transform) * Math.sin(Math.PI / 2 - tetha * transform);
			
			return kartezyen3D;
		}
		
	}

}