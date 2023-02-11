///@desc Setup screen bounds

/*
	This is a region of code that you can copy paste into the 
	instance creation code to make setting up objects easier.
	Also handy for create events of child objects.
*/
#region Creation Stub
//The target object that this screen area will check for.
target = oPlayer;

/*The left bound of the screen area.
Defaults to the left edge of the object.*/
xmin = bbox_left;

/*The right bound of the screen area.
Defaults to the right edge of the object.*/
xmax = bbox_right;

/*The top bound of the screen area.
Defaults to the top edge of the object.*/
ymin = bbox_top;

/*The bottom bound of the screen area.
Defaults to the bottom edge of the object.*/
ymax = bbox_bottom;
#endregion

/*
	Everything from this point forward is just additonal object setup 
	that you shouldnt' need to worry about too much.
*/

//Checks if a given point is within this screen area's bounds.
point_in_bounds = function(point_x, point_y) {
	return(point_x == clamp(point_x, bbox_left, bbox_right) && point_y == clamp(point_y, bbox_top, bbox_bottom))
}

//Returns the area of this screen area.
get_area = function() {
	return (bbox_right - bbox_left) * (bbox_bottom - bbox_top);
}

//Applies this screen area's bounds to the appropriate cameras.
apply_bounds = function() {
	with oCameraPurr
		if (target == other.target)
			set_bounds(other.xmin, other.ymin, other.xmax, other.ymax);
}

//Setup touch detection
touching = false;