///@desc Set setting strings
setting[0] = global.setting[SETTING.FULLSCREEN] ? "on" : "off"
setting[1] = global.setting[SETTING.SMOOTHING] ? "on" : "off"
setting[2] = string(global.setting[SETTING.SCALE]) + "x"
//setting[3] = string(global.setting[SETTING.FRAMERATE])
setting[3] = string(round(global.setting[SETTING.VOLUME] * 100)) + "%"
//setting[5] = string(round(global.setting[SETTING.MUSIC] * 100)) + "%"
//setting[6] = string(round(global.setting[SETTING.SOUND] * 100)) + "%"
setting[4] = global.setting[SETTING.VSYNC] ? "on" : "off"
setting[5] = global.setting[SETTING.CONTROL_ROTATIONAL] ? "rotational" : "standard"
setting[6] = string(global.setting[SETTING.INPUT_DELAY])