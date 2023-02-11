if active {
	cooldown --;
	if cooldown <= 0 {
		with instance_create_layer(x, y, "Instances_Below", oAvoidanceSpike) {
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
		cooldown = 120;
	}
}