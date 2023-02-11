///@desc Setup cycler

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

//The list of trigger signals that this reciever will cycle through when activated.
trigger_list = ["Example Trigger 1", "Example Trigger 2", "Example Trigger 3"];
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

//Setup cycling
cycle_index = 0;

//Cycle through signals
on_trigger = function() {
	trigger(trigger_list[cycle_index]);
	cycle_index = (cycle_index + 1) % array_length(trigger_list);
}