///@desc Navigate Menu

if (button_changing != -1) {
	
	button_changing_countdown -= f2sec(1)
	
	if button_changing_countdown <= 0 {
		button_changing = -1
	}
	
	if (button_changing == INPUT_DEVICE.KEYBOARD && keyboard_lastkey != 0) {
		button_changing = -1
		
		input_mapping_change(keyboard_mapping[option_index], keyboard_lastkey, INPUT_DEVICE.KEYBOARD)
		get_keyboard_button_strings()
		
		var buttonWidth
		buttonWidth = string_length(keyboard[option_index]) * font_width
		keyboard_width_max = keyboard_width_max < buttonWidth ? buttonWidth : keyboard_width_max
	} else if (button_changing == INPUT_DEVICE.GAMEPAD && gamepad_button_get_any_pressed()) {
		button_changing = -1
		
		input_mapping_change(gamepad_mapping[option_index], gamepad_button_get_any_pressed(), INPUT_DEVICE.GAMEPAD)
		get_gamepad_button_strings()
		
		var buttonWidth
		buttonWidth = string_length(gamepad[option_index]) * font_width
		gamepad_width_max = gamepad_width_max < buttonWidth ? buttonWidth : gamepad_width_max
	}
} else {
	
	// Navigate menu
	var buttonUp, buttonDown
	buttonUp = input_check_pressed("up")
	buttonDown = input_check_pressed("down")
	
	if (buttonUp || buttonDown) {
		option_index = option_index + buttonDown - buttonUp
		
		if (option_index < 0) {
			option_index = option_number[menu_index] - 1
		} else if (option_index >= option_number[menu_index]) {
			option_index = 0
		}
		
		if (menu_index == MENU_SUB_SAVE) {
			savedata_set_index(option_index)
			savedata_read()
			event_user(0)
		}
	}
	
	if (input_check_pressed("jump")) {
		switch (menu_index) {
			case MENU_SUB_MAIN:
			switch (option_index) {
				case 0: // save select
				menu_index = MENU_SUB_SAVE
				option_index = 0
				savedata_set_index(option_index)
				savedata_read()
				event_user(0)
				break
				
				case 1: // settings
				menu_index = MENU_SUB_SETTINGS
				option_index = 0
				break
				
				case 2: // keyboard
				menu_index = MENU_SUB_KEYBOARD
				option_index = 0
				break
				
				case 3: // gamepad
				menu_index = MENU_SUB_GAMEPAD
				option_index = 0
				break
				
				case 4: // quit
				game_end()
				break
			}
			break
			
			case MENU_SUB_SAVE:
			savedata_set_index(option_index)
			
			var saveExists = savedata_exists()
			
			menu_index = MENU_SUB_START
			option_index = saveExists ? 0 : 1
			option_color[MENU_SUB_START,0] = saveExists ? c_white : c_gray
			break
			
			case MENU_SUB_START:
			switch (option_index) {
				case 0: // continue
				if (savedata_exists())
					savedata_load()
				break
				
				case 1: // new game
				if (!savedata_exists()) {
					savedata_new_game()
				} else {
					menu_index = MENU_SUB_OVERWRITE
					option_index = 0
				}
				break
			}
			break
			
			case MENU_SUB_OVERWRITE: // overwrite save data?
			switch (option_index) {
				case 0: // no
				menu_index = MENU_SUB_START
				option_index = 0
				break
				
				case 1: // yes
				savedata_new_game()
				break
			}
			break
			
			case MENU_SUB_SETTINGS:
			switch (option_index) {
				case 0: // toggle fullscreen
				config_setting_set(SETTING.FULLSCREEN, !global.setting[SETTING.FULLSCREEN])
				break
				
				case 1: // toggle smoothing
				config_setting_set(SETTING.SMOOTHING, !global.setting[SETTING.SMOOTHING])
				break
				
				/*case 3: // small adjustments to framerate
				config_setting_set(SETTING.FRAMERATE, min(global.setting[SETTING.FRAMERATE] + 1, fps_max))
				break*/
				
				case 4: // toggle vsync
				config_setting_set(SETTING.VSYNC, !global.setting[SETTING.VSYNC])
				break
				
				case 5: // gravity rotation preference
				config_setting_set(SETTING.CONTROL_ROTATIONAL, !global.setting[SETTING.CONTROL_ROTATIONAL])
				break
				
				case 7: // restore default settings
				config_setting_set_default()
				break
			}
			
			event_user(1)
			
			break
			
			case MENU_SUB_KEYBOARD:
			switch (option_index) {
				case 0:
				case 1:
				case 2:
				case 3:
				case 4:
				case 5:
				case 6:
				case 7:
				case 8:
				case 9:
				button_changing = INPUT_DEVICE.KEYBOARD
				button_changing_countdown = button_changing_length
				keyboard_lastkey = 0
				break
				
				case 10: // restore default keyboard configuration
				input_set_defaults(INPUT_DEVICE.KEYBOARD)
				get_keyboard_button_strings()
				break
			}
			break
			
			case MENU_SUB_GAMEPAD:
			switch (option_index) {
				case 0:
				case 1:
				case 2:
				case 3:
				case 4:
				case 5:
				case 6:
				case 7:
				case 8:
				case 9:
				button_changing = INPUT_DEVICE.GAMEPAD
				button_changing_countdown = button_changing_length
				break
				
				case 10: // restore default gamepad configuration
				input_set_defaults(INPUT_DEVICE.GAMEPAD)
				get_gamepad_button_strings()
				break
			}
		}
	}
	
	if (input_check_pressed("shoot")) {
		switch (menu_index) {
			case MENU_SUB_SAVE: // return to main menu from save select
			menu_index = MENU_SUB_MAIN
			option_index = 0
			break
			
			case MENU_SUB_START: // return to save select from game start
			menu_index = MENU_SUB_SAVE
			option_index = savedata_get_index()
			break
			
			case MENU_SUB_OVERWRITE: // return to game start from save overwrite warning
			menu_index = MENU_SUB_START
			option_index = 0
			break
			
			case MENU_SUB_SETTINGS: // return to main menu from settings
			menu_index = MENU_SUB_MAIN
			option_index = 1
			break
			
			case MENU_SUB_KEYBOARD: // return to main menu from keyboard configuration
			menu_index = MENU_SUB_MAIN
			input_mappings_save(INPUT_DEVICE.KEYBOARD)
			option_index = 2
			break
			
			case MENU_SUB_GAMEPAD:
			menu_index = MENU_SUB_MAIN
			input_mappings_save(INPUT_DEVICE.GAMEPAD)
			option_index = 3
			break
		}
	}
	
	var buttonLeft, buttonRight
	buttonRight = input_check_pressed("right")
	buttonLeft = input_check_pressed("left")
	
	if (buttonLeft || buttonRight) {
		if (menu_index == MENU_SUB_SETTINGS) {
			switch (option_index) {
				case 2: // set scale
				config_setting_set(SETTING.SCALE, clamp(global.setting[SETTING.SCALE] + (buttonRight - buttonLeft) / 2, 1, setting_scale_max))
				setting[2] = string(global.setting[SETTING.SCALE]) + "x"
				break
				
				/*case 3: // set framerate
				var _newFramerate = clamp(floor((global.setting[SETTING.FRAMERATE] + fps_change*(buttonRight - buttonLeft))/fps_change)*fps_change, fps_min, fps_max)
				config_setting_set(SETTING.FRAMERATE, _newFramerate)
				setting[SETTING.FRAMERATE] = string(global.setting[SETTING.FRAMERATE])
				break*/
				
				case 6: // set input delay severity
				config_setting_set(SETTING.INPUT_DELAY, clamp(global.setting[SETTING.INPUT_DELAY] + buttonRight - buttonLeft, input_delay_min, input_delay_max))
				setting[6] = string(global.setting[SETTING.INPUT_DELAY])
				break
			}
		} else if (menu_index == MENU_SUB_GAMEPAD) {
			if (option_index == 11) {
				global.gamepad_slot = wrap(global.gamepad_slot + buttonRight - buttonLeft, 0, 11)
				gamepad[11] = string(global.gamepad_slot)
			}
		}
	}
	
	var heldLeft, heldRight
	heldRight = input_check("right");
	heldLeft = input_check("left");
	
	if (heldLeft || heldRight) {
		if (menu_index == MENU_SUB_SETTINGS) {
			switch (option_index) {
				case 3: // set master volume
				config_setting_set(SETTING.VOLUME, global.setting[SETTING.VOLUME] + setting_master_change * (heldRight - heldLeft))
				setting[3] = string(round(global.setting[SETTING.VOLUME] * 100)) + "%"
				break

				/*case 5: // set music volume
				config_setting_set(SETTING.MUSIC, global.setting[SETTING.MUSIC] + setting_music_change * (heldRight - heldLeft))
				setting[SETTING.MUSIC] = string(round(global.setting[SETTING.MUSIC] * 100)) + "%"
				break*/
				
				/*case 6: // set sound effect volume
				config_setting_set(SETTING.SOUND, global.setting[SETTING.SOUND] + setting_sound_change * (heldRight - heldLeft))
				setting[SETTING.SOUND] = string(round(global.setting[SETTING.SOUND] * 100)) + "%"
				break*/
			}
		}
	}
}