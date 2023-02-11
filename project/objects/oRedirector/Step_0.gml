/// @description Redirect objects

with target {
	var within_xdist = (abs(x - other.x) <= abs(hspeed));
	var within_ydist = (abs(y - other.y) <= abs(vspeed));
	var is_redirected = (hspeed == other.hsend && vspeed == other.vsend);
	if (within_xdist && within_ydist && !is_redirected) {
		x = other.x;
		y = other.y;
		hspeed = other.hsend;
		vspeed = other.vsend;
	}
}