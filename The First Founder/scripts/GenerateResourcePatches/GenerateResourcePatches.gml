/// @function					generate_resource_patches(_count, _visual_id, _resource_name, _min_res, _max_res)
/// @param {real} _count		Number of patches to create
/// @param {real} _visual_id	The Tile ID (e.g. TILE_GRASS_FLOWERS)
/// @param {string} _res_name	The name of the struct variable (e.g. "berries")
/// @param {real} _min_res		Min amount per tile
/// @param {real} _max_res		Max amount per tile

function generate_resource_patches(_count, _visual_id, _res_name, _min_res, _max_res, _overwrite) {
	var _w = ds_grid_width(global.map_data);
	var _h = ds_grid_height(global.map_data);

	repeat(_count) { 
	    var _seed_x = irandom(_w - 1);
	    var _seed_y = irandom(_h - 1);
	    var _patch_size = irandom_range(3, 8);
	    
	    for (var i = 0; i < _patch_size; i++) {
	        var _target_x = clamp(_seed_x + irandom_range(-1, 1), 0, _w - 1);
	        var _target_y = clamp(_seed_y + irandom_range(-1, 1), 0, _h - 1);
	        
	        var _cell = global.map_data[# _target_x, _target_y];
	        
	        if (is_struct(_cell)) {
                // Only place if we are allowed to overwrite, or if the tile is currently just grass
                if (_overwrite || _cell._visual_id == TILE_GRASS) {
                    _cell.visual_id = _visual_id;
				
    				// Only add resource data if a name was actually provided
    				if (_res_name != "") {
    				    var _amount = irandom_range(_min_res, _max_res);
    				    variable_struct_set(_cell, _res_name, _amount);
    				}
                }
	        }
	    }
	}
}