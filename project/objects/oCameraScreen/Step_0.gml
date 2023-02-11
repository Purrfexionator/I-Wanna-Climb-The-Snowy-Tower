///@desc Check target and bound camera

//Skip if target doesn't exist
if !instance_exists(target) exit;

if point_in_bounds(target.x, target.y) {
	//Apply camera bounds on entrance
	if !touching {
		touching = true;
		apply_bounds();
	}
} else if touching {
	//Reset touching
	touching = false;
	
	//Check all other screen areas in contact with the target, and pick the smallest one
	var smallest = 0;
	with oCameraScreen if (touching && target == other.target)
		if (get_area() < smallest || smallest == 0) {
			smallest = get_area();
			apply_bounds();
		}
}