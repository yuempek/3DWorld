package com.world3d.movement 
{
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.math.Number3D;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class Move
	{
		
		public function Move() 
		{
			
		}
		
		public static function moveTo(object:TriangleMesh3D, distance:Number3D):void {
			for each(var vrtx:Vertex3D in object.geometry.vertices){
				vrtx.x += distance.x;
				vrtx.y += distance.y;
				vrtx.z += distance.z;
			}
		}
		
		public static function moveX(object:TriangleMesh3D, distance:Number):void {
			moveTo(object, new Number3D(distance, 0, 0));
		}
		
		public static function moveY(object:TriangleMesh3D, distance:Number):void {
			moveTo(object, new Number3D(0, distance, 0));
		}
		
		public static function moveZ(object:TriangleMesh3D, distance:Number):void {
			moveTo(object, new Number3D(0, 0, distance));
		}
		
		
	}

}