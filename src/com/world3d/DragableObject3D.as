package com.world3d 
{
	import com.Globals;
	import com.Mouse3DReferance;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.proto.MaterialObject3D;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.objects.DisplayObject3D;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class DragableObject3D extends TriangleMesh3D
	{
		
		public var mouse3DReferance:Mouse3DReferance;
		
		public function DragableObject3D( material:MaterialObject3D, vertices:Array, faces:Array, name:String=null ) 
		{
			super (material, vertices, faces, name);
			
			this.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS, listenerMouseDown);
			this.addEventListener(InteractiveScene3DEvent.OBJECT_CLICK, listenerMouseUp);
			
			this.addEventListener(Event.ENTER_FRAME, tickListener);
		}
		
		private function resetListener(e:MouseEvent):void
		{
			Globals.world.scene.removeChild(mouse3DReferance);
			Globals.world.stage.removeEventListener(MouseEvent.MOUSE_UP, resetListener);
			Globals.world.stage.removeEventListener(MouseEvent.MOUSE_MOVE, dragListener);
		}
		
		private function listenerMouseDown(e:InteractiveScene3DEvent):void
		{
			mouse3DReferance = new Mouse3DReferance();
			
			Globals.world.scene.addChild(mouse3DReferance);
			Globals.world.stage.addEventListener(MouseEvent.MOUSE_UP, resetListener);
			Globals.world.stage.addEventListener(MouseEvent.MOUSE_MOVE, dragListener);
		}
		
		private function listenerMouseUp(e:InteractiveScene3DEvent):void
		{
			
		}
		
		/**
		 * Override function
		 * @return void
		 * @param	e 
		 */
		public function dragListener(e:MouseEvent):void {}
		
		public function tickListener(e:Event):void {}
	}

}