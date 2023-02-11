///@desc Draw pause surface if paused

if (DEBUG) {
	draw_set_color(c_red)
	draw_set_font(0)
	draw_text(4, GAME_HEIGHT - string_height("W") - 4, debug_text)
	draw_set_color(c_white)
}

if (global.game_paused) {
	//Draw Screen
	//gpu_set_blendmode_ext(bm_one, bm_src_alpha);
	draw_sprite(pause_sprite, 0, 0, 0);
	//gpu_set_blendmode(bm_normal);
	
	//Draw Dim
	draw_set_color(c_black)
	draw_set_alpha(pause_dim)
	draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false)
	draw_set_color(c_white)
	draw_set_alpha(1.0)
	
	//Draw Text
	draw_text(0, 0, "DEATH: " + string(savedata_get_active("death")))
	draw_text(0, 16, "TIME: " + time_to_string(savedata_get_active("time") + 1))
	draw_text(0, 32, "VOLUME: " + string(round(global.setting[SETTING.VOLUME] * 100)) + "%")
	
	//Adjust Volume
	var heldUp = input_check("up");
	var heldDown = input_check("down");
	config_setting_set(SETTING.VOLUME, global.setting[SETTING.VOLUME] + 0.01 * (heldUp - heldDown))
	
	//Draw Paused
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_transformed(GAME_WIDTH / 2, GAME_HEIGHT / 2, "PAUSE", 1, 1, 0)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
} else if (!global.game_paused && sprite_exists(pause_sprite)) {
	sprite_delete(pause_sprite);
}