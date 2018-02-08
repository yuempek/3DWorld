package com.world3d 
{
	import com.Globals;
	import com.Kartezyen3D;
	import com.Mouse3DReferance;
	import com.Polar3D;
	import com.world3d.listener.ControlPointListenerManager;
	import com.world3d.movement.Rotation;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.core.math.NumberUV;
	import org.papervision3d.core.proto.MaterialObject3D;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.MovieMaterial;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Sphere;
	import org.papervision3d.Papervision3D;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	
	
	public class ControlPoint extends DragableObject3D
	{
		
		public var overMaterial:MaterialObject3D;
		public var outMaterial:MaterialObject3D;
		public var downMaterial:MaterialObject3D;
		public var upMaterial:MaterialObject3D;
		
		public var vertex:Vertex3D;
		
		private var vertexNumber:Number = 6;
		private var size:Number;
		private var coordinate:Polar3D;
		
		private var listenerManager:ControlPointListenerManager;
		
		public function ControlPoint(relatedVertex:Vertex3D, coordinate:Polar3D, size:Number = 8) 
		{
			super( outMaterial, new Array(), new Array(), null );
			
			if (!coordinate) coordinate = new Polar3D(900, 0, 0);
				
			this.size = size;
			this.coordinate = coordinate;
			this.vertex = relatedVertex;
			settings();
		}
		
		private function settings():void
		{
			createMaterials();
			createBody();
			setPosition();
			listenerSettings();
		}
		
		private function listenerSettings():void
		{
			listenerManager = new ControlPointListenerManager(this);
		}
		
		private function createMaterials():void
		{
			
			{//Out Material
				var pointMC:MovieClip = new MovieClip();
				
				pointMC.graphics.lineStyle(0, 0, 0);
				pointMC.graphics.beginFill(0x000000, 0);
				pointMC.graphics.drawRect(0, 0, 2 * size, 2 * size);
				pointMC.graphics.endFill();
				
				pointMC.graphics.lineStyle(1, 0x000000);
				pointMC.graphics.beginFill(0xFF0000, 1);
				pointMC.graphics.drawCircle(size, size, size * 0.35);
				pointMC.graphics.endFill();
				
				pointMC.height = 2 * size;
				pointMC.width = 2 * size;
				pointMC.buttonMode = true;
				
				this.outMaterial = new MovieMaterial(pointMC, true, true);
				this.outMaterial.interactive = true;
				this.outMaterial.doubleSided = true;
			}
			
			{//Over Material
				var pointMC:MovieClip = new MovieClip();
				
				pointMC.graphics.lineStyle(0, 0, 0);
				pointMC.graphics.beginFill(0x000000, 0);
				pointMC.graphics.drawRect(0, 0, 2 * size, 2 * size);
				pointMC.graphics.endFill();
				
				pointMC.graphics.lineStyle(3, 0x339933);
				pointMC.graphics.beginFill(0xC0C0C0, 0.5);
				pointMC.graphics.drawCircle(size, size, size * 0.50);
				pointMC.graphics.endFill();
				
				var filter:GlowFilter = new GlowFilter();
				filter.inner = false;
				filter.strength = 3;
				filter.color = 0xFF00FF;
				filter.blurX = 5;
				filter.blurY = 5;
				
				pointMC.filters.push(filter);
				
				pointMC.height = 2 * size;
				pointMC.width = 2 * size;
				pointMC.buttonMode = true;
				
				this.overMaterial = new MovieMaterial(pointMC, true, true);
				this.overMaterial.interactive = true;
				this.overMaterial.doubleSided = true;
			}
			
			{//Down Material
				/*
				var pointMC:MovieClip = new MovieClip();
				
				pointMC.graphics.lineStyle(0, 0, 0);
				pointMC.graphics.beginFill(0x000000, 0);
				pointMC.graphics.drawRect(0, 0, 2 * size, 2 * size);
				pointMC.graphics.endFill();
				
				pointMC.graphics.lineStyle(2, 0x909090);
				pointMC.graphics.beginFill(0xC0C0C0, 0.5);
				pointMC.graphics.drawCircle(size, size, size * 0.35);
				pointMC.graphics.endFill();
				
				pointMC.height = 2 * size;
				pointMC.width = 2 * size;
				pointMC.buttonMode = true;
				
				this.downMaterial = new MovieMaterial(pointMC, true, true);
				this.downMaterial.interactive = true;
				this.downMaterial.doubleSided = true;
				*/
				this.downMaterial = overMaterial;
			}
			
			{//Up Material
			/*
				var pointMC:MovieClip = new MovieClip();
				
				pointMC.graphics.lineStyle(0, 0, 0);
				pointMC.graphics.beginFill(0x00FF00, 0.5);
				pointMC.graphics.drawRect(0, 0, 2 * size, 2 * size);
				pointMC.graphics.endFill();
				
				pointMC.graphics.lineStyle(2, 0x909090);
				pointMC.graphics.beginFill(0xC0C0C0, 0.5);
				pointMC.graphics.drawCircle(size, size, size * 0.35);
				pointMC.graphics.endFill();
				
				pointMC.height = 2 * size;
				pointMC.width = 2 * size;
				pointMC.buttonMode = true;
				
				this.upMaterial = new MovieMaterial(pointMC, true, true);
				this.upMaterial.interactive = true;
				this.upMaterial.doubleSided = true;
				*/
				this.upMaterial = overMaterial;
			}
			
		}
		
		private function createBody():void 
		{
			
			var dX:Number = 0, dY:Number = coordinate.radius, dZ:Number = 0;
			var i:Number; 
			
			var aVertice:Array = this.geometry.vertices;
			var aFace:Array = this.geometry.faces;
			
			var aP1:Vertex3D, aP2:Vertex3D, aP3:Vertex3D;
			var aP1uv:NumberUV, aP2uv:NumberUV, aP3uv:NumberUV;
			var aU1:Number, aU2:Number, aU3:Number;
			var aV1:Number, aV2:Number, aV3:Number;
			
			var angle:Number =  2 * Math.PI / vertexNumber;
			var rz:Number, rx:Number, ry:Number;
			
			
			var matInstance:MaterialObject3D = this.outMaterial;
			
			
			aVertice.push(new Vertex3D(0 + dX, 0 + dY, 0 + dZ));
			
			for (i = 0; i < vertexNumber; i++) 
			{
				rz = size * Math.sin(i * angle);
				rx = size * Math.cos(i * angle);
				ry = 0;
				aVertice.push(new Vertex3D(rx + dX, ry + dY, rz + dZ));
			}
			
			for (i = 0; i < vertexNumber; i++) 
			{
				aP1 = aVertice[0];
				aP2 = aVertice[(i % vertexNumber) + 1];
				aP3 = aVertice[((i+1) % vertexNumber) + 1];
				
				aV1 = (aP1.x + size) / (2 * size);
				aV2 = (aP2.x + size) / (2 * size);
				aV3 = (aP3.x + size) / (2 * size);
				
				aU1 = (aP1.z + size) / (2 * size);
				aU2 = (aP2.z + size) / (2 * size);
				aU3 = (aP3.z + size) / (2 * size);
				
				aP1uv = new NumberUV(aU1, aV1);
				aP2uv = new NumberUV(aU2, aV2);
				aP3uv = new NumberUV(aU3, aV3);
				
				aFace.push( new Triangle3D(this, [aP1,aP2,aP3], matInstance, [aP1uv,aP2uv,aP3uv]) );
			}
			
			geometry.ready = true;
			setPosition();
		}
		
		private function setPosition():void
		{
			rotationX = coordinate.alpha;
			rotationY = coordinate.tetha;
		}
		
		public override function dragListener(e:MouseEvent):void 
		{
			var transform:Number = (Papervision3D.useDEGREES?Globals.toRadian:1);
			
			rotationX = mouse3DReferance.polar.alpha;
			rotationY = mouse3DReferance.polar.tetha;
			
			coordinate.alpha = rotationX;
			coordinate.tetha = rotationY;
			
			var newCoordinate:Kartezyen3D = this.coordinate.toKartezyen3D();
			vertex.x = newCoordinate.x;
			vertex.y = newCoordinate.y;
			vertex.z = newCoordinate.z;
		}
		
		
		
	}

}