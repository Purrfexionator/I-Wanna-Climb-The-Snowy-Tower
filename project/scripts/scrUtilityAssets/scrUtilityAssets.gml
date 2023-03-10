/*
	Asset dependent utility functions
*/

///@desc Creates a spawner with the specified parameters
///@func spawner_create(x, y, obj, xoff, yoff, spd, rate, ahead, [ahead_off], [ahead_len])
///@arg {real} x
///@arg {real} y
///@arg {real} obj
///@arg {real} hs
///@arg {real} vs
///@arg {real} xoff
///@arg {real} yoff
///@arg {real} rate
///@arg {real} off
///@arg {real} ahead
function spawner_create(xx, yy, obj, hs, vs, xoff, yoff, rate, off, ahead) {

	var spawner = instance_create_layer(xx, yy, layer, oSpawner)
	
	with (spawner) {
		spawner.object = obj
		spawner.hs = hs
		spawner.vs = vs
		spawner.xoffset = xoff
		spawner.yoffset = yoff
		spawner.rate = rate
		spawner.offset = off
		spawner.ahead = ahead
		
		adjust()
		prespawn()
	}

	return spawner
}

///@desc Creates a field that will destroy the specified object that enters it
///@func spawner_create_destroyer(x, y, obj, xscale, yscale)
///@arg {real} x
///@arg {real} y
///@arg {real} w
///@arg {real} y
///@arg {real} obj
function spawner_create_destroyer(xx, yy, w, h, obj) {
	var destroyer = instance_create_layer(xx, yy, layer, oDestroyer)
	instance_set_width(destroyer, w)
	instance_set_height(destroyer, h)
	destroyer.object = obj
	return destroyer
}

///@desc Signals all trigger recievers with the specified id
///@func trigger(trigger_id)
///@arg {real} trigger_id		The id of the reciever(s) to activate
function trigger(trigger_id) {
	with oRecieverParent if (active && reciever_id == trigger_id) on_trigger();	
}