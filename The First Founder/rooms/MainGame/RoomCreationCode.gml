// 1. Get the screen dimensions
var _screen_w = display_get_width();
var _screen_h = display_get_height();

// 2. Decide how much of the "world" you want to see (Zoom level)
// Let's say we want the height to always show 1080 pixels of game world
var _ideal_height = 2048; 
var _aspect_ratio = _screen_w / _screen_h;
var _ideal_width = round(_ideal_height * _aspect_ratio);

// 3. Apply this to your camera
camera_set_view_size(view_camera[0], _ideal_width, _ideal_height);

// 4. Update the surface to match exactly
surface_resize(application_surface, _screen_w, _screen_h);

display_set_gui_size(_screen_w, _screen_h);
