package com.world3d.world 
{
	import com.Globals;
	import com.world3d.listener.Place3DListenerManager;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.objects.primitives.Sphere;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class Place3D extends Sphere
	{
		
		
		private var listenerManager:Place3DListenerManager;
		
		
		private function settings():void
		{
			listenerSettings();
			materialSettings();
		}
		
		private function listenerSettings():void
		{
			listenerManager = new Place3DListenerManager(this);
		}
		
		private function materialSettings():void
		{
			var bmt:BitmapFileMaterial = new BitmapFileMaterial("./360__13_.jpg");
				bmt.doubleSided = true;
				bmt.interactive = true;
			
			this.material = bmt;
		}
		
		public function Place3D() 
		{	
			super(null, Globals.worldRadius, 40, 40);
			
			settings();
			
			Globals.place = this;
		}
		
		
	}

}