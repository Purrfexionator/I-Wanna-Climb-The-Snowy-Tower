image_xscale = 0;
image_yscale = 0;
image_speed = 0;
add_bounce_behavior([oBlock, oPlatform]);

with instance_create_depth(x, y, depth + 2, oEffect) {
	sprite_index = other.sprite_index;
	image_speed = 0;
	add_animation(EFFECT_MODULES.XSCALE, 0, 2, 30, CURVE_CIRC_OUT, 0);
	add_animation(EFFECT_MODULES.YSCALE, 0, 2, 30, CURVE_CIRC_OUT, 0);
	add_animation_rate(EFFECT_MODULES.ALPHA, -0.05, 0);
}
count = 0;