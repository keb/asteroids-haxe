package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.util.FlxPool;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class Bullet extends FlxSprite
{
	public var timer:FlxTimer;

	public function new(X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);
		makeGraphic(8,2, FlxColor.WHITE);
		width = 10;
		height = 10;
		offset.set(-1,-4); //sets position of bulletspawn to center of ship
		exists = false;
		timer = new FlxTimer();
	}

	override public function update(elapsed:Float):Void
	{
		FlxSpriteUtil.screenWrap(this);
		super.update(elapsed);
	}
}