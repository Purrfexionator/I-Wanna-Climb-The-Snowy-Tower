#region Creation Stub
//The trigger signal that activates this reciever.
reciever_id = "s2_generator";

//The trigger signal this timer will send out when it goes off.
trigger_id = "s2_generator";

//The length of this timer, in frames.
length = 50 * global.fps_adjust;
#endregion

on_trigger();