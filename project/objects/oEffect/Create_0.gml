///@desc Setup particle properties

/*
	The functions listed in this create event allow you to set up and
	customize an effect. An effect is basically just an object with a
	set lifetime that can apply animation curves to its alpha, scale,
	position, and angle to add some unique visual flare to your project.
*/

/* The lifetime of this effect object, measured in frames.
This should be set first, as some of the animation functions rely on it.
If you set the lifetime to -1, the effect will last forever.*/
lifetime = 50 / global.fps_adjust;

/*Defines an x, y, and angle offset for the drawing of this effect object.
These can be linked or animated. I use these, but you probably won't need them.*/
xoffset = 0;
yoffset = 0;
angleoffset = 0;

/*
	This region sets up the animation module system, and defines each of
	the modules. More modules can be added if necessary.
*/
#region Setup Animation Modules
//Defines modules
enum EFFECT_MODULES {
	X,
	Y,
	XSCALE,
	YSCALE,
	ANGLE,
	ALPHA,
	XOFFSET,
	YOFFSET,
	ANGLEOFFSET,
	length
}

//Sets the value of a module's corresponding attribute.
set_module_attribute = function(module, value) {
	switch module {
		case EFFECT_MODULES.X:
			x = value;
			break;
		case EFFECT_MODULES.Y:
			y = value;
			break;
		case EFFECT_MODULES.XSCALE:
			image_xscale = value;
			break;
		case EFFECT_MODULES.YSCALE:
			image_yscale = value;
			break;
		case EFFECT_MODULES.ANGLE:
			image_angle = value;
			break;
		case EFFECT_MODULES.ALPHA:
			image_alpha = value;
			break;
		case EFFECT_MODULES.XOFFSET:
			xoffset = value;
			break;
		case EFFECT_MODULES.YOFFSET:
			yoffset = value;
			break;
		case EFFECT_MODULES.ANGLEOFFSET:
			angleoffset = value;
			break;
	}
}

//Returns the value of a module's corresponding attribute in a given object.
get_module_attribute = function(module, object) {
	switch module {
		case EFFECT_MODULES.X: 
			return object.x;
			break;
		case EFFECT_MODULES.Y:
			return object.y;
			break;
		case EFFECT_MODULES.XSCALE:
			return object.image_xscale;
			break;
		case EFFECT_MODULES.YSCALE: 
			return object.image_yscale;
			break;
		case EFFECT_MODULES.ANGLE:
			return object.image_angle;
			break;
		case EFFECT_MODULES.ALPHA: 
			return object.image_alpha;
			break;
		case EFFECT_MODULES.XOFFSET:
			return object.xoffset;
			break;
		case EFFECT_MODULES.YOFFSET:
			return object.yoffset;
			break;
		case EFFECT_MODULES.ANGLEOFFSET:
			return object.angleoffset;
			break;
	}
}

//Defines animation module struct
animation_module = function() constructor {
	//Setup animation
	active = false;
	anim_start = 0;
	anim_end = 0;
	anim_percent = 0;
	anim_rate = 0;
	anim_curve = 0;
	anim_delay = 0;
	
	//Setup linking
	is_linked = false;
	link_object = noone;
	link_destroy = false;
}

//Creates module array
modules = array_create(EFFECT_MODULES.length, 0);
for (var i = 0; i < array_length(modules); i ++)
	modules[i] = new animation_module();
#endregion

/*
	This region contains all of the functions needed to actually set up 
	the effect's animation sequence. This is done by activating and configuring
	the attributes of the different animation modules. You can also link certain
	attributes to corresponding attributes of other objects.
*/
#region Animation Functions
/*Adds a given module's animation with the specified starting value, 
ending value, duration, animation curve, and delay.*/
add_animation = function(module, anim_start, anim_end, anim_duration, anim_curve, anim_delay) {
	var current_module = modules[module];
	current_module.active = true;
	current_module.anim_start = anim_start;
	current_module.anim_end = anim_end;
	current_module.anim_rate = 1 / anim_duration;
	current_module.anim_curve = anim_curve;
	current_module.anim_delay = anim_delay;
	set_module_attribute(module, anim_start);
}

/*Adds a given module's animation with a constant rate of change.
This is calculated based on the effect's lifetime, 
and will not work if it is set to -1.*/
add_animation_rate = function(module, anim_rate, anim_delay) {
	var current_module = modules[module];
	current_module.active = true;
	current_module.anim_start = get_module_attribute(module, self);
	var duration = max(lifetime - anim_delay, 1);
	current_module.anim_end = current_module.anim_start + (anim_rate * duration);
	current_module.anim_rate = 1 / duration;
	current_module.anim_curve = CURVE_LINEAR;
	current_module.anim_delay = anim_delay;
}

/*Link's a given module's attribute to another object's corresponding attribute.
Can also set whether or not the object will be destroyed if it's linked object is.*/
link = function(module, link_object, link_destroy) {
	var current_module = modules[module];
	current_module.is_linked = true;
	current_module.link_object = link_object;
	current_module.link_destroy = link_destroy;
}
#endregion