package com.world3d 
{
	import com.Globals;
	import com.Kartezyen3D;
	import com.Polar3D;
	import com.world3d.movement.Move;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.objects.primitives.Plane;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class Label3D extends Plane
	{
		
		public function Label3D() 
		{
			var bmt:BitmapFileMaterial = new BitmapFileMaterial("./reklam.jpg");
				bmt.doubleSided = true;
				bmt.interactive = true;
				
			super(bmt, 200, 150);
			Move.moveZ(this, 800);
			labelConstructer();
		}
		
		private function labelConstructer():void
		{
			var vertex:Vertex3D;
			for each(vertex in this.geometry.vertices)
			{	
				var polar:Polar3D = new Kartezyen3D(vertex.x, vertex.y, vertex.z).toPolar3D();
				polar.radius *= 0.9;
				Globals.world.scene.addChild(new ControlPoint(vertex, polar));
			}
		}
		
	}

}