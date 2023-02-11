///@desc Setup zoom

/*
	This is a region of code that you can copy paste into the 
	instance creation code to make setting up objects easier.
	Also handy for create events of child objects.
*/
#region Creation Stub
//The target object that this zoom area will check for.
target = oPlayer;

//The zoom amount of this zoom area.
zoom = 1;
#endregion

/*
	Everything from this point forward is just additonal object setup 
	that you shouldnt' need to worry about too much.
*/

//Checks if a given point is within this zoom area's bounds.
point_in_bounds = function(point_x, point_y) {
	return(point_x == clamp(point_x, bbox_left, bbox_right) && point_y == clamp(point_y, bbox_top, bbox_bottom))
}

//Returns the area of this zoom area.
get_area = function() {
	return (bbox_right - bbox_left) * (bbox_bottom - bbox_top);
}

//Applies this zoom area's zoom to the appropriate cameras.
apply_zoom = function() {
	with oCameraPurr
		if (target == other.target)
			set_zoom(other.zoom);
}

//Setup touch detection
touching = false;