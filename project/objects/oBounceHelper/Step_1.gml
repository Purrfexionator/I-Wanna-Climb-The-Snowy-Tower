///@desc Process bouncing

if instance_exists(host) {
	for (var i = 0; i < array_length(bounce_objects); i ++) {
		var o = bounce_objects[i];
		with host {
			if place_meeting(x + hspeed, y, o) hspeed *= -1;
			if place_meeting(x, y + vspeed, o) vspeed *= -1;
		}
	}
} else instance_destroy();