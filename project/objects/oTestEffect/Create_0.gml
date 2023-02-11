/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

add_animation_rate(EFFECT_MODULES.ANGLE, 2, 0);
add_animation(EFFECT_MODULES.XSCALE, 0, 1, 30, CURVE_ELASTIC_OUT, 0);
add_animation(EFFECT_MODULES.YSCALE, 0, 1, 30, CURVE_ELASTIC_OUT, 0);
add_animation_rate(EFFECT_MODULES.ALPHA, -0.05, 20);

hspeed = random_range(-2, 2);
vspeed = -3;
gravity = 0.2;

with instance_create_depth(x, y, depth + 1, oEffect)  {
	link(EFFECT_MODULES.X, other, true);
	link(EFFECT_MODULES.Y, other, true);
	link(EFFECT_MODULES.ANGLE, other, true);
	add_animation_rate(EFFECT_MODULES.XSCALE, 0.05, 0);
	add_animation_rate(EFFECT_MODULES.YSCALE, 0.05, 0);
	image_alpha = 0.7;
	add_animation_rate(EFFECT_MODULES.ALPHA, -0.02, 0);
}
