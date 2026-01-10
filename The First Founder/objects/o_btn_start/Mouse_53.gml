// 1. Get Mouse GUI position
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// 2. Define the button area based on your Draw GUI coordinates
var _w = sprite_width / 2;
var _h = sprite_height / 2;

// Check if mouse is inside the button sprite area
if (point_in_rectangle(_mx, _my, x - _w, y - _h, x + _w, y + _h)) {
    if (room == rm_menu) {
        room_goto(rm_game);
    }
}