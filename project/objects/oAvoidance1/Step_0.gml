if active {
	cooldown --;
	if cooldown <= 0 {
		var _x = random_range(bbox_left, bbox_right);
		with instance_create_layer(_x, y, "Instances_Below", oAvoidanceCherry) {
			hspeed = random_range(-0.3, 0.3);
			vspeed = 2.5;
			image_xscale = 0.6;
			image_yscale = 0.6;
			image_blend = choose(c_red, c_white);
			depth ++;
		}
		cooldown = irandom_range(8, 9);
	}
}