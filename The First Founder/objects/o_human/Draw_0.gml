draw_self();

if (state == "walking") {
	draw_set_alpha(0.3);
	draw_line_colour(x, y, target_x, target_y, c_white, c_white);
	draw_set_alpha(1.0);
}