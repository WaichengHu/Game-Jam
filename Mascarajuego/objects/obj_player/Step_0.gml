
if (!instance_exists(obj_transicion)) {
	if (dash) {
	    player_dash();
	}
	else {
	    player_normal();
	}
} else {
	image_speed = 0;
	hspeed = 0;
	vspeed = 0;
}
