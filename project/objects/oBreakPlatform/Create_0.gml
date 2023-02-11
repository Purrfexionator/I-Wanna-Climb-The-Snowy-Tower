// Inherit the parent event
event_inherited();

#region Creation Stub
//Decides if the platform should be snapping.
can_snap = false;

/*Decides if the platform should stil drag the player 
even if they aren't standing directly on it.*/
can_drag = false;

//Decides if the platform should move the player at all.
can_move = false;

//Called when the player touches the platform.
on_touch = function() {
	//Function code goes here
}

//Called when the player jumps from the platform.
on_jump = function() {
	//Function code goes here
	with instance_create_depth(x, y, depth, oEffect) {
		sprite_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		image_angle = other.image_angle;
		hspeed = random_range(-1, 1);
		vspeed = random_range(-2, -3);
		gravity = 0.2;
		add_animation_rate(EFFECT_MODULES.ANGLE, random_range(0.5, 2) * choose(-1, 1), 0);
		add_animation_rate(EFFECT_MODULES.ALPHA, -0.05, 0);
	}
	sfx_play_sound(sndShatter);
	instance_destroy();
}
#endregion

depth ++;