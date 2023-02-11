#region Creation Stub
//The trigger signal that activates this reciever.
reciever_id = "s4_end3";

/*The instance that this reciever will apply its code to.
By default it will apply the code to itself.*/
target = oAvoidanceKiller;

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
		if place_meeting(x, y, other) {
			with instance_create_depth(x, y, depth, oEffect) {
				sprite_index = other.sprite_index;
				image_index = other.image_index;
				image_xscale = other.image_xscale;
				image_yscale = other.image_yscale;
				image_blend = other.image_blend;
				image_speed = 0;
				add_animation_rate(EFFECT_MODULES.ALPHA, -0.1, 0);
			}
			instance_destroy();
		}
	}
}
#endregion