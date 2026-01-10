var _target_x = mouse_x;
var _target_y = mouse_y;

// Find the nearest human to the click location
var _nearest_human = instance_nearest(_target_x, _target_y, o_human);

// Only give the command if a human exists and is idle
if (_nearest_human != noone){
	with (_nearest_human) {
		if (state == "idle") {
			target_x = _target_x;
			target_y = _target_y;
			state = "walking";
		}
	}
}

// Create temporary "Click marker" effect
instance_create_layer(_target_x, _target_y, "Instances_2", o_click_marker)