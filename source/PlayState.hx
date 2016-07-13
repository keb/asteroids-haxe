package;

// import flixel.addons.display.FlxStarField.FlxStarField2D;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	private var _player:Player;
	public static var bullets:FlxTypedGroup<Bullet>;

	override public function create():Void
	{
		_player = new Player();
		add(_player);

		var numBullets:Int = 3;
		var bullet:Bullet;
		bullets = new FlxTypedGroup<Bullet>(numBullets);
		for (i in 0...numBullets){
			bullet = new Bullet(-100, -100);
			bullets.add(bullet);
		}
		add(bullets);
		
		FlxG.mouse.visible = false;
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.pressed.R)
		{
			FlxG.resetState();
		}
		super.update(elapsed);
	}
}
