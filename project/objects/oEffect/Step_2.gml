///@desc Process linked attributes

//Link animation modules
for (var i = 0; i < array_length(modules); i ++) {
	var current_module = modules[i]
	if current_module.is_linked
		if instance_exists(current_module.link_object)
			set_module_attribute(i, get_module_attribute(i, current_module.link_object));
		else if current_module.link_destroy
			instance_destroy();
}