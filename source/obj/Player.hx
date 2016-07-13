package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.util.FlxPool;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;
import haxe.Timer;

class Player extends FlxSprite
{

	public function new() 
	{
		//super calls class extended's constructor; in this case, FlxSprite
		super( Math.floor(FlxG.width / 2), Math.floor(FlxG.height / 2) );
		loadGraphic("assets/images/ship.png");
		centerOffsets();
	}
	
	override public function update(elapsed:Float):Void 
	{
		angularVelocity = 0;
		if(FlxG.keys.anyPressed([A, LEFT])){
			angularVelocity -= 240;
		}
		if(FlxG.keys.anyPressed([D, RIGHT])){
			angularVelocity += 240;
		}

		//default .set for FlxPoints is 0,0
		acceleration.set(0,0);
		if(FlxG.keys.anyPressed([W, UP])){
			acceleration.set(90,0);
			acceleration.rotate(FlxPoint.weak(0,0), angle); //angle is the angle of this FlxSprite
		}

		if(FlxG.keys.justPressed.Z){
			var bullet:Bullet = PlayState.bullets.recycle();
			bullet.reset(x + (width - bullet.width) / 2, y + (height - bullet.height) / 2);
			bullet.angle = angle;

			bullet.velocity.set(150, 0);
			bullet.velocity.rotate(FlxPoint.weak(0,0), bullet.angle);

			//just speeds up bullets
			bullet.velocity.x *= 2;
			bullet.velocity.y *= 2;

			//time death of bullet to 5 seconds
			// bullet.timer.start(
			// 	2.0, 
			// 	function(Timer:FlxTimer){
			// 		bullet.exists = false;
			// 	},
			// 	1
			// );
		}

		FlxSpriteUtil.screenWrap(this);
		super.update(elapsed);
	}
}