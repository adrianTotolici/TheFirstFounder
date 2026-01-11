draw_self();

// 2. Draw path line
if (state == global.STATE_WALKING || state == global.STATE_WALKING_WORK) {
    draw_set_alpha(0.3);
    draw_line_colour(x, y, target_x, target_y, c_white, c_white);
    draw_set_alpha(1.0);
}

// 3. Resource Bubble
var _show_berries = (inventory_berries > 0);
var _show_leaves  = (inventory_leaves > 0);

if (_show_berries || _show_leaves) {
    var _bob = sin(current_time / 200) * 4;
    var _icon_y = y - 55 + _bob; // Adjusted height
    var _bubble_r = 14;
    
    // Choose what to display
	// 2. Logic: Prioritize showing one icon at a time
    var _img = -1;
    var _qty = 0;
	
	if (_show_berries) {
        _img = 1; // Sub-image for Berry
        _qty = inventory_berries;
    } else if (_show_leaves) {
        _img = 2; // Sub-image for Leaf
        _qty = inventory_leaves;
    }

	// 3. Draw the visuals ONLY if an icon was assigned
    if (_img != -1) {
        // Draw Background Circle
        draw_set_colour(c_black);
        draw_set_alpha(0.6);
        draw_circle(x, _icon_y, _bubble_r, false);
        
        // Draw White Outline
        draw_set_colour(c_white);
        draw_set_alpha(1);
        draw_circle(x, _icon_y, _bubble_r, true);
        
        // Draw the Sprite (using your specific offsets)
        draw_sprite_ext(spr_res_ic_ts, _img, x - 15, _icon_y - 7, 0.4, 0.4, 0, c_white, 1);
        
        // Draw the Text with a small shadow
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        
        draw_set_color(c_black);
        draw_text_transformed(x + 3, _icon_y + 1, string(_qty), 0.7, 0.7, 0);
        
        draw_set_color(c_white);
        draw_text_transformed(x + 2, _icon_y, string(_qty), 0.7, 0.7, 0);
    }
}

// Reset drawing settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);