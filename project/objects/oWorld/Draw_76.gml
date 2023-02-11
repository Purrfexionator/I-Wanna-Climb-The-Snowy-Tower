///@desc Pause surface & Smoothing

gpu_set_texfilter(false)

if (global.game_paused && !sprite_exists(pause_sprite))
	pause_sprite = sprite_create_from_surface(
		application_surface,
		0,
		0,
		GAME_WIDTH,
		GAME_HEIGHT,
		false,
		false,
		0,
		0);