///@desc Save

animation_counter = max(animation_counter - 1, 0)

if (instance_exists(oPlayer) &&
	(place_meeting(x, y, oBullet) ||
	(place_meeting(x, y, oPlayer) && input_check_pressed("shoot")))) {
	
	savedata_save_player()

	if (animation_counter == 0) {
		animation_counter = animation_length
		with instance_create_depth(x, y, depth, oEffect) {
			sprite_index = sCustomSaveEffect
			lifetime = 100;
			add_animation(EFFECT_MODULES.XSCALE, 0, 1, 35, CURVE_ELASTIC_OUT);
			add_animation(EFFECT_MODULES.YSCALE, 0, 1, 35, CURVE_ELASTIC_OUT);
			add_animation_rate(EFFECT_MODULES.ALPHA, -0.1, 50);
		}
		sfx_play_sound(sndSave);
	}
}

image_index = sign(animation_counter)