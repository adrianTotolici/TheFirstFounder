target_x = 0;
target_y = 0;
grid_x = 0;
grid_y = 0;

//Menu steup
width  = 140;
item_h = 32;
option = [global.CMD_WALK]; 

// Wait 1 frame for o_camera to set our grid_x and grid_y
alarm[0] = 1;

/***
// Check the map data to see if there are other options
var _cell = global.map_data[# grid_x, grid_y];
if (is_struct(_cell)) {
	var _tile_has_berries = (variable_struct_get(_cell, global.RES_BERRIES) ?? 0) > 0;
	var _tile_has_leaves  = (variable_struct_get(_cell, global.RES_LEAVES)  ?? 0) > 0;
	if (_tile_has_berries || _tile_has_leaves ) {
	    // 2. Resource Compatibility Check
	    var _can_gather = true;
	    // Block if trying to pick berries while holding leaves
	    if (_tile_has_berries && inventory_leaves > 0) {
			 _can_gather = false;
	         show_debug_message("Rejected: Human carrying leaves, cannot pick berries.");
	    } else if (_tile_has_leaves && inventory_berries > 0) {
			_can_gather = false;
	        show_debug_message("Rejected: Human carrying berries, cannot pick leaves.");
		}
	    // 3. Assign Job only if compatible
		if (_can_gather) {
			job_tile_x = _gx;
	        job_tile_y = _gy;
	        target_x = _gx * 16 + 8; // Assumes 16x16 tiles, centered
			target_y = _gy * 16 + 8;
	        array_push(option, global.CMD_GATHER);
	    } 
	}
}