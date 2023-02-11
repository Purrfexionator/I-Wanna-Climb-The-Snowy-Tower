///@desc Setup counter

//Inherit the parent event
event_inherited();

/*
	This is a region of code that you can copy paste into the 
	instance creation code to make setting up objects easier.
	Also handy for create events of child objects.
*/
#region Creation Stub
//The trigger signal that activates this reciever.
reciever_id = "Example Trigger 1";

//The trigger signal this timer will send out when it goes off.
trigger_id = "Example Trigger 2";

//The length of this timer, in frames.
length = 50 * global.fps_adjust;
#endregion

/*
	This region contains all of the important variables and functions
	you might want to be aware of when using this object.
*/
#region Important Variables and Functions
//Determines whether or not this reciever is accepting signals.
active = true;

//Stops the timer.
stop = function() {
	count = 0;
	can_trigger = false;
}
#endregion

/*
	Everything from this point forward is just additonal object setup 
	that you shouldnt' need to worry about too much.
*/

//Setup timer
count = 0;
can_trigger = false;

//Activate timer
on_trigger = function() {
	count = length;
	can_trigger = true;
}