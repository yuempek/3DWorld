package com 
{
	import com.world3d.world.Place3D;
	import com.world3d.world.World3D;
	import org.papervision3d.cameras.Camera3D;
	/**
	$(CBI)* ...
	$(CBI)* @author yuempek
	$(CBI)*/
	public class Globals
	{
		public static var list:Array = new Array();
		
		public static var key_Ctrl:Boolean = false;
		public static var key_Alt:Boolean = false;
		public static var key_Shift:Boolean = false;
		
		
		public static var worldRadius:Number = 1000;
		
		public static var place:Place3D;
		public static var world:World3D;
		public static var camera:Camera3D;
		
		
		public static var toRadian:Number = Math.PI / 180;
		public static var toDegree:Number = 180 / Math.PI;
		
		public function Globals() 
		{
		}
		
		/**
		 * return Ctrl && Shift && Alt
		 */
		public static function get key_CSA():Boolean
		{
			return (key_Ctrl && key_Shift && key_Alt);
		}
		/**
		 * return Ctrl && Shift
		 */
		public static function get key_CS():Boolean
		{
			return (key_Ctrl && key_Shift);
		}
		/**
		 * return Ctrl && Alt
		 */
		public static function get key_CA():Boolean
		{
			return (key_Ctrl && key_Alt);
		}
		/**
		 * return Shift && Alt
		 */
		public static function get key_SA():Boolean
		{
			return (key_Shift && key_Alt);
		}
		
	}

}