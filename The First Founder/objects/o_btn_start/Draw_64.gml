var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;

x = _cx;
y = _cy - 40;

if (room == rm_menu) {
	draw_self();
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y, "START GAME");
}

