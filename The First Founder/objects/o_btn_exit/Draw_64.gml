var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;

x = _cx;
y = _cy + 60;

if (room == rm_menu) {
	draw_self();
	draw_text(x, y, "EXIT");
}