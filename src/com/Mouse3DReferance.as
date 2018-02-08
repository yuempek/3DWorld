package com 
{
	import flash.display.MovieClip;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.MovieMaterial;
	import org.papervision3d.objects.primitives.Sphere;
	import org.papervision3d.Papervision3D;
	import org.papervision3d.scenes.Scene3D;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class Mouse3DReferance extends Sphere
	{
		public var polar:Polar3D;
		
		private var radius:Number = 100;
		
		
		private function settings():void
		{
			materialSettings();
			listenerSettings();
			variableSttings();
		}
		
		private function variableSttings():void
		{
			polar = new Polar3D(radius, 0, 0);
		}
		
		private function listenerSettings():void
		{
			addEventListener(InteractiveScene3DEvent.OBJECT_MOVE, mouseMove);
		}
		
		private function materialSettings():void
		{
			var mc:MovieClip = new MovieClip();
				mc.graphics.beginFill(0, 0.0);
				mc.graphics.drawRect(0, 0, 2*Math.PI, Math.PI);
				mc.graphics.endFill();
			
			var mcMat:MovieMaterial = new MovieMaterial(mc, true);
				mcMat.doubleSided = true;
				mcMat.interactive = true;
			
			material = mcMat;
		}
		
		public function Mouse3DReferance() 
		{
			super(null, radius, 30, 10);
			settings();
		}
		
		private function mouseMove(e:InteractiveScene3DEvent):void 
		{
			polar.alpha =  e.y;
			polar.tetha =  -e.x + Math.PI / 2;
			
			if (Papervision3D.useDEGREES)
			{
				polar.alpha *= Globals.toDegree ;
				polar.tetha *= Globals.toDegree ;
			}
		}
		
		public function get kartezyen():Kartezyen3D 
		{
			return polar.toKartezyen3D();
		}
		
	}

}