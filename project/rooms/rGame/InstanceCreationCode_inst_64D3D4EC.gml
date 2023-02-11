#region Creation Stub
//The trigger signal that activates this reciever.
reciever_id = "s3_generator";

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
		with instance_launch_layer(0, -2, "Instances_Below", oCherry) {
			image_xscale = 0.7;
			image_yscale = 0.7;
		}
	}
}
#endregion

trigger_code();