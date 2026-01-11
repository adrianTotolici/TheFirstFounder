// 1. Set grid positions
grid_x = floor(x / 16);
grid_y = floor(y / 16);

// 2. Get the cell data
var _cell = global.map_data[# grid_x, grid_y];

if (is_struct(_cell)) {
    var _tile_is_berry = (_cell[$ global.RES_BERRIES] ?? 0) > 0;
    var _tile_is_leaf  = (_cell[$ global.RES_LEAVES]  ?? 0) > 0;
    
    // Only search if there's actually something to pick up
    if (_tile_is_berry || _tile_is_leaf) {
        
        // 3. Sort ALL humans by distance from this menu
        var _pq = ds_priority_create();
        with (o_human) {
            ds_priority_add(_pq, id, point_distance(x, y, other.x, other.y));
        }

        var _found_valid_worker = false;

        // 4. Check humans one by one starting from the closest
        while (!ds_priority_empty(_pq)) {
		    var _check_human = ds_priority_delete_min(_pq);
    
		    var _can_do_job = false;
    
		    // Check if hands are NOT full
		    if (!_check_human.full_hands) {
        
		        // If it's a berry tile: they can take it if they have 0 leaves
		        if (_tile_is_berry && _check_human.inventory_leaves == 0) {
		            _can_do_job = true;
		        } 
		        // If it's a leaf tile: they can take it if they have 0 berries
		        else if (_tile_is_leaf && _check_human.inventory_berries == 0) {
		            _can_do_job = true;
		        }
		    }

		    if (_can_do_job) {
		        _found_valid_worker = true;
		        // DO NOT set full_hands = true here. 
		        // Only set it in the Step Event once they actually finish gathering!
		        break; 
		    }
		}

        // 5. Cleanup memory
        ds_priority_destroy(_pq);

        // 6. Show the button only if a valid worker was found
        if (_found_valid_worker) {
            array_push(option, global.CMD_GATHER);
        }
    }
}