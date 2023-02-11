/// @description Process timer

if (count > 0)
	count --;
else if can_trigger {
	can_trigger = false;
	trigger(trigger_id);
}