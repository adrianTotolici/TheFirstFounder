if (state == "walking") {
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
		state  = "idle";
	}
}

if (state == "idle") {
	sprite_index = spr_human_idle;
	speed = 0;
}

if (hspeed !=0) image_xscale = sign(hspeed);