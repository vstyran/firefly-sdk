package model
{
	import com.in4ray.gaming.binding.BindableBoolean;
	import com.in4ray.gaming.core.SingletonLocator;
	import com.in4ray.gaming.model.Model;
	import com.in4ray.gaming.sound.Audio;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	
	public class GameModel extends Model
	{
		/**
		 * Constractor. 
		 */		
		public function GameModel()
		{
			super("LandscapeGameTemplate1");
		}
		
		/**
		 * Static function to get singleton model instance. 
		 */		
		public static function getInstance():GameModel
		{
			return SingletonLocator.getInstance(GameModel);			
		}
		
		private var _muteSounds:Boolean = false;
		
		/**
		 * Gat mute sounds value.
		 * default: false
		 */		
		public function get muteSounds():Boolean
		{
			return _muteSounds;
		}
		
		/**
		 * Set mute sounds value. 
		 */		
		public function set muteSounds(value:Boolean):void
		{
			_muteSounds = value;
			
			Audio.soundVolume.value = _muteSounds ? 0 : 1;
			
			var twen:Tween = new Tween(Audio.musicVolume, 1);
			twen.animate("value", _muteSounds ? 0 : 1);
			Starling.juggler.add(twen);
		}
		
		/**
		 * Pause - storable property. Equals 'true' during game otherwise equals 'false'.
		 */		
		public var pause:BindableBoolean = new BindableBoolean();
		
		/**
		 * @inheritDoc
		 */	
		override public function load(data:Object):void
		{
			muteSounds = data.muteSounds;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function save(data:Object):void
		{
			data.muteSounds = muteSounds;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function sleep(data:Object):void
		{
			save(data);
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function wakeUp(data:Object):void
		{
			load(data);
		}
	}
}