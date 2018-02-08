package com.world3d.listener 
{
	import com.world3d.ControlPoint;
	import flash.geom.Point;
	import org.papervision3d.events.InteractiveScene3DEvent;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class ControlPointListenerManager
	{
		
		public var controlPoint:ControlPoint;
		
		public function ControlPointListenerManager(controlPoint:ControlPoint) 
		{
			this.controlPoint = controlPoint;
			
			controlPoint.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS, pointDown);
			controlPoint.addEventListener(InteractiveScene3DEvent.OBJECT_CLICK, pointUp);
			controlPoint.addEventListener(InteractiveScene3DEvent.OBJECT_OVER, pointOver);
			controlPoint.addEventListener(InteractiveScene3DEvent.OBJECT_OUT, pointOut);
		}
		
		private function pointDown(e:InteractiveScene3DEvent):void 
		{
			controlPoint.material = controlPoint.downMaterial;
		}
		
		private function pointUp(e:InteractiveScene3DEvent):void
		{
			//e.sprite.removeEventListener(MouseEvent.MOUSE_UP, mUp);
			controlPoint.material = controlPoint.upMaterial;
		}
		
		private function pointOver(e:InteractiveScene3DEvent):void
		{
			controlPoint.material = controlPoint.overMaterial;
		}
		
		private function pointOut(e:InteractiveScene3DEvent):void
		{
			controlPoint.material = controlPoint.outMaterial;
		}
		
		
	}

}