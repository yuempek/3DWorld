package com.world3d.listener 
{
	import com.Globals;
	import com.world3d.world.Place3D;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import org.papervision3d.events.InteractiveScene3DEvent;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class Place3DListenerManager
	{
		
		public var place:Place3D;
		
		private var currentPoint:Point;
		private var previusPoint:Point;
		
		public function Place3DListenerManager(place:Place3D) 
		{
			this.place = place;
			
			place.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS, downOnPlace);
			place.addEventListener(InteractiveScene3DEvent.OBJECT_CLICK, upOnPlace);
		}
		
		public function downOnPlace(event:InteractiveScene3DEvent):void
		{	
			Globals.world.stage.addEventListener(MouseEvent.MOUSE_MOVE, moveOnPlace);
			Globals.world.stage.addEventListener(MouseEvent.MOUSE_UP, eventReset);	
			
			previusPoint = new Point(Globals.world.stage.mouseX, Globals.world.stage.mouseY);
		}
		
		public function upOnPlace(event:InteractiveScene3DEvent):void 
		{
		}
		
		public function eventReset(event:MouseEvent):void
		{
			Globals.world.stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveOnPlace);
			Globals.world.stage.removeEventListener(MouseEvent.MOUSE_UP, eventReset);			
		}
		
		public function moveOnPlace(event:MouseEvent):void
		{
			
			var mass:Number = 10;
			
			currentPoint = new Point(Globals.world.stage.mouseX, Globals.world.stage.mouseY);
				
			var tetax:Number = (currentPoint.x - previusPoint.x) / 5 / mass;
			var tetay:Number = (currentPoint.y - previusPoint.y) / 5 / mass;
			
			Globals.camera.rotationX += tetay;
			Globals.camera.rotationY += tetax;
			
			previusPoint.x += (currentPoint.x - previusPoint.x)/mass;
			previusPoint.y += (currentPoint.y - previusPoint.y)/mass;
			
		}
	}

}