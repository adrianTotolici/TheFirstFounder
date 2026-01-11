var _margin = 20;
var _gui_w = display_get_gui_width();

x = _gui_w - 100;
y = _margin + 40;

if (room == rm_game) {
	draw_self();
	// 2. CLEAN UP
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text(x-20, y-10, "MENU");
}
