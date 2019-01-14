

import openfl.display.Sprite;
import openfl.Assets;


class Main extends Sprite {


	public function new () {

		super ();

		var ab = Assets.getMovieClip ("ab:B");
		addChild (ab);

	}

}
