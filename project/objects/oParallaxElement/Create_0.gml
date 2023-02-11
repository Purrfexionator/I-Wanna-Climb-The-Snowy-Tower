///@desc Setup parallax element

/*
	This is a region of code that you can copy paste into the 
	instance creation code to make setting up objects easier.
	Also handy for create events of child objects.
*/
#region Creation Stub
//The layer to apply parallax to.
parallax_layer = layer;

//The percent of parallax to apply.
parallax_percent = 0.5;

//The horizontal speed of the layer.
parallax_hspd = 0;

//The vertical speed of the layer.
parallax_vspd = 0;
#endregion

/*
	Everything from this point forward is just additonal object setup 
	that you shouldnt' need to worry about too much.
*/

//Setup parallax offset
xoffset = 0;
yoffset = 0;