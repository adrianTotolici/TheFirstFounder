if (state == global.STATE_WALKING) {
	var _dist = point_distance(x, y, target_x, target_y);
	
	//Move towards destination
	if (_dist > move_speed){
		move_towards_point(target_x, target_y, move_speed);
		sprite_index = spr_human_walk;
	} else {
		// Arrived
		speed = 0;
		x = target_x;
		y = target_y;
		state  = global.STATE_IDLE;
	}
}

if (state == global.STATE_IDLE) {
	sprite_index = spr_human_idle;
	speed = 0;
}

if (hspeed !=0) image_xscale = sign(hspeed);

// --- STATE: WALKING TO WORK ---
if (state == global.STATE_WALKING_WORK) {
    var _dist = point_distance(x, y, target_x, target_y);
    if (_dist > move_speed) {
        move_towards_point(target_x, target_y, move_speed);
        sprite_index = spr_human_walk;
    } else {
        speed = 0;
        x = target_x;
        y = target_y;
        state = global.STATE_GATHER; 
        work_timer = 0;
    }
}

// --- STATE: GATHERING ---
if (state == global.STATE_GATHER) {
    sprite_index = spr_human_idle; 
    work_timer++;
    
    if (work_timer >= 60) { 
	    var _cell = global.map_data[# job_tile_x, job_tile_y];
	    if (is_struct(_cell)) {
        
	        var _got_berries = variable_struct_get(_cell, global.RES_BERRIES) ?? 0;
	        var _got_leaves  = variable_struct_get(_cell, global.RES_LEAVES)  ?? 0;

	        // --- NEW: Single Resource Logic ---
        
	        // Only take berries if we aren't carrying leaves
	        if (_got_berries > 0 && inventory_leaves == 0) {
	            inventory_berries += _got_berries;
	            _cell.berries = 0; // Empty the tile
	            show_debug_message("Collected Berries. Inventory is now: " + string(inventory_berries));
	        } 
	        // Only take leaves if we aren't carrying berries
	        else if (_got_leaves > 0 && inventory_berries == 0) {
	            inventory_leaves += _got_leaves;
	            _cell.leaves = 0; // Empty the tile
	            show_debug_message("Collected Leaves. Inventory is now: " + string(inventory_leaves));
	        }
	        else {
	            show_debug_message("Hands full with a different resource! Cannot collect.");
	        }
        
	        // Only change tile to grass if it's actually empty now
	        if ((variable_struct_get(_cell, global.RES_BERRIES) ?? 0) == 0 && 
	            (variable_struct_get(_cell, global.RES_LEAVES) ?? 0) == 0) {
            
	            _cell.visual_id = TILE_GRASS;
	            var _map_id = layer_tilemap_get_id(layer_get_id("MapLayer"));
	            tilemap_set(_map_id, TILE_GRASS, job_tile_x, job_tile_y);
	        }
			
			if (inventory_berries >= max_inventory_size || inventory_leaves >= max_inventory_size) {
				 full_hands = true;
			}
		}
    
		work_timer = 0;
		if (inventory_berries > 0 || inventory_leaves > 0) {
		    // Logic to find a stockpile could go here
		    state = global.STATE_IDLE; 
		} else {
		    state = global.STATE_IDLE;
		}
	}
}