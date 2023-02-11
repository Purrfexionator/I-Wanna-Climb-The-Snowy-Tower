///@desc Setup platform properties

/*
	This is a region of code that you can copy paste into the 
	instance creation code to make setting up objects easier.
	Also handy for create events of child objects.
*/
#region Creation Stub
//Decides if the platform should be snapping.
can_snap = true;

/*Decides if the platform should stil drag the player 
even if they aren't standing directly on it.*/
can_drag = true;

//Decides if the platform should move the player at all.
can_move = true;

//Called when the player touches the platform.
on_touch = function() {
	//Function code goes here
}

//Called when the player jumps from the platform.
on_jump = function() {
	//Function code goes here
}
#endregion