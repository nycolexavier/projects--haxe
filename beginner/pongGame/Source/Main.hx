package;

import haxe.ds.BalancedTree;
import haxe.rtti.CType.Platforms;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

class Main extends Sprite
{
	var inited:Bool;

	private var platform1:Platform;
	private var platform2:Platform;
	private var vall:Ball;

	/* ENTRY POINT */

	function resize(e) {
		if (!inited) init();
		// else (resize or orientation change)
	}

	function init() {
		if (inited) return;
		inited = true;

		platform1 = new Platforms();
		platform1.x = 5;
		platform2.y = 200;
		this.addChild(platform1);

		platform2 = new Platform();
		platform2.x = 480;
		platform2.y = 200;
		this.addChild(platform2);

		ball = new Ball();
		ball.x = 250;
		ball.y = 250;
		this.addChild(ball);
	}

	/* SETUP */
	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function name() {
		
	}
}
