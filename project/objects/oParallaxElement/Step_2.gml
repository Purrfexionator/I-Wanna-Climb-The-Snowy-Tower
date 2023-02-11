///@desc Manage parallax scrolling

if global.game_paused exit;

//Scrolling
var backid = layer_background_get_id(parallax_layer);
var xmax = sprite_get_width(layer_background_get_sprite(backid));
var ymax = sprite_get_height(layer_background_get_sprite(backid));
xoffset = (xoffset + parallax_hspd) % xmax;
yoffset = (yoffset + parallax_vspd) % ymax;

//Parallax
var xpoint = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
var ypoint = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;
layer_x(parallax_layer, xoffset + lerp(0, xpoint, parallax_percent));
layer_y(parallax_layer, yoffset + lerp(0, ypoint, parallax_percent));