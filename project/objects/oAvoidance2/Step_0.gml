image_xscale = lerp(image_xscale, 1.2, 0.2);
image_yscale = image_xscale;
image_angle = lerp(image_angle, 360, 0.2);

count --
if count <= 0 {
	with instance_create_depth(x, y, depth + 1, oAvoidanceCherry2)
		image_blend = other.image_blend;
	count = 20;
}