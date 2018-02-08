package com.world3d.world
{
	import com.Globals;
	import com.Polar3D;
	import com.world3d.ControlPoint;
	import com.world3d.Label3D;
	import com.world3d.listener.World3DListenerManager;
	import flash.display.Sprite;
	import flash.geom.Point;
	import org.papervision3d.cameras.CameraType;
	import org.papervision3d.view.BasicView;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class World3D extends BasicView
	{
		[SWF(backgroundColor = "0x000000", frameRate = "30")]
		
		
		public var view:BasicView;
		
		public var isDragging:Boolean = false;
		
		public var sounds:Array;
		public var labels:Array;
		
		private var listenerManager:World3DListenerManager;
		
		private function settings():void
		{
			viewport.interactive = true;
			globalsSettings();
			cameraSettings();
			stageSettings();
			listenerSettings();
		}
		
		private function globalsSettings():void
		{
			Globals.camera = this.cameraAsCamera3D;
			Globals.world = this;
		}
		
		private function cameraSettings():void
		{
			cameraAsCamera3D.zoom = 36;
			//cameraAsCamera3D.focus = 500;
			//cameraAsCamera3D.fov = 100;
			
			cameraAsCamera3D.x = 0;
			cameraAsCamera3D.y = 0;
			cameraAsCamera3D.z = 0;
		}
		
		private function stageSettings():void
		{
			stage.quality = "medium";
			stage.scaleMode = "noScale";
			stage.align = "tl";
		}
		
		private function listenerSettings():void
		{
			listenerManager = new World3DListenerManager(this);
		}
		
		public function World3D() 
		{
			super(800, 600, false, true, CameraType.FREE);
			
			settings();
			
			startRendering();
			
			createPlace();
			
		}
		
		private function createPlace():void
		{
			this.scene.addChild(new Place3D());
			this.scene.addChild(new Label3D());
			//this.scene.addChild(new ControlPoint(new Polar3D(300, 90, 0), 8));
			
		}
		
	}

}