// Keyboard
var _move_x = (keyboard_check(ord("D")) - keyboard_check(ord("A")));
var _move_y = (keyboard_check(ord("S")) - keyboard_check(ord("W")));

cam_x += _move_x * cam_speed;
cam_y += _move_y * cam_speed;

// Mouse
if (mouse_check_button(mb_middle)) {
	cam_x -= window_mouse_get_delta_x();
	cam_y -= window_mouse_get_delta_y();
}

// Keep camera inside Room Bounds
cam_x = clamp(cam_x, 0, room_width - camera_get_view_width(view_camera[0]));
cam_y = clamp(cam_y, 0, room_height - camera_get_view_height(view_camera[0]));


// Apply the position to the actual camera
camera_set_view_pos(view_camera[0], cam_x, cam_y);