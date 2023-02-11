///@desc Trigger

if (place_meeting(x, y, oPlayer)) {
	
	trigger(trg_id)
	
	if (trg_snd != -1) {
		sfx_play_sound(trg_snd)
	}
	
	if (destroy) {
		instance_destroy()
	}
}