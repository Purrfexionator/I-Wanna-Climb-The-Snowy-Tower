///@desc Set camera position

//Set camera zoom
if !zoom_locked zoom = current_zoom;

//Set margins
var xmargin = size.x * zoom / 2;
var ymargin = size.y * zoom / 2;

//Set camera position 
if !bounds_locked && instance_exists(target) {
	//Set clamp bounds
	var _xmin = xmin + xmargin;
	var _xmax = xmax - xmargin;
	var _ymin = ymin + ymargin;
	var _ymax = ymax - ymargin;
	
	//Enforce room bounds
	if enforce_room_bounds {
		_xmin = clamp(_xmin, xmargin, room_width - xmargin);
		_xmax = clamp(_xmax, xmargin, room_width - xmargin);
		_ymin = clamp(_ymin, ymargin, room_height - ymargin);
		_ymax = clamp(_ymax, ymargin, room_height - ymargin);
	}

	//Set x position
	if (_xmax - _xmin > 0)
		x = clamp(target.x, _xmin, _xmax);
	else
		x = round((_xmin + _xmax) / 2);
	
	//Set y position
	if (_ymax - _ymin > 0)
		y = clamp(target.y, _ymin, _ymax);
	else
		y = round((_ymin + _ymax) / 2);
}

//Interpolate camera properties
cam_x = lerp(cam_x, x, pos_rate);
cam_y = lerp(cam_y, y, pos_rate);
cam_zoom = lerp(cam_zoom, zoom, zoom_rate);

//Skip camera code if not active
if !active exit;

//Set camera margins
var cam_xmargin = size.x * cam_zoom / 2;
var cam_ymargin = size.y * cam_zoom / 2;

//Confine camera to room bounds
if enforce_room_bounds {
	//Set clamp bounds
	var cam_xmin = cam_xmargin;
	var cam_xmax = room_width - cam_xmargin;
	var cam_ymin = cam_ymargin;
	var cam_ymax = room_height - cam_ymargin;
	
	//Set x position
	if (cam_xmax - cam_xmin > 0)
		cam_x = clamp(cam_x, cam_xmin, cam_xmax);
	else
		cam_x = (cam_xmin + cam_xmax) / 2;
	
	//Set y position
	if (cam_ymax - cam_ymin > 0)
		cam_y = clamp(cam_y, cam_ymin, cam_ymax);
	else
		cam_y = (cam_ymin + cam_ymax) / 2;
}

//Update Camera
camera_set_view_pos(camera, cam_x - cam_xmargin, cam_y - cam_ymargin);
camera_set_view_size(camera, size.x * cam_zoom, size.y * cam_zoom);