///@desc Process movement

if instance_exists(host) {
	percent = min(percent + rate, 1)
	var amount = animcurve_channel_evaluate(curve, percent)
	host.x = lerp(startpos, endpos, amount)
	if (percent == 1) instance_destroy();
} else instance_destroy();