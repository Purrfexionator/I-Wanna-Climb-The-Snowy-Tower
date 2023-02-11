///@desc Process particle animations

//Process lifetime
if (lifetime > 0)
	lifetime = max(lifetime - 1, 0);
else if (lifetime == 0)
	instance_destroy();

//Process animation modules
for (var i = 0; i < array_length(modules); i ++) {
	var current_module = modules[i]
	if current_module.active {
		if (current_module.anim_delay > 0)
			current_module.anim_delay --;
		else {
			var amount = animcurve_channel_evaluate(current_module.anim_curve, current_module.anim_percent);
			var value = lerp(current_module.anim_start, current_module.anim_end, amount);
			set_module_attribute(i, value);
			current_module.anim_percent = min(current_module.anim_percent + current_module.anim_rate, 1);
		}
	}
}