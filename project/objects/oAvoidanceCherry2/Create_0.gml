image_xscale = 0.5;
image_yscale = image_xscale;

timer = function() {
	speed = 2;
	direction = random(360);
}

set_timed_function(timer, 50);