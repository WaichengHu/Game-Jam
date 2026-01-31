
if (!instance_exists(obj_transicion)) {
	if (dash) {
	    player_dash();
	}
	else {
		if (gravedad_normal) {
		   player_normal();
		} else {
			player_reversed();
		}

	}
} else {
	image_speed = 0;
	hspeed = 0;
	vspeed = 0;
}
