function ExecuteCommand(_cmd, _tx, _ty, _gx, _gy){
	var  _nearest = instance_nearest(_tx, _ty, o_human);
	if (_nearest == noone) return;
	
	if (instance_exists(o_click_marker)) {
        instance_destroy(o_click_marker);
    }
	
	with (_nearest) {
		if (_cmd == global.CMD_WALK) {
			instance_create_depth(_tx, _ty, depth - 1, o_click_marker);
			target_x = _tx;
			target_y = _ty;
			state = global.STATE_WALKING;
		}
		
		if (_cmd == global.CMD_GATHER) {
			// Calculate center of tile
            var _centerX = (_gx * 64) + 32;
            var _centerY = (_gy * 64) + 32;
            
            // Create marker at the center of the bush
            instance_create_depth(_centerX, _centerY, depth - 1, o_click_marker);
			
			target_x = (_gx * 64) + 32;
			target_y = (_gy * 64) + 32;
			job_tile_x = _gx;
			job_tile_y = _gy;
			state  = global.STATE_WALKING_WORK;
		}
	}
}