package {
	//######## IMPORTS ###################
	import com.ColorMaterialPalet;
	import com.Globals;
	import com.Mouse3DReferance;
	import com.world3d.ControlPoint;
	import com.world3d.movement.Rotation;
	import com.world3d.movement.Move;
	import com.world3d.world.World3D;
	import flash.system.System;
	
	import org.papervision3d.core.geom.TriangleMesh3D;
	
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.filters.ColorMatrixFilter;
	
	import org.papervision3d.core.math.Sphere3D;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Cylinder;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.geom.Point;
	
	import org.papervision3d.core.math.Matrix3D;
	import org.papervision3d.materials.ColorMaterial;	
	import org.papervision3d.cameras.CameraType;// FreeCamera3D;
	import org.papervision3d.core.geom.Lines3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.core.math.Plane3D;
	import org.papervision3d.core.math.Quaternion;
	import org.papervision3d.materials.BitmapAssetMaterial;
	import org.papervision3d.materials.BitmapMaterial;
	import org.papervision3d.materials.MovieAssetMaterial;
	import org.papervision3d.materials.MovieMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.materials.special.LineMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Plane;
	import org.papervision3d.objects.primitives.Sphere;
	import org.papervision3d.view.BasicView;
	import org.papervision3d.view.layer.ViewportLayer;
	import org.papervision3d.view.layer.util.ViewportLayerSortMode;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.core.proto.*
	

	
	[SWF(backgroundColor="0x000000", frameRate="30")]
	public class Main extends World3D
	{
	
		public function Main()
		{
			super();

		}
	}
	
}
