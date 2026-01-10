var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _cx = _gui_w / 2;
var _game_name = "The First Founder"
var _game_version = "v0.1"

// --- DRAW GAME TITLE ---
draw_set_font(-1); // Replace -1 with your Title Font asset if you have one
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw a simple shadow first
draw_set_color(c_black);
draw_text_transformed(_cx + 4, 154, _game_name, 3, 3, 0); 

// Draw the main title text
draw_set_color(c_orange);
draw_text_transformed(_cx, 150, _game_name, 3, 3, 0);


// --- DRAW VERSION NUMBER ---
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(c_white);

draw_text(_gui_w - 20, _gui_h - 20, _game_version);