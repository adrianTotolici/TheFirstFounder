// This runs every time a new room begins
var _screen_w = display_get_width();
var _screen_h = display_get_height();

// 2. Center the window again to ensure it's not offset
window_set_size(_screen_w, _screen_h);

// 3. Update the Camera to match the new surface shape
if (view_enabled && view_visible[0]) {
	var _ideal_height = 2054; 
	var _aspect_ratio = _screen_w / _screen_h;
	var _ideal_width = round(_ideal_height * _aspect_ratio);
	
    camera_set_view_size(view_camera[0],_ideal_width, _ideal_height);
}

// 4. Update the surface to match exactly
surface_resize(application_surface, _screen_w, _screen_h);

// 5. Force the GUI to match so buttons aren't stretched
display_set_gui_size(_screen_w, _screen_h);