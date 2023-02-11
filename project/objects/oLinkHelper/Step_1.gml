/// @description Link instance

if instance_exists(host) {
	if instance_exists(target) {
		//Find target position
		var targetx = target.x + xoffset;
		var targety = target.y + yoffset;
		
		//Apply precision
		if precise {
			targetx = round(targetx);
			targety = round(targety);
		}
		
		//Set speed
		host.hspeed = (targetx - host.x);
		host.vspeed = (targety - host.y);
	} else if destroy
		instance_destroy(host);
	else {
		//Stop if not set to destroy
		host.hspeed = 0;
		host.vspeed = 0;
	}
} else instance_destroy();