if place_meeting(x, y, oPlayer) {
	trigger(trigger_id);
	with instance_create_depth(x, y, depth, oEffect) {
		sprite_index = other.sprite_index
		lifetime = -1;
		add_animation(EFFECT_MODULES.ALPHA, 1, 0.5, 15, CURVE_LINEAR);
		add_animation(EFFECT_MODULES.ANGLE, 0, 360, 20, CURVE_QUART_OUT);
		add_animation(EFFECT_MODULES.XSCALE, 1, 0.7, 20, CURVE_QUART_OUT);
		add_animation(EFFECT_MODULES.YSCALE, 1, 0.7, 20, CURVE_QUART_OUT);
	}
	with instance_create_depth(x, y, depth + 1, oEffect) {
		sprite_index = other.sprite_index
		add_animation(EFFECT_MODULES.ALPHA, 1, 0, 25, CURVE_QUART_OUT);
		add_animation(EFFECT_MODULES.XSCALE, 0.5, 1.5, 20, CURVE_QUART_OUT);
		add_animation(EFFECT_MODULES.YSCALE, 0.5, 1.5, 20, CURVE_QUART_OUT);
	}
	sfx_play_sound(sndTrigger);
	instance_destroy();
}