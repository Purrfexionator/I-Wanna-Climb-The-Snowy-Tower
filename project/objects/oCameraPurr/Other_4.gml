///@desc Setup initial camera bounds

//Inherit the parent event
event_inherited();

//Set target object
var _target = instance_exists(target) ? target : oPlayerStart;

//Setup to find initial camera areas
var smallest;
var check_x = clamp(_target.x, 0, room_width);
var check_y = clamp(_target.y, 0, room_height);

//Find initial screen area
smallest = 0;
with oCameraScreen if point_in_bounds(check_x, check_y) {
	touching = true;
	if (get_area() < smallest || smallest == 0) {
		smallest = get_area();
		apply_bounds();
	}
}

//Find initial zoom area
smallest = 0;
with oCameraZoom if point_in_bounds(check_x, check_y) {
	touching = true;
	if (get_area() < smallest || smallest == 0) {
		smallest = get_area();
		apply_zoom();
	}
}

//Set initial zoom
if !zoom_locked zoom = current_zoom;

//Set margins
var xmargin = size.x * zoom / 2;
var ymargin = size.y * zoom / 2;

//Set initial position
if !bounds_locked {
	//Set clamp bounds
	var _xmin = xmin + xmargin;
	var _xmax = xmax - xmargin;
	var _ymin = ymin + ymargin;
	var _ymax = ymax - ymargin;
	
	//Enforce room bounds
	if enforce_room_bounds {
		_xmin = max(_xmin, xmargin);
		_xmax = min(_xmax, room_width - xmargin);
		_ymin = max(_ymin, ymargin);
		_ymax = min(_ymax, room_height - ymargin);
	}

	//Set x position
	if (_xmax - _xmin > 0)
		x = clamp(_target.x, _xmin, _xmax);
	else
		x = (_xmin + _xmax) / 2;
	
	//Set y position
	if (_ymax - _ymin > 0)
		y = clamp(_target.y, _ymin, _ymax);
	else
		y = (_ymin + _ymax) / 2;
}

//Update Camera
cam_x = x;
cam_y = y;
cam_zoom = zoom;