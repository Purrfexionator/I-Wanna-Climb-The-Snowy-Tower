/// @description Process timed function

if instance_exists(host) {
	delay = max(delay - 1, 0)
	if (delay == 0) {
		func();
		instance_destroy();
	}
} else instance_destroy();