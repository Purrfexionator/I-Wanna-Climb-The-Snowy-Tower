image_xscale = lerp(image_xscale, 0.6, 0.2);
image_yscale = image_xscale;
image_angle = lerp(image_angle, 360, 0.2);

count --
if count <= 0 {
	with instance_launch_depth_dir(random_range(0.5, 1.5), random(360), depth + 2, oAvoidanceCherry) {
		image_blend = choose(c_red, c_white);
		image_xscale = random_range(0.2, 0.6);
		image_yscale = image_xscale;
	}
	count = irandom_range(4, 7);
}