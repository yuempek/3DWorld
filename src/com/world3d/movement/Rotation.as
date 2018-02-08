package com.world3d.movement 
{
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.math.Matrix3D;
	import org.papervision3d.Papervision3D;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class Rotation
	{
		private static var toDEGREES 	:Number = 180/Math.PI;
		private static var toRADIANS 	:Number = Math.PI/180;
		
		
		public function Rotation() 
		{
			
		}
		
		public static function stableRotationX(object:TriangleMesh3D, angle:Number):void {
			angle = Papervision3D.useDEGREES? angle * toRADIANS : angle;
				
			for each(var vrtx:Vertex3D in object.geometry.vertices){
				
				var mtrx:Matrix3D = Matrix3D.translationMatrix(vrtx.x, vrtx.y, vrtx.z);
				mtrx.calculateMultiply4x4(Matrix3D.rotationX(angle), mtrx);
				vrtx.x = mtrx.n14;
				vrtx.y = mtrx.n24;
				vrtx.z = mtrx.n34;
			}
		}
		
		public static function stableRotationY(object:TriangleMesh3D, angle:Number):void {
			angle = Papervision3D.useDEGREES? angle * toRADIANS : angle;
				
			for each(var vrtx:Vertex3D in object.geometry.vertices){
				
				var mtrx:Matrix3D = Matrix3D.translationMatrix(vrtx.x, vrtx.y, vrtx.z);
				mtrx.calculateMultiply4x4(Matrix3D.rotationY(angle), mtrx);
				vrtx.x = mtrx.n14;
				vrtx.y = mtrx.n24;
				vrtx.z = mtrx.n34;
				
			}
		}
		
		public static function stableRotationZ(object:TriangleMesh3D, angle:Number):void {
			angle = Papervision3D.useDEGREES? angle * toRADIANS : angle;
			
			for each(var vrtx:Vertex3D in object.geometry.vertices){
					
				var mtrx:Matrix3D = Matrix3D.translationMatrix(vrtx.x, vrtx.y, vrtx.z);
				mtrx.calculateMultiply4x4(Matrix3D.rotationZ(angle), mtrx);
				vrtx.x = mtrx.n14;
				vrtx.y = mtrx.n24;
				vrtx.z = mtrx.n34;
			}
		}
		
		
	}

}