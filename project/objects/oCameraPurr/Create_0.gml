///@desc Setup smooth camera

//Inherit the parent event
event_inherited();

/*
	This is a region of code that you can copy paste into the 
	instance creation code to make setting up objects easier.
	Also handy for create events of child objects.
*/
#region Creation Stub
/*The rate at which the camera interoplates to the player's position.
The closer the number is to 1, the "snappier" it will be. 
If you set the number to 1, it will behave identically to a follow camera.*/
pos_rate = (0.15 * global.fps_adjust);

/*The rate at which the camera zoom interpolates to its zoom value.
The closer the number is to 1, the quicker it will zoom. 
If you set the number to 1, the zoom will change instantly.*/
zoom_rate = (0.15 * global.fps_adjust);

/*Decides if the camera should be confined to the room even if it's
current bounds fall outside of it.*/
enforce_room_bounds = true;
#endregion

/*
	This region contains all of the important variables and functions
	you might want to be aware of when using this object.
*/
#region Important Variables and Functions
//Sets the bounds of the camera.
set_bounds = function(xmin, ymin, xmax, ymax) {
	self.xmin = xmin
	self.ymin = ymin;
	self.xmax = xmax;
	self.ymax = ymax;
}

//Locks the camera to a given position.
lock_bounds = function(lock_x, lock_y) {
	self.bounds_locked = true;
	x = lock_x;
	y = lock_y;
}

//Unlocks the camera position if it is locked.
unlock_bounds = function() {
	self.bounds_locked = false;
}

//Sets the camera zoom.
set_zoom = function(zoom) {
	self.current_zoom = zoom;
}

//Locks the camera to a given zoom.
lock_zoom = function(zoom) {
	self.zoom_locked = true;
	self.zoom = zoom
}

//Unlocks the camera zoom if it is locked.
unlock_zoom = function() {
	self.zoom_locked = false;	
}
#endregion

/*
	Everything from this point forward is just additonal object setup 
	that you shouldnt' need to worry about too much.
*/

//Camera Bounds
xmin = 0;
ymin = 0;
xmax = room_width;
ymax = room_height; 

//Camera Zoom
zoom = 1;
current_zoom = zoom;

//Camera Locking
bounds_locked = false;
zoom_locked = false;

//Camera Properties
cam_x = x;
cam_y = y;
cam_zoom = zoom;