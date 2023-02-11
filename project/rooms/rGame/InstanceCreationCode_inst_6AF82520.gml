#region Creation Stub
//The trigger signal that activates this reciever.
reciever_id = "s5_generator2";

//The trigger signal this timer will send out when it goes off.
trigger_id = "s5_generator2";

//The length of this timer, in frames.
length = 55 * global.fps_adjust;
#endregion

on_trigger();