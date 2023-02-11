#region Creation Stub
//The trigger signal that activates this reciever.
reciever_id = "s5_chase";

/*The instance that this reciever will apply its code to.
By default it will apply the code to itself.*/
target = oChaseCherry;

//Decides whether or not this reciever will destroy itself after activation.
destroy = false;

/*Decides whether or not this reciever will destroy itself if 
it's target doesn't exist. Normally you would want this on, but 
there are a few cases where you might not. (ex. target is an
object that isn't guranteed to exist at all times)*/
destroy_with_target = false;

//The code to apply to the target when this reciever is activated.
trigger_code = function() {
	with target {
		if place_meeting(x, y, other)
			move_set_xpos(560, 40, CURVE_FAST_TO_SLOW);
	}
}
#endregion