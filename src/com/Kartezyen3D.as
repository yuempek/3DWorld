package com 
{
	import org.papervision3d.Papervision3D;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class Kartezyen3D
	{
		public var x:Number;
		public var y:Number;
		public var z:Number;
		
		public function Kartezyen3D(x:Number = 0, y:Number = 0, z:Number = 0) 
		{
			this.x = x;
			this.y = y;
			this.z = z;
		}
		
		public function toPolar3D():Polar3D
		{
			var polar3d:Polar3D = new Polar3D();
			
			var xz:Number;
			
			xz = Math.sqrt(x * x + z * z);
			polar3d.alpha = Math.PI / 2 - Math.atan2(y, xz);
			polar3d.tetha = Math.PI / 2 - Math.atan2(z, x);
			polar3d.radius = Math.sqrt(x * x + y * y + z * z);
			
			if (Papervision3D.useDEGREES)
			{
				polar3d.alpha *= Globals.toDegree ;
				polar3d.tetha *= Globals.toDegree ;
			}
			
			return polar3d;
		}
		
	}

}