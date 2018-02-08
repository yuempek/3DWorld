package com.world3d.listener 
{
	import com.Globals;
	import com.world3d.world.World3D;
	import flash.ui.Keyboard;
	import org.papervision3d.events.InteractiveScene3DEvent;
	
	import flash.geom.Point;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	
	public class World3DListenerManager
	{
		
		public var world:World3D;
		

		
		public var isDragging:Boolean = false;
		
		public function World3DListenerManager(world:World3D) 
		{
			this.world = world;
			
			world.stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseroll);
			world.stage.addEventListener(KeyboardEvent.KEY_DOWN, keydown);
			world.stage.addEventListener(KeyboardEvent.KEY_UP, keyup);
		}
		
		
		public function keydown(event:KeyboardEvent):void
		{
			if (event.ctrlKey)
				Globals.key_Ctrl = true;
			if (event.altKey)
				Globals.key_Alt = true;
			if (event.shiftKey)
				Globals.key_Shift = true;	
		}
		
		public function keyup(event:KeyboardEvent):void
		{
			if (!event.ctrlKey)
				Globals.key_Ctrl = false;
			if (!event.altKey)
				Globals.key_Alt = false;
			if (!event.shiftKey)
				Globals.key_Shift = false;	
			if (event.keyCode == Keyboard.LEFT)
				;//previousMeterial();
			if (event.keyCode == Keyboard.RIGHT)
				;//nextMeterial();
				
		}
		
		public function mouseroll(e:MouseEvent):void {
				
			if (e.delta > 0) {
				
				if (Globals.key_CSA)
											{  world.camera.z += 10;
				trace("");return;}
				
				if (Globals.key_CS)			
											{  world.camera.fov = 90;
				trace("");return;}
				
				if (Globals.key_CA)				
											{
				trace("");return;}
				
				if (Globals.key_SA)			
											{  
				trace("");return;}
				
				if (Globals.key_Ctrl)								
											{  world.camera.focus *= 2;
				trace("");return;}
				
				if (Globals.key_Shift)								
											{  world.camera.fov *= 1.1;
				trace("");return;}
				
											   world.camera.zoom *= 1.1;
				
			}
			else {
				
				if (Globals.key_CSA)
											{  world.camera.z -= 10;
				trace("");return;}
				
				if (Globals.key_CS) 			
											{  world.camera.fov = 20;
				trace("");return;}                   
				
				if (Globals.key_CA)				
											{
				trace("");return;}                   
				
				if (Globals.key_SA)			
											{  
				trace("");return;}
				
				if (Globals.key_Ctrl)								
											{  world.camera.focus /= 2;
				trace("");return;}
				
				if (Globals.key_Shift)								
											{  world.camera.fov -= 5;
				trace("");return;}
				
											   world.camera.zoom /= 1.1;
				
			}
		}
	
		
	}

}