///@desc Setup reciever

//Inherit the parent event
event_inherited();

/*
	This is a region of code that you can copy paste into the 
	instance creation code to make setting up objects easier.
	Also handy for create events of child objects.
*/
#region Creation Stub
//The trigger signal that activates this reciever.
reciever_id = "Example Trigger";

/*The instance that this reciever will apply its code to.
By default it will apply the code to itself.*/
target = self;

//Decides whether or not this reciever will destroy itself after activation.
destroy = false;

/*Decides whether or not this reciever will destroy itself if 
it's target doesn't exist. Normally you would want this on, but 
there are a few cases where you might not. (ex. target is an
object that isn't guranteed to exist at all times)*/
destroy_with_target = true;

//The code to apply to the target when this reciever is activated.
trigger_code = function() {
	with target {
		//Function code goes here	
	}
}
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

//Activate trigger
on_trigger = function() {
	trigger_code()
	if destroy instance_destroy();
}