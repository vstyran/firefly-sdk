// =================================================================================================
//
//	in4ray Gaming SDK
//	Copyright 2013 in4ray. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package com.in4ray.gaming.core
{
	import com.in4ray.gaming.gp_internal;
	import com.in4ray.gaming.components.flash.GameApplication;
	import com.in4ray.gaming.consts.SystemType;
	
	import flash.desktop.NativeApplication;
	import flash.geom.Point;
	import flash.system.Capabilities;
	
	use namespace gp_internal;
	
	/**
	 * Global game properties. 
	 */	
	public class GameGlobals
	{
		/**
		 * @private 
		 */		
		gp_internal static function init(app:GameApplication):void
		{
			_gameApplication = app;
			
			var descriptor:XML = NativeApplication.nativeApplication.applicationDescriptor;
			var ns : Namespace = new Namespace(descriptor.namespace()); 
			
			_stageSize = new Point(app.stage.stageWidth, app.stage.stageHeight);
			
			if (Capabilities.version.indexOf('IOS') > -1)
				_systemType = SystemType.IOS;
			else if (Capabilities.version.indexOf('AND') > -1)
				_systemType = SystemType.ANDROID;
			
			var serverString:String = unescape(Capabilities.serverString);
			_dpi = Number(serverString.split("&DP=", 2)[1]);
			
			_defaultFrameRate = app.stage.frameRate;
		}
		
		/**
		 * @private 
		 */		
		gp_internal static var _gameApplication:GameApplication;
		
		/**
		 * Game entry point.  
		 */		
		public static function get gameApplication():GameApplication
		{
			return _gameApplication;
		}
		
		/**
		 * @private 
		 */	
		gp_internal static var _systemType:String = SystemType.UNDEFINED;
		
		/**
		 * Mobile system type, e.g. Android or IOS 
		 *
		 * @see com.in4ray.games.core.consts.SystemType 
		 */		
		public static function get systemType():String
		{
			return _systemType;
		}
		
		/**
		 * @private 
		 */	
		gp_internal static var _systemManager:SystemManager;
		
		/**
		 * System manager instance. 
		 */		
		public static function get systemManager():SystemManager
		{
			return _systemManager;
		}
		
		/**
		 * @private 
		 */	
		gp_internal static var _stageSize:Point;
		
		/**
		 * Size of flash stage. 
		 */		
		public static function get stageSize():Point
		{
			return _stageSize;
		}
		
		/**
		 * @private 
		 */	
		gp_internal static var _contentScaleFactor:Number = 1;
		
		/**
		 * Scale factor, used to scale textures if stage size exceeds maximum allowed texture size. 
		 */		
		public static function get contentScaleFactor():Number
		{
			return _contentScaleFactor;
		}
		
		/**
		 * @private 
		 */	
		gp_internal static var _dpi:Number = 160;
		
		/**
		 * Current device DPI. 
		 */		
		public static function get dpi():Number
		{
			return _dpi;
		}
		
		/**
		 * @private 
		 */	
		gp_internal static var _designDPI:Number = 160;
		
		/**
		 * DPI that was taken as base for designing textures. 
		 */		
		public static function get designDPI():Number
		{
			return _designDPI;
		}
		
		/**
		 * @private 
		 */	
		gp_internal static var _designSize:Point;
		
		/**
		 * Size that was taken as base for designing textures. 
		 */		
		public static function get designSize():Point
		{
			return _designSize;
		}
		
		/**
		 * @private 
		 */	
		gp_internal static var _defaultFrameRate:uint;
		
		/**
		 * Game frame rate.
		 */		
		public static function get defaultFrameRate():uint
		{
			return _defaultFrameRate;
		}
	}
}