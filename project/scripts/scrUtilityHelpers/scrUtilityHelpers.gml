/*
	Utility functions that use helper objects
*/

///@func link_to_instance(inst, [destroy=true], [precise=true])
///@desc Can be used to link the positions of two instances
///@arg {real} inst						The instance to link to
///@arg {boolean} [destroy=true]		Decides if instance destruction should be linked
///@arg {boolean} [precise=true]		Decides if link position should be rounded
function link_to_instance(inst, destroy = true, precise = true) {
	with instance_create_depth(x, y, depth, oLinkHelper) {
		host = other;
		target = inst;
		xoffset = host.x - target.x;
		yoffset = host.y - target.y;
		self.destroy = destroy;
		self.precise = precise;
	}
}

///@func unlink_from_instance()
///@desc Unlinks an instance from whatever it is linked to
function unlink_from_instance() {
	with oLinkHelper if (host == other) instance_destroy();	
}

///@func set_timed_function(func, delay)
///@desc Triggers an object's given function after a set delay
///@arg {function} func		The function to trigger
///@arg {real} delay		The delay to trigger the function after, in frames
function set_timed_function(func, delay) {
	with instance_create_depth(x, y, depth, oTimedHelper) {
		host = other;
		self.func = func;
		self.delay = delay;
	}
}

///@func cancel_timed_function(func)
///@desc Cancels an object's timed function
///@arg {function} func		The function to cancel
function cancel_timed_function(func) {
	with oTimedHelper if (host == other && self.func == func) instance_destroy();
}

///@func move_set_xpos(xpos, duration, [curve=CURVE_LINEAR])
///@desc Moves to the given x position over a set duration using a specified curve
///@arg {real} xpos						The x position to travel to
///@arg {real} duration					The duration of travel, in frames
///@arg {real} [curve=CURVE_LINEAR]		The animation curve to travel with
function move_set_xpos(xpos, duration, curve = CURVE_LINEAR) {
	with instance_create_depth(x, y, depth, oXMoveHelper) {
		host = other;
		self.startpos = other.x;
		self.endpos = xpos;
		self.rate = 1 / duration;
		self.curve = curve;
	}
}

///@func move_set_ypos(ypos, duration, [curve=CURVE_LINEAR])
///@desc Moves to the given y position over a set duration using a specified curve
///@arg {real} ypos						The y position to travel to
///@arg {real} duration					The duration of travel, in frames
///@arg {real} [curve=CURVE_LINEAR]		The animation curve to travel with
function move_set_ypos(ypos, duration, curve = CURVE_LINEAR) {
	with instance_create_depth(x, y, depth, oYMoveHelper) {
		host = other;
		self.startpos = other.y;
		self.endpos = ypos;
		self.rate = 1 / duration;
		self.curve = curve;
	}
}

///@func move_set_position(xpos, ypos, duration, [curve=CURVE_LINEAR])
///@desc Moves to the given position over a set duration using a specified curve
///@arg {real} xpos						The x position to travel to
///@arg {real} ypos						The y position to travel to
///@arg {real} duration					The duration of travel, in frames
///@arg {real} [curve=CURVE_LINEAR]		The animation curve to travel with
function move_set_position(xpos, ypos, duration, curve = CURVE_LINEAR) {
	move_set_xpos(xpos, duration, curve);
	move_set_ypos(ypos, duration, curve);
}

///@func move_set_xdist(xdist, duration, [curve=CURVE_LINEAR])
///@desc Moves by the given x distance over a set duration using a specified curve
///@arg {real} xdist					The x distance to travel by
///@arg {real} duration					The duration of travel, in frames
///@arg {real} [curve=CURVE_LINEAR]		The animation curve to travel with
function move_set_xdist(xdist, duration, curve = CURVE_LINEAR) {
	move_set_xpos(x + xdist, duration, curve);
}

///@func move_set_ydist(ydist, duration, [curve=CURVE_LINEAR])
///@desc Moves by the given y distance over a set duration using a specified curve
///@arg {real} ydist					The y distance to travel by
///@arg {real} duration					The duration of travel, in frames
///@arg {real} [curve=CURVE_LINEAR]		The animation curve to travel with
function move_set_ydist(ydist, duration, curve = CURVE_LINEAR) {
	move_set_ypos(y + ydist, duration, curve);
}

///@func move_set_distance(xdist, ydist, duration, [curve=CURVE_LINEAR])
///@desc Moves by the given x and y distance over a set duration using a specified curve
///@arg {real} xdist					The x distance to travel by
///@arg {real} ydist					The y distance to travel by
///@arg {real} duration					The duration of travel, in frames
///@arg {real} [curve=CURVE_LINEAR]		The animation curve to travel with
function move_set_distance(xdist, ydist, duration, curve = CURVE_LINEAR) {
	move_set_xdist(xdist, duration, curve);
	move_set_ydist(ydist, duration, curve);
}

///@func move_set_distance_dir(dist, dir, duration, [curve=CURVE_LINEAR])
///@desc Moves a given distance in a given direction over a set duration using a specified curve
///@arg {real} dist						The distance to travel by
///@arg {real} dir						The direction to travel in
///@arg {real} duration					The duration of travel, in frames
///@arg {real} [curve=CURVE_LINEAR]		The animation curve to travel with
function move_set_distance_dir(dist, dir, duration, curve = CURVE_LINEAR) {
	var xdist = lengthdir_x(dist, dir);
	var ydist = lengthdir_y(dist, dir);
	move_set_distance(xdist, ydist, duration, curve);
}

///@func move_cancel_x()
///@desc Cancels an object's set x movement functions
function move_cancel_x() {
	with oXMoveHelper if (host == other) instance_destroy();	
}

///@func move_cancel_y()
///@desc Cancels an object's set y movement functions
function move_cancel_y() {
	with oYMoveHelper if (host == other) instance_destroy();	
}

///@func move_cancel()
///@desc Cancels an objects set movement functions
function move_cancel() {
	move_cancel_x();
	move_cancel_y();
}

///@func add_bounce_behavior([bounce_objects=[oBlock]])
///@desc Adds bouncing behavior to an object
///@arg {array} [bounce_objects=[oBlock]]		Objects that this object should bounce off of
function add_bounce_behavior(bounce_objects = [oBlock]) {
	with instance_create_depth(x, y, depth, oBounceHelper) {
		host = other;
		self.bounce_objects = bounce_objects;
	}
}

///@func remove_bounce_behavior()
///@desc Removes bouncing behavior from an object
function remove_bounce_behavior() {
	with oBounceHelper if (host == other) instance_destroy();	
}