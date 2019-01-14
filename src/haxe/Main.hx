

import openfl.display.Sprite;
import openfl.Assets;


class Main extends Sprite {


	public function new () {

		super ();

		var ab = Assets.getMovieClip ("main-ab:B");
		addChild (ab);

		var a_b = Assets.getMovieClip ("main-a-b:B");
		a_b.y = 100;
		addChild (a_b);

	}

}
