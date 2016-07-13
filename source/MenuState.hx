package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	override public function create():Void
	{
		var t:FlxText;
		t = new FlxText(0, FlxG.height / 2 - 40, FlxG.width, "asteroids clone");
		t.setFormat(null, 32, FlxColor.WHITE, CENTER, OUTLINE);
		add(t);

		t = new FlxText(0, FlxG.height - 30, FlxG.width, "press space to play");
		t.setFormat(null, 16, FlxColor.WHITE, CENTER, OUTLINE);
		add(t);

		FlxG.mouse.visible = false;
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if(FlxG.keys.justReleased.SPACE){
			FlxG.switchState(new PlayState());
		}
		super.update(elapsed);
	}
}
