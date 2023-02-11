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

//The trigger signal this counter will send out when it hits zero.
trigger_id = "Example Trigger 2";

//The amount of times this counter must be activated before going off.
count = 5;
#endregion

/*
	This region contains all of the important variables and functions
	you might want to be aware of when using this object.
*/
#region Important Variables and Functions
//Determines whether or not this reciever is accepting signals.
active = true;
#endregion

/*
	Everything from this point forward is just additonal object setup 
	that you shouldnt' need to worry about too much.
*/

//Count down
on_trigger = function() {
	count --;
	if count == 0 {
		trigger(trigger_id);
		instance_destroy();
	}
}