var _gui_x = target_x - camera_get_view_x(view_camera[0]);
var _gui_y = target_y - camera_get_view_y(view_camera[0]);

for (var i = 0; i < array_length(option);  i++) {
	var _x1 = _gui_x;
	var _y1 = _gui_y + (i * item_h);
	var _x2 = _x1 + width;
	var _y2 = _y1 + item_h;
	
	//Check if cliked or hover
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	
	var _hover = point_in_rectangle(_mx, _my, _x1, _y1, _x2 ,_y2);
	
	// Draw button
	draw_set_colour(_hover ? c_ltgray : c_dkgray);
	draw_rectangle(_x1, _y1, _x2, _y2, false);
	draw_set_colour(c_white);
	draw_rectangle(_x1, _y1, _x2, _y2, true);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_colour(c_yellow);
	draw_text(_x1+10, _y1+8, option[i]);
	
	// 2. CLEAN UP
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	
	//Handle click
	if (_hover && mouse_check_button_pressed(mb_left)) {
		ExecuteCommand(option[i], target_x, target_y, grid_x, grid_y);
		instance_destroy();
	}
}

//close menu if clicked someware elese
if (mouse_check_button_pressed(mb_left) && !point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),  _gui_x, _gui_y, _gui_x + width, _gui_y + (array_length(option) * item_h))) {
	instance_destroy();
}