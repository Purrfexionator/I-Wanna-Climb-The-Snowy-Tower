target = mangor;

thing = function(object) {
	with object {
		hspeed = random_range(-2, 2);
		vspeed = random_range(-2, -4);
		gravity = 0.2;
	}
}