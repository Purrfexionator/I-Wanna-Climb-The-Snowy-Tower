#region Creation Stub
//The trigger signal that activates this reciever.
reciever_id = "s1_platform";

/*The instance that this reciever will apply its code to.
By default it will apply the code to itself.*/
target = instance_get_nearest(oWater);

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
		with instance_create_depth(x, y, depth, oEffect) {
			sprite_index = other.sprite_index;
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
			add_animation_rate(EFFECT_MODULES.ALPHA, -0.1, 0);
		}
		instance_destroy();
	}
}
#endregion