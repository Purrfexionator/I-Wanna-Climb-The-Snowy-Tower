#region Creation Stub
//The trigger signal that activates this reciever.
reciever_id = "s3_spike1";

/*The instance that this reciever will apply its code to.
By default it will apply the code to itself.*/
target = inst_5BE4F41B;

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
		move_set_xdist(32, 20, CURVE_CUBIC_OUT);
	}
}
#endregion